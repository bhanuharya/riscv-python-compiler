print("1. List of string print")
items = ["foo", 'bar', 'str', "test", "halo"]

for it in items:
    print(it)

print("2. Variabel")

foo = "some string"
bar = foo

print(bar)


print("3. Math Operations")

x = 135.4 % 10.0

x *= 2.0
x -= 4.0
x += 1.0

# Should be 3.900..
print(x / 2.0)

print("4. Flow Control")


a = 1

if a == 3:
    a = 10
else:
    a = 0

while a < 1000:
    a += 1

print(a)
