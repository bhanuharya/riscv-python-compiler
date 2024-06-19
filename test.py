from numba import njit

@njit
def bubble(lst):
    for i in range(len(lst) - 1):
        for j in range(i + 1, len(lst)):
            if lst[i] > lst[j]:
                lst[i], lst[j] = lst[j], lst[i]
    return lst

# Example input
a = [62, 14, 29, 1]
b = bubble(a)
print(b)

# Generate LLVM IR
llvm_ir = bubble.inspect_llvm(bubble.signatures[0])
print(llvm_ir)

# Save the LLVM IR to a file
with open('bubble.ll', 'w') as f:
    f.write(llvm_ir)
