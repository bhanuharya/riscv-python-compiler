from llvmlite import ir, binding as llvm
import ast

# Initialize LLVM
llvm.initialize()
llvm.initialize_native_target()
llvm.initialize_native_asmprinter()

# Get the default target triple for the host machine
target_triple = llvm.Target.from_default_triple().name

# Create an LLVM module
module = ir.Module(name='python IR')
module.triple = target_triple  # Set the target triple

# Define the LLVM types
int_type = ir.IntType(32)

# Create a function named "main"
main_func = ir.Function(module, ir.FunctionType(int_type, []), name="main")
entry_block = main_func.append_basic_block(name="entry")
builder = ir.IRBuilder(entry_block)

# Dictionary to store symbol table
symbol_table = {}

def generate_ir_from_ast(node):
    print("Processing Node:", ast.dump(node, annotate_fields=True, include_attributes=False))
    if isinstance(node, ast.Module):
        for stmt in node.body:
            generate_ir_from_ast(stmt)
    elif isinstance(node, ast.Assign):
        target = node.targets[0].id
        value = generate_ir_from_ast(node.value)
        symbol_table[target] = value
        print(f"Assigned {target} = {value}")
    elif isinstance(node, ast.If):
        condition = generate_ir_from_ast(node.test)
        then_block = main_func.append_basic_block(name="then")
        else_block = main_func.append_basic_block(name="else")
        merge_block = main_func.append_basic_block(name="merge")
        builder.cbranch(condition, then_block, else_block)
        
        # Generate code for the 'then' block
        builder.position_at_end(then_block)
        generate_ir_from_ast(node.body[0])
        then_result = symbol_table.get('result')
        if not builder.block.is_terminated:
            builder.branch(merge_block)  # Branch to the merge block
        
        # Generate code for the 'else' block
        builder.position_at_end(else_block)
        generate_ir_from_ast(node.orelse[0])
        else_result = symbol_table.get('result')
        if not builder.block.is_terminated:
            builder.branch(merge_block)  # Branch to the merge block
        
        # Merge the two branches
        builder.position_at_end(merge_block)
        if then_result and else_result:
            phi = builder.phi(int_type, name="result")
            phi.add_incoming(then_result, then_block)
            phi.add_incoming(else_result, else_block)
            symbol_table['result'] = phi
            print(f"Phi Node Created: {phi}")
    elif isinstance(node, ast.Compare):
        left = generate_ir_from_ast(node.left)
        right = generate_ir_from_ast(node.comparators[0])
        if isinstance(node.ops[0], ast.Eq):
            cmp_result = builder.icmp_signed('==', left, right)
            print(f"Comparison Result: {cmp_result}")
            return cmp_result
    elif isinstance(node, ast.BinOp):
        left = generate_ir_from_ast(node.left)
        right = generate_ir_from_ast(node.right)
        if isinstance(node.op, ast.Mult):
            result = builder.mul(left, right)
            symbol_table['result'] = result  # Store the result in symbol table
            print(f"Multiplication result: {result}")
            return result  # Return the result directly without storing in symbol_table
        elif isinstance(node.op, ast.Sub):
            result = builder.sub(left, right)
            symbol_table['result'] = result  # Store the result in symbol table
            print(f"Subtraction result: {result}")
            return result  # Return the result directly without storing in symbol_table
        elif isinstance(node.op, ast.Add):
            result = builder.add(left, right)
            symbol_table['result'] = result  # Store the result in symbol table
            print(f"Addition result: {result}")
            return result  # Return the result directly without storing in symbol_table
    elif isinstance(node, ast.Name):
        value = symbol_table.get(node.id)
        print(f"Name lookup: {node.id} = {value}")
        return value
    elif isinstance(node, ast.Constant):
        constant = ir.Constant(int_type, node.value)
        print(f"Constant: {constant}")
        return constant
    return None

# Example AST representation
source_code = """
x = 10
y = 5
z = x * y
if z == 50:
    result = z - 10
else:
    result = z + 10
"""

ast_repr = ast.parse(source_code)

print("========debugging========")
# Generate LLVM IR code from the AST
generate_ir_from_ast(ast_repr)

# Ensure that the last block has a return statement
if 'result' in symbol_table:
    builder.ret(symbol_table['result'])
else:
    builder.ret(ir.Constant(int_type, 0))
print("\n========AST Tree========")
print(ast.dump(ast_repr, annotate_fields=True, include_attributes=False))

# Print LLVM IR
print("\n========LLVM IR========")
print(module)
