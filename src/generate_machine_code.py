import llvmlite.binding as llvm
import os

# Initialize LLVM
llvm.initialize()
llvm.initialize_native_target()
llvm.initialize_native_asmprinter()

# Create a target machine representing the host
target = llvm.Target.from_default_triple()
target_machine = target.create_target_machine()

# Read the optimized LLVM IR
with open('../llvm_ir/bubble_sort_opt.ll', 'r') as f:
    llvm_ir = f.read()

# Parse the LLVM IR
mod = llvm.parse_assembly(llvm_ir)
mod.verify()

# Compile the module to machine code
with open('../machine_code/bubble_sort.o', 'wb') as f:
    obj_code = target_machine.emit_object(mod)
    f.write(obj_code)

# Link the object code to create the executable
os.system('clang ../machine_code/bubble_sort.o -o ../machine_code/bubble_sort')
