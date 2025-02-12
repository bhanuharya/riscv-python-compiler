

def fibonacci(n: float) -> float:
    if n <= 1.0:
        return n
    else:
        return fibonacci(n-1.0) + fibonacci(n-2.0)
    
terms = 1000000000

for i in range(terms):
    if i != 0:
        print(fibonacci(float(i)))
