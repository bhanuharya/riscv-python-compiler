print("1. Fibonacci Sequence")

def fibonacci(n: float) -> float:
    if n <= 1.0:
        return n
    else:
        return fibonacci(n-1.0) + fibonacci(n-2.0)
    
terms = 20

for i in range(terms):
    if i != 0:
        print(fibonacci(float(i)))


print("2. Modified Fibonacci Sequence")

def modified_fibonacci(n: float) -> float:
    if n <= 1.0:
        return 1.0
    
    # Force additional computations per recursion
    prev = modified_fibonacci(n - 1.0)
    prev2 = modified_fibonacci(n - 2.0)
    
    # Extra floating-point operations
    extra1 = (prev * 1.0001 - prev2 / 1.0002) * 1.0003
    extra2 = (prev2 * 1.0004 + prev / 1.0005) * 1.0006

    return prev + prev2 + extra1 + extra2  # Modified Fibonacci computation

# Test the function with a reasonable limit to avoid deep recursion
print("Modified Fibonacci(15):")
print(modified_fibonacci(15.0))


print("3. More Arithmetics")
a = 3
b = 2

c = a / b 
print(c)

d = float(a) / float(b)
print(d)


x = 3 + 5 * 2 - 8 / 4
print(x)

y = float(3) + float(5) * float(2) - float(8) / float(4)
print(y)

print("4. List Iteration")

items = ["foo", 'bar', 'str', "test", "halo"]

for it in items:
    print(it)

