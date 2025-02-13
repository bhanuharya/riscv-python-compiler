print("Complex Cases")
print("1. Factorial")
def factorial(n: float) -> float:
    if n <= 1.0:
        return 1.0
    result = 1.0
    i = 1.0  # Use float explicitly

    while i <= n:  # Manual loop instead of range()
        result *= i
        i += 1.0  # Increment with float step

    return result

# Test case
for i in range(10):  # We assume standard range() is allowed here
    print(factorial(float(i)))

print("Matrix Multiply")
def matrix_multiply(a11: float, a12: float, a21: float, a22: float,
                     b11: float, b12: float, b21: float, b22: float) -> float:
    # Compute the resulting matrix elements manually
    c11 = a11 * b11 + a12 * b21
    c12 = a11 * b12 + a12 * b22
    c21 = a21 * b11 + a22 * b21
    c22 = a21 * b12 + a22 * b22

    print("Matrix A:")
    print(a11)
    print(a12)
    print(a21)
    print(a22)

    print("Matrix B:")
    print(b11)
    print(b12)
    print(b21)
    print(b22)

    print("Resultant Matrix C:")
    print(c11)
    print(c12)
    print(c21)
    print(c22)

    return c11 + c12 + c21 + c22  # Return sum as a single output

# Initialize matrices with float values
result = matrix_multiply(
    1.0, 2.0, 
    3.0, 4.0, 
    5.0, 6.0, 
    7.0, 8.0
)
print("3. Euler's Number Approximation")

def compute_e(n: float) -> float:
    e = 1.0  # e starts at 1 (first term in series)
    factorial_1 = 1.0  # Track factorial separately
    term = 1.0  # Track individual term
    
    i = 1.0  # Start from 1, explicit integer type
    while i < n:
        factorial_1 *= i  # Explicit type conversion
        term = 1.0 / factorial_1  # Compute next term
        e += term  # Add term to sum
        i += 1.0  # Increment loop variable

    print("Computed e:")
    print(e)

    return e  # Return the computed value

# Run the function with a large number of iterations
compute_e(10000.0)

print("4. Intensive Floating-Point Computation")

def intensive_computation(n: float) -> float:
    x = 1010101.101
    y = 2020202.202
    z = 3030303.303
    w = 4040404.404

    i = 1.0  # Start with explicit float
    while i < n:
        x += (y / 1.0001) * 1.0002  # Floating point multiplication & division
        y *= (z / 1.0003) - 1.0004
        z += (w / 1.0005) * 1.0006
        w *= (x / 1.0007) - 1.0008
        i += 1.0  # Float increment

    print("Final Computed Values:")
    print(x)
    print(y)
    print(z)
    print(w)

    return x + y + z + w  # Return combined result

# Run for a large number of iterations to generate thousands of instructions
intensive_computation(50000.0)

print("5. Matrix Exponentiation")

def matrix_exponentiation(a11: float, a12: float, a21: float, a22: float, exp: float) -> float:
    # Initialize result matrix as identity
    r11 = 1.0
    r12 = 0.0
    r21 = 0.0
    r22 = 1.0

    # scale_factor = 1.00001 * exp  # Dynamic scale factor to prevent `inf`

    i = 0.0
    while i < exp:
        # Matrix multiplication (result *= base)
        t11 = (r11 * a11 + r12 * a21) 
        t12 = (r11 * a12 + r12 * a22)
        t21 = (r21 * a11 + r22 * a21) 
        t22 = (r21 * a12 + r22 * a22) 

        # Force redundant calculations (adds instruction count)
        t11 = (t11 * 1.0002 - t12 / 1.0003) * 1.0004
        t12 = (t12 * 1.0005 + t11 / 1.0006) * 1.0007
        t21 = (t21 * 1.0008 - t22 / 1.0009) * 1.0010
        t22 = (t22 * 1.0011 + t21 / 1.0012) * 1.0013

        r11 = t11
        r12 = t12
        r21 = t21
        r22 = t22

        i += 1.0  # Floating-point increment

    print("Final Matrix After Exponentiation:")
    print(r11)
    print(r12)
    print(r21)
    print(r22)

    return r11 + r12 + r21 + r22  # Sum of matrix elements as result

# Run with high exponentiation count (heavy but stable)
matrix_exponentiation(1.1, 1.2, 1.3, 1.4, 1000.0)  # Increased exponent count
