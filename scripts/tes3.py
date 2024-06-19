import numba as nb
from numba import llvmlite

# Define function and jit it
@nb.jit
def func_1(x, y):
    return x + y

# Call with argument to trigger compile
func_1(1., 2.)

# Get llvm string
llvm_str = func_1.inspect_llvm()[(nb.types.float64,nb.types.float64,)]

print(llvm_str)

# Build llvmlite Module
func_1_llvm_mod = nb.llvmlite.ir.Module(llvm_str)
func_1_llvm_mod_2 = llvmlite.binding.module.parse_assembly(llvm_str)

# print(func_1_llvm_mod.functions)
print(func_1_llvm_mod_2.functions)