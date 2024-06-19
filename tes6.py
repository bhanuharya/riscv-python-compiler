import ast
from llvmlite import ir

class LLVMVisitor(ast.NodeVisitor):
    def __init__(self):
        self.module = ir.Module(name="module")
        self.builder = None
        self.func = None
        self.symbol_table = {}

    def visit_Module(self, node):
        for stmt in node.body:
            self.visit(stmt)

    def visit_FunctionDef(self, node):
        array_type = ir.PointerType(ir.IntType(32))
        func_type = ir.FunctionType(array_type, [array_type])
        self.func = ir.Function(self.module, func_type, name=node.name)
        block = self.func.append_basic_block(name="entry")
        self.builder = ir.IRBuilder(block)

        self.symbol_table[node.args.args[0].arg] = self.func.args[0]
        
        for stmt in node.body:
            self.visit(stmt)
        self.builder.ret(self.symbol_table[node.args.args[0].arg])

    def visit_Return(self, node):
        value = self.visit(node.value)
        self.builder.ret(value)

    def visit_For(self, node):
        # Handle range calls directly
        if isinstance(node.iter, ast.Call) and node.iter.func.id == 'range':
            range_args = [self.visit(arg) for arg in node.iter.args]
            if len(range_args) == 1:
                start = ir.Constant(ir.IntType(32), 0)
                end = range_args[0]
            elif len(range_args) == 2:
                start, end = range_args
            else:
                raise ValueError("Unsupported range arguments")

            step = ir.Constant(ir.IntType(32), 1)

            # Allocate space for the loop variable
            loop_var = self.builder.alloca(ir.IntType(32), name=node.target.id)
            self.builder.store(start, loop_var)

            loop_cond_block = self.func.append_basic_block(name="loop_cond")
            loop_body_block = self.func.append_basic_block(name="loop_body")
            after_loop_block = self.func.append_basic_block(name="after_loop")

            self.builder.branch(loop_cond_block)
            self.builder.position_at_end(loop_cond_block)

            loop_var_val = self.builder.load(loop_var, name="load_loop_var")
            cond = self.builder.icmp_signed("<", loop_var_val, end, name="loop_cond")
            self.builder.cbranch(cond, loop_body_block, after_loop_block)

            self.builder.position_at_end(loop_body_block)
            self.symbol_table[node.target.id] = loop_var
            for stmt in node.body:
                self.visit(stmt)

            next_val = self.builder.add(loop_var_val, step, name="next_val")
            self.builder.store(next_val, loop_var)
            self.builder.branch(loop_cond_block)

            self.builder.position_at_end(after_loop_block)
        else:
            raise NotImplementedError("For loop without range is not implemented")

    def visit_If(self, node):
        cond = self.visit(node.test)
        with self.builder.if_else(cond) as (then, otherwise):
            with then:
                for stmt in node.body:
                    self.visit(stmt)
            with otherwise:
                for stmt in node.orelse:
                    self.visit(stmt)

    def visit_Assign(self, node):
        value = self.visit(node.value)
        for target in node.targets:
            var_name = target.id
            if var_name not in self.symbol_table:
                alloca = self.builder.alloca(value.type, name=var_name)
                self.symbol_table[var_name] = alloca
            self.builder.store(value, self.symbol_table[var_name])

    def visit_Name(self, node):
        if isinstance(node.ctx, ast.Load):
            return self.builder.load(self.symbol_table[node.id], node.id)
        elif isinstance(node.ctx, ast.Store):
            if node.id not in self.symbol_table:
                alloca = self.builder.alloca(ir.IntType(32), name=node.id)
                self.symbol_table[node.id] = alloca
            return self.symbol_table[node.id]

    def visit_Compare(self, node):
        left = self.visit(node.left)
        right = self.visit(node.comparators[0])
        if isinstance(node.ops[0], ast.Gt):
            return self.builder.icmp_signed(">", left, right)
        elif isinstance(node.ops[0], ast.Lt):
            return self.builder.icmp_signed("<", left, right)

    def visit_Call(self, node):
        if node.func.id == 'len':
            return self.handle_len(node)
        elif node.func.id == 'range':
            return self.handle_range(node)
        else:
            raise NotImplementedError(f"Call to function {node.func.id} is not implemented.")

    def handle_len(self, node):
        array_ptr = self.symbol_table[node.args[0].id]
        array_len_ptr = self.builder.gep(array_ptr, [ir.Constant(ir.IntType(32), 0)], inbounds=True)
        return self.builder.load(array_len_ptr)

    def handle_range(self, node):
        if len(node.args) == 1:
            start = ir.Constant(ir.IntType(32), 0)
            end = self.visit(node.args[0])
        elif len(node.args) == 2:
            start = self.visit(node.args[0])
            end = self.visit(node.args[1])
        else:
            raise NotImplementedError("Range with more than 2 arguments is not supported")
        return end

    def visit_BinOp(self, node):
        left = self.visit(node.left)
        right = self.visit(node.right)
        if isinstance(node.op, ast.Add):
            return self.builder.add(left, right, "addtmp")
        elif isinstance(node.op, ast.Sub):
            return self.builder.sub(left, right, "subtmp")
        elif isinstance(node.op, ast.Mult):
            return self.builder.mul(left, right, "multmp")
        elif isinstance(node.op, ast.Div):
            return self.builder.sdiv(left, right, "divtmp")

    def visit_Num(self, node):
        return ir.Constant(ir.IntType(32), node.n)

    def visit_Subscript(self, node):
        array_ptr = self.symbol_table[node.value.id]
        index = self.visit(node.slice)
        elem_ptr = self.builder.gep(array_ptr, [ir.Constant(ir.IntType(32), 0), index], inbounds=True)
        if isinstance(node.ctx, ast.Load):
            return self.builder.load(elem_ptr)
        elif isinstance(node.ctx, ast.Store):
            return elem_ptr

    def visit_Tuple(self, node):
        elements = [self.visit(elt) for elt in node.elts]
        return elements

    def visit_Index(self, node):
        return self.visit(node.value)

# Step 4: Generate LLVM IR Using llvmlite
def generate_llvm_ir(input_code):
    tree = ast.parse(input_code)
    visitor = LLVMVisitor()
    visitor.visit(tree)
    return str(visitor.module)

# Example Usage
input_code = """
def bubble(lst):
    for i in range(len(lst)-1):
        for j in range(i+1, len(lst)):
            if lst[i] > lst[j]:
                lst[i], lst[j] = lst[j], lst[i]
    return lst
"""

llvm_ir = generate_llvm_ir(input_code)
print(llvm_ir)
