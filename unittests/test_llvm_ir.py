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


class TestStringConcatIR(unittest.TestCase):
    """Structural checks for string concat/repeat lowering."""

    def test_concat_uses_memcpy(self):
        src = 'a = "hi" + "!"\nprint(a)\n'
        ir_text = ir_text_for(src)
        # The lowering must call llvm.memcpy to copy the two string
        # data buffers into a fresh buffer.
        self.assertIn('llvm.memcpy', ir_text)
        # Must store a null terminator.
        self.assertIn('store i8 0', ir_text)

    def test_repeat_has_loop(self):
        # String repeat lowers to a loop with a conditional branch and
        # a basic block per loop part (cond / body / after).
        src = 'a = "ab" * 3\nprint(a)\n'
        ir_text = ir_text_for(src)
        self.assertIn('llvm.memcpy', ir_text)
        # Loop back-edge: a `br` to a block that re-checks the condition.
        self.assertIn('repeat-cond:', ir_text)
        self.assertIn('repeat-body:', ir_text)
        self.assertIn('repeat-after:', ir_text)
        # No undef.
        self.assertNotIn('undef', ir_text)

    def test_concat_module_verifies(self):
        src = 'a = "Hello, " + "World!"\nb = 3 * "x"\nprint(a, b)\n'
        ir_text = ir_text_for(src)
        mod = llvm.parse_assembly(ir_text)
        mod.verify()

    def test_repeat_negative_does_not_crash(self):
        # Negative repeat must clamp to 0 and still produce a valid module.
        src = 'a = "x" * -3\nprint(a)\n'
        ir_text = ir_text_for(src)
        mod = llvm.parse_assembly(ir_text)
        mod.verify()


class TestHeapAllocatorIR(unittest.TestCase):
    """Structural checks for the heap allocator integration."""

    def test_pyr_alloc_declared(self):
        src = 'a = [1, 2, 3]\nprint(a[0])\n'
        ir_text = ir_text_for(src)
        self.assertIn('declare i8* @"pyr_alloc"', ir_text)
        self.assertIn('@"pyr_alloc_init"', ir_text)


class TestBuiltinsIR(unittest.TestCase):
    """Structural checks for the str/bool/abs/min/max builtins."""

    def test_sprintf_declared(self):
        src = 'a = str(42)\nprint(a)\n'
        ir_text = ir_text_for(src)
        self.assertIn('declare i32 @"sprintf"', ir_text)

    def test_str_int_uses_sprintf_and_strlen(self):
        src = 'a = str(42)\nprint(a)\n'
        ir_text = ir_text_for(src)
        # sprintf writes into a heap buffer; strlen measures the result.
        self.assertIn('call i32 (i8*, i8*, ...) @"sprintf"', ir_text)
        self.assertIn('@"strlen"', ir_text)
        self.assertIn('call i8* @"pyr_alloc"', ir_text)

    def test_bool_cast_is_icmp(self):
        src = 'a = bool(5)\nprint(a)\n'
        ir_text = ir_text_for(src)
        # bool() must lower to an icmp against zero producing an i1.
        self.assertRegex(ir_text, r'icmp[^\n]*i32[^\n]*0')

    def test_abs_int_uses_select(self):
        src = 'a = abs(-5)\nprint(a)\n'
        ir_text = ir_text_for(src)
        self.assertRegex(ir_text, r'select\s+i1')

    def test_float_minmax_avoids_select(self):
        # llc-14 miscompiles `select` on f64 for RV32 soft-float, so float
        # min/max/abs must use an explicit branch instead.
        src = 'a = min(3.14, 2.71)\nb = max(3.14, 2.71)\nc = abs(-2.5)\nprint(a, b, c)\n'
        ir_text = ir_text_for(src)
        self.assertNotIn('select double', ir_text)
        self.assertIn('fcmp', ir_text)

    def test_module_verifies_with_builtins(self):
        src = '''a = str(-7)
b = abs(-2.5)
c = min(3.0, 9.0)
d = bool(4)
print(a, b, c, d)
'''
        ir_text = ir_text_for(src)
        mod = llvm.parse_assembly(ir_text)
        mod.verify()

    def test_pyr_alloc_init_called(self):
        # The init function must be called at the start of main so the
        # heap is ready before any allocation.
        src = 'print(1)\n'
        ir_text = ir_text_for(src)
        self.assertIn('call void @"pyr_alloc_init"()', ir_text)

    def test_list_uses_pyr_alloc(self):
        # A list literal must lower to a call to pyr_alloc, not alloca.
        src = 'a = [1, 2, 3]\nprint(a[0])\n'
        ir_text = ir_text_for(src)
        self.assertIn('call i8* @"pyr_alloc"', ir_text)

    def test_string_concat_uses_pyr_alloc(self):
        src = 'a = "hi" + "!"\nprint(a)\n'
        ir_text = ir_text_for(src)
        self.assertIn('call i8* @"pyr_alloc"', ir_text)

    def test_string_repeat_uses_pyr_alloc(self):
        src = 'a = "ab" * 3\nprint(a)\n'
        ir_text = ir_text_for(src)
        self.assertIn('call i8* @"pyr_alloc"', ir_text)

    def test_range_uses_pyr_alloc(self):
        src = 'for i in range(3):\n    print(i)\n'
        ir_text = ir_text_for(src)
        self.assertIn('call i8* @"pyr_alloc"', ir_text)

    def test_module_verifies_with_heap_alloc(self):
        # The module must still verify when heap allocation is used.
        src = '''def make() -> list[int]:
    a = [1, 2, 3]
    b = "foo" + "bar"
    return a
x = make()
print(x[0])
'''
        ir_text = ir_text_for(src)
        mod = llvm.parse_assembly(ir_text)
        mod.verify()


if __name__ == '__main__':
    unittest.main()
