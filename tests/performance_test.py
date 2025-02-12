print("test deret fibonacci")

def fibonacci(n: float) -> float:
    if n <= 1.0:
        return n
    else:
        return fibonacci(n-1.0) + fibonacci(n-2.0)
    
terms = 20

for i in range(terms):
    if i != 0:
        print(fibonacci(float(i)))
print("operasi aritmetika")
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

print("testing iterasi list")

items = ["foo", 'bar', 'str', "test", "halo"]

for it in items:
    print(it)