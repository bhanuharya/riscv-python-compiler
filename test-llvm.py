from llvmlite import ir
import ast 

class LLVMIRBuilder(ast.NodeVisitor):
    def __init__(self):
        self.module = ir.Module(name="my_module")
        self.builder = None

    def build_ir(self, tree):
        self.visit(tree)
        return self.module

    def visit_FunctionDef(self, node):
        func_ty = ir.FunctionType(ir.VoidType(), [])
        func = ir.Function(self.module, func_ty, name=node.name)
        block = func.append_basic_block(name="entry")
        self.builder = ir.IRBuilder(block)
        self.generic_visit(node)

    def visit_Assign(self, node):
        if isinstance(node.targets[0], ast.Name) and isinstance(node.value, ast.Constant):
            var = ir.GlobalVariable(self.module, ir.IntType(32), node.targets[0].id)
            var.initializer = ir.Constant(ir.IntType(32), node.value.value)
        self.generic_visit(node)

    def visit_Add(self, node):
        left = self.visit(node.left)
        right = self.visit(node.right)
        return self.builder.add(left, right)

    def visit_Name(self, node):
        return self.module.globals[node.id]

    def visit_Constant(self, node):
        return ir.Constant(ir.IntType(32), node.value)

# Example usage:
input_ast = ast.parse('''
x = 10
y = 20
z = x + y
''')

# Build LLVM IR
ir_builder = LLVMIRBuilder()
ir_module = ir_builder.build_ir(input_ast)
print(ir_module)