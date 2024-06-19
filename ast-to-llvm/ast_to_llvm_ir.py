import ast
from llvmlite import ir

# Base class for all AST nodes
class ASTNode:
    def __init__(self):
        pass

    def codegen(self, builder, module, named_values):
        raise NotImplementedError("Code generation not implemented for this node.")

# Class for integer literals
class IntNode(ASTNode):
    def __init__(self, value):
        self.value = value

    def codegen(self, builder, module, named_values):
        return ir.Constant(ir.IntType(32), self.value)

# Class for float literals
class FloatNode(ASTNode):
    def __init__(self, value):
        self.value = value

    def codegen(self, builder, module, named_values):
        return ir.Constant(ir.FloatType(), self.value)

# Class for string literals
class StringNode(ASTNode):
    def __init__(self, value):
        self.value = value

    def codegen(self, builder, module, named_values):
        return ir.Constant(ir.ArrayType(ir.IntType(8), len(self.value)), bytearray(self.value, 'utf8'))

# Class for array literals
class ArrayNode(ASTNode):
    def __init__(self, elements):
        self.elements = elements

    def codegen(self, builder, module, named_values):
        element_count = len(self.elements)
        array_type = ir.LiteralStructType([ir.IntType(32), ir.ArrayType(ir.IntType(32), element_count)])
        array_ptr = builder.alloca(array_type, name="array")
        length_ptr = builder.gep(array_ptr, [ir.Constant(ir.IntType(32), 0), ir.Constant(ir.IntType(32), 0)])
        builder.store(ir.Constant(ir.IntType(32), element_count), length_ptr)
        data_ptr = builder.gep(array_ptr, [ir.Constant(ir.IntType(32), 0), ir.Constant(ir.IntType(32), 1)])
        for i, element in enumerate(self.elements):
            element_ptr = builder.gep(data_ptr, [ir.Constant(ir.IntType(32), 0), ir.Constant(ir.IntType(32), i)])
            builder.store(element.codegen(builder, module, named_values), element_ptr)
        return array_ptr

# Class for binary operations (e.g., addition, subtraction)
class BinOpNode(ASTNode):
    def __init__(self, left, op, right):
        self.left = left
        self.op = op
        self.right = right

    def codegen(self, builder, module, named_values):
        left_val = self.left.codegen(builder, module, named_values)
        right_val = self.right.codegen(builder, module, named_values)
        if self.op == '+':
            return builder.add(left_val, right_val, 'addtmp')
        elif self.op == '-':
            return builder.sub(left_val, right_val, 'subtmp')
        elif self.op == '*':
            return builder.mul(left_val, right_val, 'multmp')
        elif self.op == '/':
            return builder.sdiv(left_val, right_val, 'divtmp')
        else:
            raise ValueError(f"Unknown binary operator {self.op}")

# Class for comparison operations (e.g., ==, !=, <, <=, >, >=)
class ComparisonNode(ASTNode):
    def __init__(self, left, op, right):
        self.left = left
        self.op = op
        self.right = right

    def codegen(self, builder, module, named_values):
        left_val = self.left.codegen(builder, module, named_values)
        right_val = self.right.codegen(builder, module, named_values)
        if self.op == '==':
            return builder.icmp_signed('==', left_val, right_val, 'cmptmp')
        elif self.op == '!=':
            return builder.icmp_signed('!=', left_val, right_val, 'cmptmp')
        elif self.op == '<':
            return builder.icmp_signed('<', left_val, right_val, 'cmptmp')
        elif self.op == '<=':
            return builder.icmp_signed('<=', left_val, right_val, 'cmptmp')
        elif self.op == '>':
            return builder.icmp_signed('>', left_val, right_val, 'cmptmp')
        elif self.op == '>=':
            return builder.icmp_signed('>=', left_val, right_val, 'cmptmp')
        else:
            raise ValueError(f"Unknown comparison operator {self.op}")

# Class for variable nodes
class VarNode(ASTNode):
    def __init__(self, name):
        self.name = name

    def codegen(self, builder, module, named_values):
        var = named_values.get(self.name)
        if not var:
            raise ValueError(f"Variable {self.name} not found in scope.")
        return builder.load(var, self.name)

# Class for if statements
class IfNode(ASTNode):
    def __init__(self, condition, then_body, else_body=None):
        self.condition = condition
        self.then_body = then_body
        self.else_body = else_body

    def codegen(self, builder, module, named_values):
        cond_val = self.condition.codegen(builder, module, named_values)
        then_block = builder.append_basic_block('then')
        else_block = builder.append_basic_block('else') if self.else_body else None
        merge_block = builder.append_basic_block('ifcont')

        builder.cbranch(cond_val, then_block, else_block or merge_block)

        # Then block
        builder.position_at_end(then_block)
        for stmt in self.then_body:
            stmt.codegen(builder, module, named_values)
        builder.branch(merge_block)
        then_block = builder.block

        # Else block
        if self.else_body:
            builder.position_at_end(else_block)
            for stmt in self.else_body:
                stmt.codegen(builder, module, named_values)
            builder.branch(merge_block)
            else_block = builder.block

        # Merge block
        builder.position_at_end(merge_block)
        return None

# Class for for loops
class ForNode(ASTNode):
    def __init__(self, var, iterable, body):
        self.var = var
        self.iterable = iterable
        self.body = body

    def codegen(self, builder, module, named_values):
        start_val = ir.Constant(ir.IntType(32), 0)
        end_val = self.iterable.codegen(builder, module, named_values)
        loop_var = builder.alloca(ir.IntType(32), name=self.var)
        builder.store(start_val, loop_var)
        named_values[self.var] = loop_var

        preheader_block = builder.block
        loop_block = builder.append_basic_block('loop')
        builder.branch(loop_block)

        builder.position_at_end(loop_block)
        loop_var_val = builder.load(loop_var, name=self.var)
        for stmt in self.body:
            stmt.codegen(builder, module, named_values)
        next_val = builder.add(loop_var_val, ir.Constant(ir.IntType(32), 1), 'nextvar')
        builder.store(next_val, loop_var)
        end_cond = builder.icmp_signed('<', next_val, end_val, 'loopcond')

        after_loop_block = builder.append_basic_block('afterloop')
        builder.cbranch(end_cond, loop_block, after_loop_block)
        builder.position_at_end(after_loop_block)

        return None

# Class for function definitions
class FunctionDefNode(ASTNode):
    def __init__(self, name, args, body):
        self.name = name
        self.args = args
        self.body = body

    def codegen(self, module):
        # Define the function type
        array_struct_type = ir.LiteralStructType([ir.IntType(32), ir.ArrayType(ir.IntType(32), 0)])
        func_type = ir.FunctionType(ir.VoidType(), [ir.PointerType(array_struct_type) if arg == "lst" else ir.IntType(32) for arg in self.args])
        func = ir.Function(module, func_type, name=self.name)
        block = func.append_basic_block('entry')
        builder = ir.IRBuilder(block)
        named_values = {}

        for i, arg in enumerate(func.args):
            arg.name = self.args[i]
            if isinstance(arg.type, ir.PointerType):
                ptr = builder.alloca(arg.type.pointee, name=arg.name)
                builder.store(arg, ptr)
                named_values[arg.name] = ptr
            else:
                ptr = builder.alloca(arg.type, name=arg.name)
                builder.store(arg, ptr)
                named_values[arg.name] = ptr

        for stmt in self.body:
            stmt.codegen(builder, module, named_values)

        builder.ret_void()
        return func

# Class for function calls
class FunctionCallNode(ASTNode):
    def __init__(self, func_name, args):
        self.func_name = func_name
        self.args = args

    def codegen(self, builder, module, named_values):
        if self.func_name == "range":
            start = self.args[0].codegen(builder, module, named_values)
            if len(self.args) == 1:
                return start
            stop = self.args[1].codegen(builder, module, named_values)
            if len(self.args) == 2:
                return stop
            step = self.args[2].codegen(builder, module, named_values)
            return step
        elif self.func_name == "len":
            array_ptr = self.args[0].codegen(builder, module, named_values)
            length_ptr = builder.gep(array_ptr, [ir.Constant(ir.IntType(32), 0), ir.Constant(ir.IntType(32), 0)], inbounds=True)
            return builder.load(length_ptr, "len")
        else:
            func = module.globals.get(self.func_name, None)
            if not func:
                raise ValueError(f"Function {self.func_name} not declared.")
            call_args = [arg.codegen(builder, module, named_values) for arg in self.args]
            return builder.call(func, call_args, 'calltmp')

# Class for return statements
class ReturnNode(ASTNode):
    def __init__(self, value):
        self.value = value

    def codegen(self, builder, module, named_values):
        return builder.ret(self.value.codegen(builder, module, named_values))

# Class for assignment statements
class AssignNode(ASTNode):
    def __init__(self, targets, value):
        self.targets = targets
        self.value = value

    def codegen(self, builder, module, named_values):
        value = self.value.codegen(builder, module, named_values)
        for target in self.targets:
            if isinstance(target, VarNode):
                var_ptr = named_values.get(target.name)
                if not var_ptr:
                    var_ptr = builder.alloca(value.type, name=target.name)
                    named_values[target.name] = var_ptr
                builder.store(value, var_ptr)
            elif isinstance(target, SubscriptNode):
                ptr = target.codegen_ptr(builder, module, named_values)
                builder.store(value, ptr)

# Class for subscripts (e.g., lst[i])
class SubscriptNode(ASTNode):
    def __init__(self, value, slice):
        self.value = value
        self.slice = slice

    def codegen_ptr(self, builder, module, named_values):
        value = self.value.codegen(builder, module, named_values)
        index = self.slice.codegen(builder, module, named_values)
        data_ptr = builder.gep(value, [ir.Constant(ir.IntType(32), 0), ir.Constant(ir.IntType(32), 1)], inbounds=True)
        return builder.gep(data_ptr, [ir.Constant(ir.IntType(32), 0), index], inbounds=True)

    def codegen(self, builder, module, named_values):
        ptr = self.codegen_ptr(builder, module, named_values)
        return builder.load(ptr)

# Class for tuples
class TupleNode(ASTNode):
    def __init__(self, elements):
        self.elements = elements

    def codegen(self, builder, module, named_values):
        return [el.codegen(builder, module, named_values) for el in self.elements]

# Class to parse Python AST and convert to custom AST nodes
class PythonASTParser:
    def parse(self, node):
        if isinstance(node, ast.Module):
            return [self.parse(child) for child in node.body]
        elif isinstance(node, ast.FunctionDef):
            body = [self.parse(stmt) for stmt in node.body]
            return FunctionDefNode(node.name, [arg.arg for arg in node.args.args], body)
        elif isinstance(node, ast.Return):
            return ReturnNode(self.parse(node.value))
        elif isinstance(node, ast.BinOp):
            return BinOpNode(self.parse(node.left), self.op_to_str(node.op), self.parse(node.right))
        elif isinstance(node, ast.Compare):
            left = self.parse(node.left)
            comparators = [self.parse(comp) for comp in node.comparators]
            ops = [self.op_to_str(op) for op in node.ops]
            if len(comparators) == 1 and len(ops) == 1:
                return ComparisonNode(left, ops[0], comparators[0])
            else:
                raise ValueError("Multiple comparisons not supported")
        elif isinstance(node, ast.Num):
            if isinstance(node.n, int):
                return IntNode(node.n)
            elif isinstance(node.n, float):
                return FloatNode(node.n)
        elif isinstance(node, ast.Str):
            return StringNode(node.s)
        elif isinstance(node, ast.Name):
            return VarNode(node.id)
        elif isinstance(node, ast.Assign):
            targets = [self.parse(target) for target in node.targets]
            value = self.parse(node.value)
            return AssignNode(targets, value)
        elif isinstance(node, ast.Expr):
            return self.parse(node.value)
        elif isinstance(node, ast.Call):
            return FunctionCallNode(self.parse(node.func).name, [self.parse(arg) for arg in node.args])
        elif isinstance(node, ast.If):
            condition = self.parse(node.test)
            body = [self.parse(stmt) for stmt in node.body]
            else_body = [self.parse(stmt) for stmt in node.orelse] if node.orelse else None
            return IfNode(condition, body, else_body)
        elif isinstance(node, ast.For):
            target = self.parse(node.target)
            iter_node = self.parse(node.iter)
            body = [self.parse(stmt) for stmt in node.body]
            return ForNode(target.name, iter_node, body)
        elif isinstance(node, ast.List):
            elements = [self.parse(el) for el in node.elts]
            return ArrayNode(elements)
        elif isinstance(node, ast.Subscript):
            value = self.parse(node.value)
            slice = self.parse(node.slice)
            return SubscriptNode(value, slice)
        elif isinstance(node, ast.Index):
            return self.parse(node.value)
        elif isinstance(node, ast.Tuple):
            elements = [self.parse(el) for el in node.elts]
            return TupleNode(elements)
        else:
            raise ValueError(f"Unsupported node type: {type(node)}")

    def op_to_str(self, op):
        if isinstance(op, ast.Add):
            return '+'
        elif isinstance(op, ast.Sub):
            return '-'
        elif isinstance(op, ast.Mult):
            return '*'
        elif isinstance(op, ast.Div):
            return '/'
        elif isinstance(op, ast.Eq):
            return '=='
        elif isinstance(op, ast.NotEq):
            return '!='
        elif isinstance(op, ast.Lt):
            return '<'
        elif isinstance(op, ast.LtE):
            return '<='
        elif isinstance(op, ast.Gt):
            return '>'
        elif isinstance(op, ast.GtE):
            return '>='
        else:
            raise ValueError(f"Unsupported operator: {type(op)}")

def main():
    source_code = """
def bubble(lst):
    for i in range(len(lst)-1):
        for j in range(i+1, len(lst)):
            if lst[i] > lst[j]:
                lst[i], lst[j] = lst[j], lst[i]
    return lst

a = [62, 14, 29, 1]
b = bubble(a)
"""

    # Parse Python source code to AST
    tree = ast.parse(source_code)
    parser = PythonASTParser()
    ast_nodes = parser.parse(tree)

    # Create LLVM module
    module = ir.Module(name="my_module")

    # Codegen for AST nodes
    for node in ast_nodes:
        if isinstance(node, FunctionDefNode):
            node.codegen(module)

    print(module)

if __name__ == "__main__":
    main()