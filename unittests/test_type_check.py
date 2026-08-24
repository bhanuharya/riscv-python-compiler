"""Type-checker and frontend regression tests."""

import unittest

from src.error import CompileError

from unittests.helpers import typecheck_source, oracle_output


class TestTypeCheckerAccepts(unittest.TestCase):
    def test_core_scalars(self):
        src = '''
a = 1
b = 2.5
c = True
d = "hello"
x = a + 2
y = b * 2.0
z = not c
print(x, y, z, d)
'''
        typecheck_source(src)  # must not raise

    def test_unary_ops(self):
        typecheck_source('x = -5\n')
        typecheck_source('x = +5\n')
        typecheck_source('b = True\nc = not b\n')

    def test_pass(self):
        typecheck_source('def f():\n    pass\n')

    def test_void_function_returns_none(self):
        src = '''
def f() -> None:
    return
f()
'''
        typecheck_source(src)

    def test_recursion(self):
        src = '''
def fib(n: int) -> int:
    if n <= 1:
        return n
    return fib(n - 1) + fib(n - 2)
print(fib(10))
'''
        typecheck_source(src)


class TestTypeCheckerRejects(unittest.TestCase):
    def assert_compile_error(self, src, *fragments):
        with self.assertRaises(CompileError) as cm:
            typecheck_source(src)
        msg = str(cm.exception)
        for frag in fragments:
            self.assertIn(frag, msg)

    def test_missing_return(self):
        self.assert_compile_error(
            'def f() -> int:\n    x = 1\n', 'does not return')

    def test_undefined_name(self):
        self.assert_compile_error('x = y + 1\n', 'Undefined identifier y')

    def test_type_mismatch(self):
        self.assert_compile_error(
            'x = 1\nx = 2.5\n', 'Cannot assign')

    def test_bool_not_int(self):
        self.assert_compile_error(
            'x = 1\nx = True\n', 'Cannot assign')

    def test_break_outside_loop(self):
        self.assert_compile_error('break\n', 'break outside')

    def test_non_bool_condition(self):
        self.assert_compile_error('if 1:\n    pass\n', 'not a boolean')

    def test_mixed_arithmetic(self):
        self.assert_compile_error('x = 1 + 2.0\n', 'Cannot perform')

    def test_unannotated_arg(self):
        self.assert_compile_error(
            'def f(x):\n    return x\n', 'needs to have a type annotation')

    def test_chained_comparison(self):
        self.assert_compile_error(
            'a = 1\nb = 2\nc = a < b < 3\n', 'Multiple comperators')

    def test_return_wrong_type(self):
        self.assert_compile_error(
            'def f() -> int:\n    return 1.5\n', 'Cannot return')


class TestOracleSemantics(unittest.TestCase):
    def test_int_division_is_truncating(self):
        out, status = oracle_output('print(-7 / 3)\nprint(7 / -3)\n')
        self.assertEqual(status, 0)
        self.assertEqual(out, '-2\n-2\n')

    def test_int_mod_is_srem(self):
        out, status = oracle_output('print(-7 % 3)\nprint(7 % -3)\n')
        self.assertEqual(status, 0)
        self.assertEqual(out, '-1\n1\n')

    def test_bool_print_is_01(self):
        out, status = oracle_output('print(True)\nprint(False)\n')
        self.assertEqual(status, 0)
        self.assertEqual(out, '1\n0\n')

    def test_short_circuit(self):
        src = '''
def side(x: int) -> bool:
    print(x)
    return x > 0

a = side(1) and side(0) and side(2)
b = side(1) or side(0) or side(2)
print(a, b)
'''
        out, status = oracle_output(src)
        self.assertEqual(status, 0)
        # side(2) must not run: and short-circuits at side(0)==False,
        # or short-circuits at side(1)==True.
        self.assertEqual(out, '1\n0\n1\n0 1\n')


if __name__ == '__main__':
    unittest.main()
