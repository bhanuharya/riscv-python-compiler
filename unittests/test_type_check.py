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

    def test_string_concat(self):
        typecheck_source('a = "hi"\nb = a + "!"\nprint(b)\n')

    def test_string_repeat_str_int(self):
        typecheck_source('a = "ab" * 3\nprint(a)\n')

    def test_string_repeat_int_str(self):
        typecheck_source('a = 3 * "ab"\nprint(a)\n')

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

    def test_subscript_assign(self):
        typecheck_source('a = [1, 2, 3]\na[0] = 5\nprint(a[0])\n')

    def test_nested_subscript_assign(self):
        typecheck_source('m = [[1, 2], [3, 4]]\nm[0][1] = 10\n')

    def test_subscript_assign_type_mismatch(self):
        self.assert_compile_error(
            'a = [1, 2, 3]\na[0] = "x"\n', 'Cannot assign')

    def test_return_wrong_type(self):
        self.assert_compile_error(
            'def f() -> int:\n    return 1.5\n', 'Cannot return')

    def test_str_plus_int_rejected(self):
        self.assert_compile_error('a = "x" + 1\n', 'binary operation')

    def test_str_plus_list_rejected(self):
        self.assert_compile_error('a = [1]\nb = "x" + a\n', 'binary operation')

    def test_str_times_float_rejected(self):
        self.assert_compile_error('a = "x" * 1.5\n', 'binary operation')

    def test_int_times_list_rejected(self):
        self.assert_compile_error('a = [1]\nb = 2 * a\n', 'binary operation')


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

    def test_subscript_assign_aliases(self):
        # Lists are reference types: writing through one alias must be
        # visible through another.
        src = '''a = [1, 2, 3]
b = a
b[0] = 99
print(a[0], a[1], b[2])
'''
        out, status = oracle_output(src)
        self.assertEqual(status, 0)
        self.assertEqual(out, '99 2 3\n')

    def test_string_concat(self):
        out, status = oracle_output(
            'a = "Hello, "\nb = "World!"\nprint(a + b)\n')
        self.assertEqual(status, 0)
        self.assertEqual(out, 'Hello, World!\n')

    def test_string_concat_empty(self):
        out, status = oracle_output(
            'a = "x" + ""\nb = "" + "y"\nc = "" + ""\nprint(a, b, c)\n')
        self.assertEqual(status, 0)
        self.assertEqual(out, 'x y \n')

    def test_string_concat_chained(self):
        out, status = oracle_output(
            'a = "a" + "b" + "c" + "d"\nprint(a)\n')
        self.assertEqual(status, 0)
        self.assertEqual(out, 'abcd\n')

    def test_string_repeat_str_int(self):
        out, status = oracle_output('print("ab" * 3)\n')
        self.assertEqual(status, 0)
        self.assertEqual(out, 'ababab\n')

    def test_string_repeat_int_str(self):
        out, status = oracle_output('print(3 * "ab")\n')
        self.assertEqual(status, 0)
        self.assertEqual(out, 'ababab\n')

    def test_string_repeat_zero(self):
        out, status = oracle_output('print("ab" * 0)\n')
        self.assertEqual(status, 0)
        self.assertEqual(out, '\n')

    def test_string_repeat_negative(self):
        # CPython: "ab" * -1 == ""
        out, status = oracle_output('print("ab" * -1)\n')
        self.assertEqual(status, 0)
        self.assertEqual(out, '\n')

    def test_string_repeat_one(self):
        out, status = oracle_output('print("test" * 1)\n')
        self.assertEqual(status, 0)
        self.assertEqual(out, 'test\n')

    def test_string_repeat_empty_string(self):
        # "" * 5 == "" (count is 0, loop runs but copies 0 bytes)
        out, status = oracle_output('print("" * 5)\n')
        self.assertEqual(status, 0)
        self.assertEqual(out, '\n')

    def test_string_concat_then_len(self):
        out, status = oracle_output(
            'a = "Hello, " + "World!"\nprint(len(a))\n')
        self.assertEqual(status, 0)
        self.assertEqual(out, '13\n')

    def test_string_repeat_in_loop(self):
        out, status = oracle_output('''i = 0
while i < 4:
    print("x" * i)
    i = i + 1
''')
        self.assertEqual(status, 0)
        self.assertEqual(out, '\nx\nxx\nxxx\n')

    def test_string_concat_with_input(self):
        # Verifies concat works on a non-literal (input) string
        out, status = oracle_output(
            'a = input("> ")\nb = a + "!"\nprint(b)\n', stdin='hi\n')
        self.assertEqual(status, 0)
        # The input prompt "> " is printed before the result.
        self.assertEqual(out, '> hi!\n')


if __name__ == '__main__':
    unittest.main()
