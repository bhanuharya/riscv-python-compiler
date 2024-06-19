import ast
from llvmlite import ir

class LLVMCodeGenerator(ast.NodeVisitor):
    def __init__(self):
        self.module = ir.Module(name="module")
        self.func = None
        self.builder = None
        self.array_ptr = None

    def visit_FunctionDef(self, node):
        arr_type = ir.PointerType(ir.IntType(32))
        func_type = ir.FunctionType(ir.VoidType(), [arr_type, ir.IntType(32)])
        self.func = ir.Function(self.module, func_type, name=node.name)
        block = self.func.append_basic_block(name="entry")
        self.builder = ir.IRBuilder(block)

        self.array_ptr = self.func.args[0]
        self.array_len = self.func.args[1]

        self.generic_visit(node)

    def visit_Return(self, node):
        self.builder.ret_void()

    def visit_For(self, node):
        start = self.visit(node.iter.args[0])
        end = self.visit(node.iter.args[1])
        step = ir.Constant(ir.IntType(32), 1)

        loop_var = self.builder.alloca(ir.IntType(32), name=node.target.id)
        self.builder.store(start, loop_var)

        loop_cond_block = self.builder.append_basic_block(name="loop_cond")
        loop_body_block = self.builder.append_basic_block(name="loop_body")
        after_loop_block = self.builder.append_basic_block(name="after_loop")

        self.builder.branch(loop_cond_block)
        self.builder.position_at_end(loop_cond_block)

        loop_var_val = self.builder.load(loop_var, name=node.target.id + "_val")
        loop_cond = self.builder.icmp_signed('<', loop_var_val, end)
        self.builder.cbranch(loop_cond, loop_body_block, after_loop_block)

        self.builder.position_at_end(loop_body_block)
        self.visit(node.body)
        self.builder.position_at_end(loop_body_block)

        next_val = self.builder.add(loop_var_val, step, name=node.target.id + "_next")
        self.builder.store(next_val, loop_var)
        self.builder.branch(loop_cond_block)

        self.builder.position_at_end(after_loop_block)

    def visit_If(self, node):
        cond = self.visit(node.test)

        if_block = self.builder.append_basic_block(name="if_block")
        else_block = self.builder.append_basic_block(name="else_block")
        after_if_block = self.builder.append_basic_block(name="after_if")

        self.builder.cbranch(cond, if_block, else_block)

        self.builder.position_at_end(if_block)
        for stmt in node.body:
            self.visit(stmt)
        self.builder.branch(after_if_block)

        self.builder.position_at_end(else_block)
        for stmt in node.orelse:
            self.visit(stmt)
        self.builder.branch(after_if_block)

        self.builder.position_at_end(after_if_block)

    def visit_Compare(self, node):
        left = self.visit(node.left)
        right = self.visit(node.comparators[0])
        if isinstance(node.ops[0], ast.Gt):
            return self.builder.icmp_signed('>', left, right)
        elif isinstance(node.ops[0], ast.Lt):
            return self.builder.icmp_signed('<', left, right)
        elif isinstance(node.ops[0], ast.Eq):
            return self.builder.icmp_signed('==', left, right)
        elif isinstance(node.ops[0], ast.NotEq):
            return self.builder.icmp_signed('!=', left, right)
        elif isinstance(node.ops[0], ast.GtE):
            return self.builder.icmp_signed('>=', left, right)
        elif isinstance(node.ops[0], ast.LtE):
            return self.builder.icmp_signed('<=', left, right)

    def visit_BinOp(self, node):
        left = self.visit(node.left)
        right = self.visit(node.right)
        if isinstance(node.op, ast.Sub):
            return self.builder.sub(left, right, name="sub")
        if isinstance(node.op, ast.Add):
            return self.builder.add(left, right, name="add")

    def visit_Name(self, node):
        if node.id == 'n':
            return self.array_len

    def visit_Call(self, node):
        if isinstance(node.func, ast.Name):
            if node.func.id == 'len':
                return self.array_len
            elif node.func.id == 'range':
                start = self.visit(node.args[0])
                end = self.visit(node.args[1])
                return (start, end)

    def visit_Subscript(self, node):
        array = self.array_ptr
        index = self.visit(node.slice.value)
        ptr = self.builder.gep(array, [index], inbounds=True)
        return self.builder.load(ptr)

    def visit_Assign(self, node):
        targets = node.targets[0]
        value = self.visit(node.value)

        if isinstance(targets, ast.Tuple):
            # Handle array element swapping
            idx1 = self.visit(targets.elts[0].slice.value)
            idx2 = self.visit(targets.elts[1].slice.value)
            ptr1 = self.builder.gep(self.array_ptr, [idx1], inbounds=True)
            ptr2 = self.builder.gep(self.array_ptr, [idx2], inbounds=True)
            temp = self.builder.load(ptr1)
            self.builder.store(self.builder.load(ptr2), ptr1)
            self.builder.store(temp, ptr2)
        else:
            # Handle variable assignments
            var_ptr = self.builder.alloca(ir.IntType(32), name=targets.id)
            self.builder.store(value, var_ptr)

    def visit_Num(self, node):
        return ir.Constant(ir.IntType(32), node.n)

    def generate_code(self, node):
        self.visit(node)
        return str(self.module)

def generate_llvm_ir_from_ast(tree):
    generator = LLVMCodeGenerator()
    return generator.generate_code(tree)

if __name__ == "__main__":
    code = """
def bubble_sort(arr):
    n = len(arr)
    for i in range(n):
        for j in range(0, n-i-1):
            if arr[j] > arr[j+1]:
                arr[j], arr[j+1] = arr[j+1], arr[j]
    return arr
"""
    tree = ast.parse(code)
    llvm_ir = generate_llvm_ir_from_ast(tree)
    print(llvm_ir)
