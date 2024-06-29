import ast
import llvmlite.ir as ir
import llvmlite.binding as llvm

# Sample Python code
code = """
def bubble(lst):
    for i in range(len(lst)-1):
        for j in range(i+1, len(lst)):
            if lst[i] > lst[j]:
                lst[i], lst[j] = lst[j], lst[i]
    return lst

a = [62, 14, 29, 1]
b = bubble(a)
"""

# Parse the code into an AST
tree = ast.parse(code)

# Initialize LLVM
llvm.initialize()
llvm.initialize_native_target()
llvm.initialize_native_asmprinter()

# Create a module
module = ir.Module(name="bubble_sort_module")

class ASTToLLVM:
    def __init__(self):
        self.builder = None
        self.func = None
        self.symbol_table = {}
        self.module = module
        self.loop_exit_block = None

    def generate_code(self, node):
        if isinstance(node, ast.Module):
            for n in node.body:
                self.generate_code(n)
        elif isinstance(node, ast.FunctionDef):
            self.visit_function(node)
        elif isinstance(node, ast.For):
            self.visit_for(node)
        elif isinstance(node, ast.If):
            self.visit_if(node)
        elif isinstance(node, ast.Assign):
            self.visit_assign(node)
        elif isinstance(node, ast.Expr):
            self.generate_code(node.value)
        elif isinstance(node, ast.BinOp):
            return self.visit_binop(node)
        elif isinstance(node, ast.Call):
            return self.visit_call(node)
        elif isinstance(node, ast.Return):
            return self.visit_return(node)
        elif isinstance(node, ast.Constant):
            return ir.Constant(ir.IntType(32), node.value)
        elif isinstance(node, ast.Name):
            return self.builder.load(self.symbol_table[node.id], node.id)
        elif isinstance(node, ast.Subscript):
            return self.visit_subscript(node)
        elif isinstance(node, ast.Compare):
            return self.visit_compare(node)
        elif isinstance(node, ast.List):
            return self.visit_list(node)
        elif isinstance(node, ast.Tuple):
            return self.visit_tuple(node)
        else:
            raise NotImplementedError(f"Node type {type(node)} not implemented")

    def visit_function(self, node):
        func_type = ir.FunctionType(ir.PointerType(ir.IntType(32)), [ir.PointerType(ir.IntType(32))], False)
        self.func = ir.Function(self.module, func_type, name=node.name)
        block = self.func.append_basic_block(name="entry")
        self.builder = ir.IRBuilder(block)
        
        # Add function parameters to symbol table
        self.symbol_table[node.args.args[0].arg] = self.func.args[0]
        
        for stmt in node.body:
            self.generate_code(stmt)

    def visit_for(self, node):
        start_block = self.builder.append_basic_block("for_start")
        body_block = self.builder.append_basic_block("for_body")
        after_block = self.builder.append_basic_block("for_after")

        self.builder.branch(start_block)
        self.builder.position_at_end(start_block)

        if isinstance(node.iter, ast.Call) and node.iter.func.id == "range":
            if len(node.iter.args) == 1:
                start = ir.Constant(ir.IntType(32), 0)
                stop = self.generate_code(node.iter.args[0])
                step = ir.Constant(ir.IntType(32), 1)
            elif len(node.iter.args) == 2:
                start = self.generate_code(node.iter.args[0])
                stop = self.generate_code(node.iter.args[1])
                step = ir.Constant(ir.IntType(32), 1)
            elif len(node.iter.args) == 3:
                start = self.generate_code(node.iter.args[0])
                stop = self.generate_code(node.iter.args[1])
                step = self.generate_code(node.iter.args[2])
            else:
                raise ValueError("Unsupported number of arguments for range()")
        else:
            raise ValueError("Unsupported iterator type in for loop")

        # Initialize the loop variable
        target = node.target.id
        self.symbol_table[target] = self.builder.alloca(ir.IntType(32), name=target)
        self.builder.store(start, self.symbol_table[target])

        # Loop condition
        loop_var = self.builder.load(self.symbol_table[target])
        end_cond = self.builder.icmp_signed('<', loop_var, stop)
        self.builder.cbranch(end_cond, body_block, after_block)

        # Loop body
        self.builder.position_at_end(body_block)
        for stmt in node.body:
            self.generate_code(stmt)

        # Increment loop variable
        loop_var = self.builder.load(self.symbol_table[target])
        next_var = self.builder.add(loop_var, step)
        self.builder.store(next_var, self.symbol_table[target])
        self.builder.branch(start_block)

        # After loop
        self.builder.position_at_end(after_block)

    def visit_if(self, node):
        cond = self.generate_code(node.test)
        then_block = self.builder.append_basic_block("if_then")
        else_block = self.builder.append_basic_block("if_else")
        merge_block = self.builder.append_basic_block("if_merge")

        self.builder.cbranch(cond, then_block, else_block)
        
        self.builder.position_at_end(then_block)
        for stmt in node.body:
            self.generate_code(stmt)
        self.builder.branch(merge_block)
        
        self.builder.position_at_end(else_block)
        for stmt in node.orelse:
            self.generate_code(stmt)
        self.builder.branch(merge_block)

        self.builder.position_at_end(merge_block)

    def visit_assign(self, node):
        value = self.generate_code(node.value)
        if isinstance(node.targets[0], ast.Tuple):
            targets = [t.id for t in node.targets[0].elts]
            values = [self.generate_code(v) for v in node.value.elts]
            for t, v in zip(targets, values):
                if t not in self.symbol_table:
                    self.symbol_table[t] = self.builder.alloca(v.type, name=t)
                self.builder.store(v, self.symbol_table[t])
        else:
            target = node.targets[0].id
            if target not in self.symbol_table:
                self.symbol_table[target] = self.builder.alloca(value.type, name=target)
            self.builder.store(value, self.symbol_table[target])

    def visit_binop(self, node):
        left = self.generate_code(node.left)
        right = self.generate_code(node.right)
        if isinstance(node.op, ast.Add):
            return self.builder.add(left, right)
        elif isinstance(node.op, ast.Sub):
            return self.builder.sub(left, right)
        elif isinstance(node.op, ast.Mult):
            return self.builder.mul(left, right)
        elif isinstance(node.op, ast.Div):
            return self.builder.sdiv(left, right)
        else:
            raise NotImplementedError(f"Binary operator {type(node.op)} not implemented")

    def visit_call(self, node):
        if node.func.id == "len":
            arg = node.args[0].id
            array_size = self.builder.load(self.symbol_table[arg], name="array_size")
            return array_size
        elif node.func.id == "range":
            if len(node.args) == 1:
                start = ir.Constant(ir.IntType(32), 0)
                stop = self.generate_code(node.args[0])
                return (start, stop)
            elif len(node.args) == 2:
                start = self.generate_code(node.args[0])
                stop = self.generate_code(node.args[1])
                return (start, stop)
            elif len(node.args) == 3:
                start = self.generate_code(node.args[0])
                stop = self.generate_code(node.args[1])
                step = self.generate_code(node.args[2])
                return (start, stop, step)
            else:
                raise ValueError("Unsupported number of arguments for range()")
        else:
            func = self.symbol_table[node.func.id]
            args = [self.generate_code(arg) for arg in node.args]
            return self.builder.call(func, args)

    def visit_return(self, node):
        value = self.generate_code(node.value)
        self.builder.ret(value)

    def visit_subscript(self, node):
        array = self.generate_code(node.value)
        if isinstance(node.slice, ast.Index):
            index = self.generate_code(node.slice.value)
        elif isinstance(node.slice, ast.Slice):
            lower = self.generate_code(node.slice.lower) if node.slice.lower else ir.Constant(ir.IntType(32), 0)
            upper = self.generate_code(node.slice.upper) if node.slice.upper else None
            if upper:
                index = self.builder.gep(array, [lower, upper])
            else:
                index = self.builder.gep(array, [lower])
        elif isinstance(node.slice, ast.Constant):  # Handles constant indices
            index = self.generate_code(node.slice)
        elif isinstance(node.slice, ast.Name):
            index = self.generate_code(node.slice)
        else:
            raise ValueError(f"Unsupported subscript slice type: {type(node.slice)}")
        
        ptr = self.builder.gep(array, [index], inbounds=True)
        return self.builder.load(ptr)

    def visit_compare(self, node):
        left = self.generate_code(node.left)
        right = self.generate_code(node.comparators[0])
        if isinstance(node.ops[0], ast.Gt):
            return self.builder.icmp_signed('>', left, right)
        else:
            raise NotImplementedError(f"Comparison operator {type(node.ops[0])} not implemented")

    def visit_list(self, node):
        elem_type = ir.IntType(32)  # Assuming the list elements are integers
        list_type = ir.ArrayType(elem_type, len(node.elts))
        list_alloca = self.builder.alloca(list_type, name="list")
        for i, elt in enumerate(node.elts):
            index = ir.Constant(ir.IntType(32), i)
            elem_ptr = self.builder.gep(list_alloca, [ir.Constant(ir.IntType(32), 0), index], inbounds=True)
            self.builder.store(self.generate_code(elt), elem_ptr)
        return list_alloca

    def visit_tuple(self, node):
        values = [self.generate_code(elt) for elt in node.elts]
        return values

# Instantiate the translator and generate LLVM IR
translator = ASTToLLVM()
translator.generate_code(tree)

# Print the generated LLVM IR
print(module)
s