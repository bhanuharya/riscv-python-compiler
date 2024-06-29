import os
from llvmlite import ir, binding

# Define the function
def generate_ir():
    # Create a new module
    module = ir.Module(name="my_module")
    module.triple = "x86_64-pc-linux-gnu"  # Set the target triple

    # Define the function signature
    func_type = ir.FunctionType(ir.IntType(32), [ir.IntType(32), ir.IntType(32)])
    func = ir.Function(module, func_type, name="add")

    # Create a basic block
    block = func.append_basic_block(name="entry")
    builder = ir.IRBuilder(block)

    # Get function arguments
    a, b = func.args
    result = builder.add(a, b, name="res")
    builder.ret(result)

    # Return the module
    return module

# Generate the LLVM IR
module = generate_ir()
llvm_ir = str(module)

# Write the LLVM IR to a file
script_dir = os.path.dirname(os.path.abspath(__file__))
output_dir = os.path.join(script_dir, '../llvm_ir')
os.makedirs(output_dir, exist_ok=True)
output_file_path = os.path.join(output_dir, 'output_llvm_ir.ll')

with open(output_file_path, 'w') as f:
    f.write(llvm_ir)

print(f"LLVM IR has been written to {output_file_path}")
