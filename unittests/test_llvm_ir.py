"""LLVM backend / IR structural regression tests."""

import ast
import unittest

import llvmlite.binding as llvm

from src.type_check import TypeChecker

llvm.initialize()
llvm.initialize_all_targets()
llvm.initialize_all_asmprinters()


def ir_text_for(src: str, name: str = 'test') -> str:
    """Run the frontend+backend and return the emitted LLVM IR text."""
    tc = TypeChecker(name)
    checked = tc.evalNode(ast.parse(src, filename=name))
    from src.llvm import LLVMBackend
    backend = LLVMBackend(name, outFile='/dev/null')
    backend.evalNode(checked, False)
    backend.emitFile()
    return str(backend.module)


class TestTargetAndLayout(unittest.TestCase):
    def test_triple(self):
        ir = ir_text_for('x = 1\n')
        self.assertIn('target triple = "riscv32-unknown-linux-gnu"', ir)

    def test_data_layout_pointer_32(self):
        # p:32:32 is load-bearing for SROA of slice aggregates.
        ir = ir_text_for('x = 1\n')
        self.assertIn('p:32:32', ir)

    def test_main_returns_i32_zero(self):
        ir = ir_text_for('x = 1\n')
        self.assertIn('define i32 @"main"()', ir)
        self.assertIn('ret i32 0', ir)


class TestNoUndef(unittest.TestCase):
    def test_bool_op_no_placeholder_block_crash(self):
        # Regression: `and`/`or` used to construct ir.Block(None) and crash.
        src = 'a = True\nb = False\nif a and not b:\n    print(1)\n'
        ir = ir_text_for(src)
        self.assertNotIn('undef', ir)

    def test_void_functions_return_defined_value(self):
        # Missing-return is rejected by the type checker; a defensive path
        # must still never introduce undef for a non-void function.
        src = '''
def f() -> int:
    return 1
print(f())
'''
        ir = ir_text_for(src)
        self.assertNotIn('undef', ir)


class TestIRVerifies(unittest.TestCase):
    def test_verify_accepts(self):
        src = '''
def fib(n: int) -> int:
    if n <= 1:
        return n
    return fib(n - 1) + fib(n - 2)

a = fib(5)
b = a < 10 and a > 0
items = [1, 2, 3]
for it in items:
    print(it)
while a > 0:
    a -= 1
print(a, b)
'''
        ir_text = ir_text_for(src)
        mod = llvm.parse_assembly(ir_text)
        mod.verify()  # raises on failure


class TestSubscriptAssignmentIR(unittest.TestCase):
    """Structural checks for a[i] = x lowering."""

    def test_store_through_gep(self):
        # The backend must lower a[i] = x to a store through a GEP into
        # the list data buffer. There must be no undef.
        src = 'a = [1, 2, 3]\na[0] = 5\nprint(a[0])\n'
        ir = ir_text_for(src)
        self.assertIn('getelementptr', ir)
        self.assertIn('store', ir)
        self.assertNotIn('undef', ir)

    def test_subscript_assign_module_verifies(self):
        src = 'a = [1, 2, 3]\nb = a\nb[0] = 99\nprint(a[0], b[1])\n'
        ir = ir_text_for(src)
        mod = llvm.parse_assembly(ir)
        mod.verify()


if __name__ == '__main__':
    unittest.main()
