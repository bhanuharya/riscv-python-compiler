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
