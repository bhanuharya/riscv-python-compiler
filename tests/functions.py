

def fib(n: float) -> float:
    if n <= 1.0:
        return n
    else:
        return fib(n-1.0) + fib(n-2.0)
    
terms = 10

for i in range(terms):
    if i != 0:
        print(fib(float(i)))
