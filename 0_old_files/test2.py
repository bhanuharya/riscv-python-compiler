from llvmlite import ir
import hexdump

# Create an LLVM module and function
module = ir.Module()
builder = ir.IRBuilder()

# Define the LLVM types
int_type = ir.IntType(32)

# Define the main function
main_func = ir.Function(module, ir.FunctionType(int_type, []), name="main")
entry_block = main_func.append_basic_block(name="entry")
builder.position_at_end(entry_block)

# Define the arithmetic expression (3 + 4 * (5 - 2))
three = ir.Constant(int_type, 3)
four = ir.Constant(int_type, 4)
five = ir.Constant(int_type, 5)
two = ir.Constant(int_type, 2)

sub_result = builder.sub(five, two)
mul_result = builder.mul(four, sub_result)
add_result = builder.add(three, mul_result)

# Return the result
builder.ret(add_result)

# Initialize LLVM
from llvmlite import binding as llvm
llvm.initialize()
llvm.initialize_native_target()
llvm.initialize_native_asmprinter()

# Create LLVM target machine for RISC-V 32-bit
target = llvm.Target.from_default_triple()
target_machine = target.create_target_machine()

# Create a LLVM module from the IR code
llvm_module = llvm.parse_assembly(str(module))

# Optimize the LLVM module
pass_manager_builder = llvm.PassManagerBuilder()
pass_manager_builder.opt_level = 2
pass_manager = llvm.ModulePassManager()
pass_manager_builder.populate(pass_manager)
pass_manager.run(llvm_module)

# Generate machine code
machine_code = target_machine.emit_object(llvm_module)


# Write machine code to a file
with open("output.o", "wb") as f:
    f.write(machine_code)

# Read machine code from the file and print it
with open("output.o", "rb") as f:
    data = f.read()
    hexdump.hexdump(data)

print("RISC-V 32-bit machine code generated and saved to output.o")
