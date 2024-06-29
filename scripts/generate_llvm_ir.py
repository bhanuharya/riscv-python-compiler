import os
import numba
import numpy as np
import llvmlite.binding as llvm

# Set environment variables to dump LLVM IR and optimized LLVM IR
os.environ['NUMBA_DUMP_LLVM'] = '1'
# os.environ['NUMBA_DUMP_OPTIMIZED'] = '1'

# Define the function to be compiled
# @numba.njit
# def bubble_sort(arr):
#     """
#     Sort an array using the bubble sort algorithm.
    
#     Parameters:
#     arr (numpy.ndarray): Input array to be sorted.
    
#     Returns:
#     numpy.ndarray: Sorted array.
#     """
#     n = len(arr)
#     for i in range(n):
#         for j in range(0, n-i-1):
#             if arr[j] > arr[j+1]:
#                 arr[j], arr[j+1] = arr[j+1], arr[j]
#     return arr

# Define function and jit it
@numba.jit
def func_1(x, y):
    return x + y

llvm.initialize()
llvm.initialize_native_target()
llvm.initialize_native_asmprinter()

# Trigger the compilation by calling the function
# arr = np.array([64, 34, 25, 12, 22, 11, 90], dtype=np.int32)
# bubble_sort(arr)
# # Get llvm string
# llvm_str = bubble_sort.inspect_llvm()[(numba.types.Array(numba.types.int32, 1, 'C'),)]

# Call with argument to trigger compile
func_1(1.)

# Get llvm string
llvm_str = func_1.inspect_llvm()[(numba.types.float64,)]

# print(llvm_str)

# # Build llvmlite Module
# func_1_llvm_mod = nb.llvmlite.ir.Module(llvm_str)

# print(func_1_llvm_mod.functions)

# Build llvmlite Module
func_1_llvm_mod = numba.llvmlite.ir.Module(llvm_str)

print(func_1_llvm_mod.functions)

# # Initialize LLVM
# llvm.initialize()
# llvm.initialize_native_target()
# llvm.initialize_native_asmprinter()

# # Ensure the function has been compiled
# if not bubble_sort.signatures:
#     raise RuntimeError("Function signatures not found. Ensure the function is called at least once to trigger compilation.")

# # Get the LLVM IR from Numba
# bubble_sort_ir = bubble_sort.inspect_llvm(bubble_sort.signatures[0])

# # Determine the script directory
# script_dir = os.path.dirname(os.path.abspath(__file__))

# # Specify the output directory and file path
# output_dir = os.path.join(script_dir, '../llvm_ir')
# output_file_path = os.path.join(output_dir, 'output_llvm_ir.ll')

# # Ensure the output directory exists
# os.makedirs(output_dir, exist_ok=True)

# # Write the LLVM IR to the output file
# with open(output_file_path, 'w') as f:
#     f.write(bubble_sort_ir)

# print(f"LLVM IR has been written to {output_file_path}")

# import numba as nb

# # Define function and jit it
# @nb.jit
# def func_1(x):
#     return x**2

# # Call with argument to trigger compile
# func_1(1.)

# # Get llvm string
# llvm_str = func_1.inspect_llvm()[(nb.types.float64,)]

# print(llvm_str)

# # Build llvmlite Module
# func_1_llvm_mod = nb.llvmlite.ir.Module(llvm_str)

# print(func_1_llvm_mod.functions)
