"""End-to-end regression tests: oracle vs QEMU, opt vs no-opt.

These tests require the external RISC-V toolchain and QEMU. They are skipped
automatically when the toolchain is unavailable.
"""

import unittest

from unittests.helpers import (
    oracle_output,
    qemu_output,
    toolchain_available,
    DEFAULT_PASSES,
)

BENCHMARKS = ['variables', 'standard', 'medium', 'complex']


def benchmark_source(name: str) -> str:
    import pathlib
    root = pathlib.Path(__file__).resolve().parent.parent
    return (root / 'tests' / f'{name}.py').read_text()


@unittest.skipUnless(toolchain_available(), 'RISC-V toolchain not available')
class TestOracleVsQemu(unittest.TestCase):
    maxDiff = None

    def check_equivalence(self, src: str, passes=None):
        expected, exp_status = oracle_output(src)
        code, actual = qemu_output(src, passes=passes)
        self.assertEqual(exp_status, 0, 'oracle reported non-zero status')
        self.assertEqual(code, 0, f'QEMU exited {code}')
        self.assertEqual(actual, expected.encode())

    def test_benchmarks_optimized(self):
        for name in BENCHMARKS:
            with self.subTest(name=name):
                self.check_equivalence(benchmark_source(name),
                                       passes=DEFAULT_PASSES)

    def test_benchmarks_unoptimized(self):
        for name in BENCHMARKS:
            with self.subTest(name=name):
                self.check_equivalence(benchmark_source(name), passes=None)

    def test_scalar_edge_cases(self):
        src = '''
a = -7
b = 3
print(a / b)
print(a % b)
x = 5
if x > 0 and x < 10:
    print("and")
if x < 0 or x > 2:
    print("or")
print(not False)
print(True, False)
'''
        self.check_equivalence(src)

    def test_sroa_pointer_layout_regression(self):
        # Regression: SROA used to mis-scalarize the {i32, i8*} slice
        # aggregate because the data layout lacked p:32:32. This exercises
        # list construction + iteration through the sroa pass.
        src = '''
items = ["foo", "bar", "baz"]
for it in items:
    print(it)
print(len(items))
'''
        self.check_equivalence(src, passes='sroa')

    def test_void_main_exit_status_regression(self):
        # Regression: the entry point must be i32 @main returning 0, so the
        # process exit status is 0 (not garbage from a void main).
        src = 'a = 1\nb = 2\nprint(a + b)\n'
        self.check_equivalence(src)

    def test_recursion_and_calls(self):
        src = '''
def fib(n: int) -> int:
    if n <= 1:
        return n
    return fib(n - 1) + fib(n - 2)

def add(a: int, b: int) -> int:
    return a + b

print(fib(10))
print(add(3, 4))
'''
        self.check_equivalence(src)

    def test_subscript_assignment(self):
        # Plain element assignment a[i] = x (the feature this commit adds).
        src = 'a = [1, 2, 3]\na[0] = 5\nprint(a[0])\n'
        self.check_equivalence(src)

    def test_subscript_assign_through_alias(self):
        # Lists are reference types: writing through one alias is visible
        # through another. This must hold in the backend exactly as in
        # the oracle.
        src = 'a = [1, 2, 3]\nb = a\nb[0] = 99\nprint(a[0], a[1], b[2])\n'
        self.check_equivalence(src)

    def test_nested_subscript_assignment(self):
        src = 'm = [[1, 2], [3, 4]]\nm[0][1] = 10\nprint(m[0][0], m[0][1], m[1][1])\n'
        self.check_equivalence(src)

    def test_subscript_assign_in_loop(self):
        src = 'a = [0, 0, 0]\nfor i in range(3):\n    a[i] = i * 10\nprint(a[0], a[1], a[2])\n'
        self.check_equivalence(src)

    def test_string_concat(self):
        src = 'a = "Hello, " + "World!"\nprint(a)\n'
        self.check_equivalence(src)

    def test_string_repeat_str_int(self):
        src = 'a = "ab" * 3\nprint(a)\n'
        self.check_equivalence(src)

    def test_string_repeat_int_str(self):
        src = 'a = 3 * "ab"\nprint(a)\n'
        self.check_equivalence(src)

    def test_string_repeat_zero_and_negative(self):
        # CPython: both yield empty string
        src = 'print("ab" * 0)\nprint("ab" * -1)\n'
        self.check_equivalence(src)

    def test_string_concat_in_loop(self):
        src = '''s = ""
i = 0
while i < 5:
    s = s + "x"
    i = i + 1
print(s)
'''
        self.check_equivalence(src)

    def test_string_repeat_in_for(self):
        src = 'for i in range(4):\n    print("x" * i)\n'
        self.check_equivalence(src)

    def test_string_concat_with_len(self):
        src = 'a = "Hello, " + "World!"\nprint(len(a))\n'
        self.check_equivalence(src)

    def test_string_returned_from_function(self):
        # A function returns a concatenated string. The buffer must
        # survive the function return (heap-allocated, not stack).
        src = '''def make() -> str:
    s = "foo" + "bar" + "baz"
    return s
print(make())
'''
        self.check_equivalence(src)

    def test_list_returned_from_function(self):
        # A function builds a list and returns it. The data buffer must
        # survive the function return.
        src = '''def make() -> list[int]:
    a = [10, 20, 30]
    return a
x = make()
print(x[0], x[1], x[2])
'''
        self.check_equivalence(src)

    def test_range_returned_from_function(self):
        src = '''def make() -> list[int]:
    r = range(4)
    return r
x = make()
for v in x:
    print(v)
'''
        self.check_equivalence(src)

    def test_list_passed_and_mutated(self):
        # Pass a list to a function that mutates it; mutation visible
        # after return. This requires heap-allocated buffers.
        src = '''def fill(a: list[int]):
    i = 0
    while i < 3:
        a[i] = i * 100
        i = i + 1
x = [0, 0, 0]
fill(x)
print(x[0], x[1], x[2])
'''
        self.check_equivalence(src)

    def test_builtin_str(self):
        src = '''print(str(123))
print(str(-456))
print(str(0))
print(str(3.14))
print(str(-2.5))
print(str(0.0))
a = "n=" + str(7)
print(a)
'''
        self.check_equivalence(src)

    def test_builtin_bool_abs(self):
        src = '''print(bool(0))
print(bool(1))
print(bool(-5))
print(abs(5))
print(abs(-5))
print(abs(0))
print(abs(-2.5))
'''
        self.check_equivalence(src)

    def test_builtin_min_max(self):
        src = '''print(min(3, 7), max(3, 7), min(-1, -5), max(-1, -5))
print(min(3.14, 2.71))
print(max(3.14, 2.71))
x = min(10, 20) + max(10, 20)
print(x)
'''
        self.check_equivalence(src)

    def test_builtins_in_function(self):
        # Builtins must work inside user functions whose results are
        # returned (exercises heap buffers + polymorphic types).
        src = '''def label(n: int) -> str:
    return "v=" + str(n)

def clip(x: int) -> int:
    return min(max(x, 0), 100)

a = label(42)
b = clip(-5)
c = clip(150)
d = abs(-2.5)
print(a, b, c, d)
'''
        self.check_equivalence(src)


@unittest.skipUnless(toolchain_available(), 'RISC-V toolchain not available')
class TestOptEquivalence(unittest.TestCase):
    """Optimized and unoptimized binaries must agree with each other."""

    def test_opt_vs_noopt(self):
        for name in BENCHMARKS:
            with self.subTest(name=name):
                src = benchmark_source(name)
                code1, out1 = qemu_output(src, passes=None)
                code2, out2 = qemu_output(src, passes=DEFAULT_PASSES)
                self.assertEqual(code1, 0)
                self.assertEqual(code2, 0)
                self.assertEqual(out1, out2)


if __name__ == '__main__':
    unittest.main()
