import ast
import sys
from llvmlite import ir

# Base class for all custom AST nodes
class ASTNode:
    def codegen(self, builder, module, named_values):
        raise NotImplementedError

# Class for integer constants
class IntNode(ASTNode):
    def __init__(self, value):
        self.value = value

    def codegen(self, builder, module, named_values):
        return ir.Constant(ir.IntType(32), self.value)

# Class for string literals
class StringNode(ASTNode):
    def __init__(self, value):
        self.value = value

    def codegen(self, builder, module, named_values):
        string_type = ir.ArrayType(ir.IntType(8), len(self.value) + 1)
        string_val = ir.Constant(string_type, bytearray(self.value.encode('utf-8') + b'\0'))
        global_str = ir.GlobalVariable(module, string_type, name=f"{self.value}_str")
        global_str.initializer = string_val
        global_str.global_constant = True
        return global_str.bitcast(ir.IntType(8).as_pointer())

# Class for variable references
class VarNode(ASTNode):
    def __init__(self, name):
        self.name = name

    def codegen(self, builder, module, named_values):
        return builder.load(named_values[self.name], self.name)

# Class for binary operations
class BinOpNode(ASTNode):
    def __init__(self, left, op, right):
        self.left = left
        self.op = op
        self.right = right

    def codegen(self, builder, module, named_values):
        left = self.left.codegen(builder, module, named_values)
        right = self.right.codegen(builder, module, named_values)
        if self.op == '+':
            return builder.add(left, right, 'addtmp')
        elif self.op == '-':
            return builder.sub(left, right, 'subtmp')
        elif self.op == '*':
            return builder.mul(left, right, 'multmp')
        elif self.op == '/':
            return builder.sdiv(left, right, 'divtmp')
        else:
            raise ValueError(f"Unsupported binary operator: {self.op}")

# Class for comparison operations
class ComparisonNode(ASTNode):
    def __init__(self, left, op, right):
        self.left = left
        self.op = op
        self.right = right

    def codegen(self, builder, module, named_values):
        left = self.left.codegen(builder, module, named_values)
        right = self.right.codegen(builder, module, named_values)
        if self.op == '==':
            return builder.icmp_signed('==', left, right, 'cmptmp')
        elif self.op == '!=':
            return builder.icmp_signed('!=', left, right, 'cmptmp')
        elif self.op == '<':
            return builder.icmp_signed('<', left, right, 'cmptmp')
        elif self.op == '<=':
            return builder.icmp_signed('<=', left, right, 'cmptmp')
        elif self.op == '>':
            return builder.icmp_signed('>', left, right, 'cmptmp')
        elif self.op == '>=':
            return builder.icmp_signed('>=', left, right, 'cmptmp')
        else:
            raise ValueError(f"Unsupported comparison operator: {self.op}")

# Class for function definitions
class FunctionDefNode(ASTNode):
    def __init__(self, name, args, body):
        self.name = name
        self.args = args
        self.body = body

    def codegen(self, module):
        if self.name == "calculate":
            func_type = ir.FunctionType(ir.IntType(32), [ir.IntType(32), ir.IntType(32), ir.PointerType(ir.IntType(8))])
        elif self.name == "check_value":
            func_type = ir.FunctionType(ir.PointerType(ir.IntType(8)), [ir.IntType(32)])
        else:
            raise ValueError(f"Unsupported function name: {self.name}")

        function = ir.Function(module, func_type, name=self.name)
        block = function.append_basic_block(name="entry")
        builder = ir.IRBuilder(block)
        named_values = {}
        for i, arg in enumerate(function.args):
            arg_name = self.args[i]
            arg_ptr = builder.alloca(arg.type, name=arg_name)
            builder.store(arg, arg_ptr)
            named_values[arg_name] = arg_ptr
        for stmt in self.body:
            stmt.codegen(builder, module, named_values)
        if not block.is_terminated:
            if self.name == "calculate":
                builder.ret(ir.Constant(ir.IntType(32), 0))  # Default return value
            elif self.name == "check_value":
                builder.ret(ir.Constant(ir.PointerType(ir.IntType(8)), 0))  # Default return value
        return function

# Class for return statements
class ReturnNode(ASTNode):
    def __init__(self, value):
        self.value = value

    def codegen(self, builder, module, named_values):
        retval = self.value.codegen(builder, module, named_values)
        builder.ret(retval)

# Class for assignment statements
class AssignNode(ASTNode):
    def __init__(self, targets, value):
        self.targets = targets
        self.value = value

    def codegen(self, builder, module, named_values):
        value = self.value.codegen(builder, module, named_values)
        for target in self.targets:
            if target.name not in named_values:
                var_ptr = builder.alloca(value.type, name=target.name)
                named_values[target.name] = var_ptr
            var_ptr = named_values[target.name]
            builder.store(value, var_ptr)

# Class for conditional statements
class IfNode(ASTNode):
    def __init__(self, cond, then_body, else_body=None):
        self.cond = cond
        self.then_body = then_body
        self.else_body = else_body

    def codegen(self, builder, module, named_values):
        cond_val = self.cond.codegen(builder, module, named_values)
        cond_bool = builder.icmp_signed('!=', cond_val, ir.Constant(cond_val.type, 0), 'ifcond')
        then_block = builder.append_basic_block("then")
        else_block = builder.append_basic_block("else") if self.else_body else None
        merge_block = builder.append_basic_block("ifcont")

        builder.cbranch(cond_bool, then_block, else_block or merge_block)
        builder.position_at_end(then_block)
        for stmt in self.then_body:
            stmt.codegen(builder, module, named_values)
        if not then_block.is_terminated:
            builder.branch(merge_block)

        if self.else_body:
            builder.position_at_end(else_block)
            for stmt in self.else_body:
                stmt.codegen(builder, module, named_values)
            if not else_block.is_terminated:
                builder.branch(merge_block)

        builder.position_at_end(merge_block)

# Class for function calls
class FunctionCallNode(ASTNode):
    def __init__(self, func_name, args):
        self.func_name = func_name
        self.args = args

    def codegen(self, builder, module, named_values):
        if self.func_name == "len":
            array_ptr = self.args[0].codegen(builder, module, named_values)
            return builder.extract_value(array_ptr, 0, "len")
        else:
            func = module.globals.get(self.func_name, None)
            if not func:
                raise ValueError(f"Function {self.func_name} not declared.")
            call_args = [arg.codegen(builder, module, named_values) for arg in self.args]
            return builder.call(func, call_args, 'calltmp')

# Class for parsing Python AST to custom AST nodes
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
            return IntNode(node.n)
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
            func_name = node.func.id
            args = [self.parse(arg) for arg in node.args]
            return FunctionCallNode(func_name, args)
        elif isinstance(node, ast.If):
            cond = self.parse(node.test)
            then_body = [self.parse(stmt) for stmt in node.body]
            else_body = [self.parse(stmt) for stmt in node.orelse] if node.orelse else None
            return IfNode(cond, then_body, else_body)
        else:
            raise ValueError(f"Unsupported AST node type: {type(node)}")

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
            raise ValueError(f"Unsupported operator: {op}")

def main():
    input_code = """
def calculate(a, b, c):
    result = a + b
    if a > b:
        result = result + 10
    elif a == b:
        result = result + 20
    else:
        result = result + 30
    return result

def check_value(x):
    if x > 10:
        return "high"
    else:
        return "low"
    """
    tree = ast.parse(input_code)
    parser = PythonASTParser()
    parsed_nodes = parser.parse(tree)

    module = ir.Module(name="main")
    for node in parsed_nodes:
        node.codegen(module)

    print(module)

if __name__ == "__main__":
    main()
