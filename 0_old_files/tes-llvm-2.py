import ast
from llvmlite import ir

class PythonCompiler:
    def __init__(self):
        self.symbol_table = {}

    def parse(self, source_code):
        return ast.parse(source_code)

    def visit(self, node):
        method = 'visit_' + node.__class__.__name__
        visitor = getattr(self, method, self.generic_visit)
        return visitor(node)

    def generic_visit(self, node):
        for field, value in ast.iter_fields(node):
            if isinstance(value, list):
                for item in value:
                    if isinstance(item, ast.AST):
                        self.visit(item)
            elif isinstance(value, ast.AST):
                self.visit(value)

    def visit_FunctionDef(self, node):
        print(f"Function name: {node.name}")
        self.visit(node.args)
        for stmt in node.body:
            self.visit(stmt)

    def visit_arguments(self, node):
        for arg in node.args:
            self.visit(arg)

    def visit_Name(self, node):
        print(f"Variable name: {node.id}")

    def visit_Constant(self, node):
        print(f"Constant value: {node.value}")

    def visit_Assign(self, node):
        self.visit(node.targets[0])
        self.visit(node.value)

    def visit_For(self, node):
        self.visit(node.target)
        self.visit(node.iter)
        for stmt in node.body:
            self.visit(stmt)

    def visit_If(self, node):
        self.visit(node.test)
        for stmt in node.body:
            self.visit(stmt)
        for stmt in node.orelse:
            self.visit(stmt)


class IRGenerator:
    def __init__(self):
        self.module = ir.Module(name="my_module")
        self.builder = None
        self.function = None
        self.symbol_table = {}
        self.array_lengths = {}

    def generate(self, node):
        self.visit(node)
        return str(self.module)

    def visit(self, node):
        method = 'visit_' + node.__class__.__name__
        visitor = getattr(self, method, self.generic_visit)
        return visitor(node)

    def generic_visit(self, node):
        for field, value in ast.iter_fields(node):
            if isinstance(value, list):
                for item in value:
                    if isinstance(item, ast.AST):
                        self.visit(item)
            elif isinstance(value, ast.AST):
                self.visit(value)

    def visit_FunctionDef(self, node):
        func_type = ir.FunctionType(ir.VoidType(), [ir.PointerType(ir.IntType(32))])
        self.function = ir.Function(self.module, func_type, name=node.name)
        block = self.function.append_basic_block(name="entry")
        self.builder = ir.IRBuilder(block)
        for stmt in node.body:
            self.visit(stmt)
        self.builder.ret_void()

    def visit_Assign(self, node):
        value = self.visit(node.value)
        target = node.targets[0]
        if isinstance(target, ast.Name):
            var_ptr = self.builder.alloca(ir.IntType(32), name=target.id)
            self.builder.store(value, var_ptr)
            self.symbol_table[target.id] = var_ptr
            if isinstance(node.value, ast.List):
                self.array_lengths[target.id] = len(node.value.elts)
        elif isinstance(target, ast.Tuple):
            targets = target.elts
            values = value.elts
            for t, v in zip(targets, values):
                self.visit_Assign(ast.Assign(targets=[t], value=v))

    def visit_Constant(self, node):
        return ir.Constant(ir.IntType(32), node.value)

    def visit_For(self, node):
        start = ir.Constant(ir.IntType(32), 0)
        end = self.visit(node.iter.args[0])
        loop_block = self.builder.append_basic_block("loop")
        after_loop_block = self.builder.append_basic_block("after_loop")
        self.builder.branch(loop_block)
        self.builder.position_at_end(loop_block)
        phi = self.builder.phi(ir.IntType(32), name=node.target.id)
        phi.add_incoming(start, self.builder.block)
        self.symbol_table[node.target.id] = phi
        for stmt in node.body:
            self.visit(stmt)
        next_value = self.builder.add(phi, ir.Constant(ir.IntType(32), 1))
        phi.add_incoming(next_value, self.builder.block)
        self.builder.cbranch(self.builder.icmp_signed("<", next_value, end), loop_block, after_loop_block)
        self.builder.position_at_end(after_loop_block)

    def visit_If(self, node):
        cond = self.visit(node.test)
        then_block = self.builder.append_basic_block(name="then")
        else_block = self.builder.append_basic_block(name="else")
        merge_block = self.builder.append_basic_block(name="merge")
        self.builder.cbranch(cond, then_block, else_block)

        self.builder.position_at_end(then_block)
        for stmt in node.body:
            self.visit(stmt)
        if not self.builder.block.is_terminated:
            self.builder.branch(merge_block)

        self.builder.position_at_end(else_block)
        for stmt in node.orelse:
            self.visit(stmt)
        if not self.builder.block.is_terminated:
            self.builder.branch(merge_block)

        self.builder.position_at_end(merge_block)

    def visit_Compare(self, node):
        left = self.visit(node.left)
        right = self.visit(node.comparators[0])
        return self.builder.icmp_signed('>', left, right)

    def visit_Call(self, node):
        func = self.symbol_table.get(node.func.id)
        args = [self.visit(arg) for arg in node.args]
        if func:
            return self.builder.call(func, args)
        elif node.func.id == 'len':
            arr = node.args[0].id
            length = ir.Constant(ir.IntType(32), self.array_lengths[arr])
            return length
        elif node.func.id == 'range':
            if len(args) == 1:
                return self.create_range(ir.Constant(ir.IntType(32), 0), args[0])
            elif len(args) == 2:
                return self.create_range(args[0], args[1])

    def create_range(self, start, end):
        preheader_block = self.builder.block
        loop_block = self.function.append_basic_block(name="loop")
        after_loop_block = self.function.append_basic_block(name="after_loop")
        
        self.builder.branch(loop_block)
        self.builder.position_at_end(loop_block)
        
        phi = self.builder.phi(ir.IntType(32), name="i")
        phi.add_incoming(start, preheader_block)
        
        next_val = self.builder.add(phi, ir.Constant(ir.IntType(32), 1), name="nextval")
        cmp = self.builder.icmp_signed('<', phi, end, name="loopcond")
        
        self.builder.cbranch(cmp, loop_block, after_loop_block)
        self.builder.position_at_end(after_loop_block)
        
        return phi

    def visit_Name(self, node):
        return self.builder.load(self.symbol_table[node.id])

    def visit_BinOp(self, node):
        left = self.visit(node.left)
        right = self.visit(node.right)
        if isinstance(node.op, ast.Add):
            return self.builder.add(left, right)
        elif isinstance(node.op, ast.Sub):
            return self.builder.sub(left, right)
        elif isinstance(node.op, ast.Mult):
            return self.builder.mul(left, right)

    def visit_List(self, node):
        elements = [self.visit(el) for el in node.elts]
        arr_type = ir.ArrayType(ir.IntType(32), len(elements))
        arr = self.builder.alloca(arr_type)
        for i, el in enumerate(elements):
            ptr = self.builder.gep(arr, [ir.Constant(ir.IntType(32), 0), ir.Constant(ir.IntType(32), i)])
            self.builder.store(el, ptr)
        self.symbol_table['arr'] = arr
        self.array_lengths['arr'] = len(elements)
        return arr

    def visit_Subscript(self, node):
        value = self.visit(node.value)
        index = self.visit(node.slice)
        ptr = self.builder.gep(value, [ir.Constant(ir.IntType(32), 0), index])
        return self.builder.load(ptr)


# Main function to compile and generate LLVM IR
def main():
    source_code = """
def bubbleSort(arr):
    n = len(arr)
    for i in range(n):
        for j in range(0, n - i - 1):
            if arr[j] > arr[j + 1]:
                arr[j], arr[j + 1] = arr[j + 1], arr[j]

arr = [2, 1, 10, 23]
bubbleSort(arr)
for i in range(len(arr)):
    print("%d" % arr[i])
"""

    # Parse and generate AST
    compiler = PythonCompiler()
    ast_tree = compiler.parse(source_code)
    compiler.visit(ast_tree)

    # Generate LLVM IR
    ir_gen = IRGenerator()
    llvm_ir = ir_gen.generate(ast_tree)
    print("\n========LLVM IR========")
    print(llvm_ir)


if __name__ == "__main__":
    main()
