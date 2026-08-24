import opcode
import types
from .constants import REGISTER_SIZE
from .checked_nodes import *
from pathlib import Path

import llvmlite.ir as ir
import llvmlite.binding as llvm

PRINT_IR = False
#PRINT_IR = True

class LLVMSymbol():
    t: Class
    ptr: ir.Value
    def __init__(self, t: Class, ptr: ir.Value):
        self.t = t
        self.ptr = ptr

class LLVMBackend():
    module: ir.Module
    fn: ir.Function
    builder: ir.IRBuilder
    symbols: list[dict[str, LLVMSymbol]]
    target_machine: llvm.TargetMachine
    triple: str
    def __init__(self, fileName: str):
        llvm.initialize()
        llvm.initialize_all_targets()
        llvm.initialize_all_asmprinters()
        self.triple = 'riscv32-unknown-linux-gnu'
        target = llvm.Target.from_triple(self.triple)
        self.target_machine = target.create_target_machine()
        self.module = ir.Module(Path(fileName).stem)
        self.module.triple = self.triple
        self.module.data_layout = 'e-m:e-p:32:32-i32:32-i16:16-i8:8-n32-S32'

        #self.module.triple = llvm.get_default_triple()
        self.fn = ir.Function(module=self.module, ftype=ir.FunctionType(return_type=ir.IntType(32), args=()), name='main')
        entry = self.fn.append_basic_block('entry')
        self.builder = ir.IRBuilder(entry)
        
        self.symbols = list[dict[str, LLVMSymbol]]()
        self.symbols.append(dict[str, LLVMSymbol]())

        int8: ir.IntType = ir.IntType(8)
        voidPtr = ir.PointerType(int8)
        memcpy = ir.Function(self.module, ir.FunctionType(ir.VoidType(), [
            voidPtr,
            voidPtr,
            ir.IntType(REGISTER_SIZE),
            ir.IntType(1)
        ]), 'llvm.memcpy.p0.p0.i32')

        printf = ir.Function(self.module, ir.FunctionType(ir.IntType(REGISTER_SIZE), [
            ir.IntType(8).as_pointer(), # Format
        ], True), 'printf')

        readline = ir.Function(self.module, ir.FunctionType(ir.IntType(8).as_pointer(), [
            ir.IntType(8).as_pointer(), # Prompt
        ], True), 'readline')


        strlen = ir.Function(self.module, ir.FunctionType(ir.IntType(REGISTER_SIZE), [
            ir.IntType(8).as_pointer(), # Format
        ], True), 'strlen')

        memcmp = ir.Function(self.module, ir.FunctionType(ir.IntType(REGISTER_SIZE//2), [
            voidPtr,
            voidPtr,
            ir.IntType(REGISTER_SIZE),
        ]), 'memcmp')

        self.symbols[0]['memcpy'] = LLVMSymbol( FnType([], noneType()),  memcpy)
        self.symbols[0]['printf'] = LLVMSymbol( FnType([], noneType()),  printf)
        self.symbols[0]['readln'] = LLVMSymbol( FnType([], noneType()),  readline)
        self.symbols[0]['memcmp'] = LLVMSymbol( FnType([], noneType()),  memcmp)
        self.symbols[0]['strlen'] = LLVMSymbol( FnType([], noneType()),  strlen)

        self.breakBlock: list[ir.Block] = list()

        self.globalCount = 0

    def emitFile(self):
        self.builder.ret(self.getConstant(0, 32))
        llvm_ir = str(self.module)
        
        if PRINT_IR:
            print(llvm_ir)

        parsed = llvm.parse_assembly(llvm_ir)
        parsed.data_layout = self.module.data_layout
        parsed.triple = self.triple
        parsed.verify()

        #pass_builder = llvm.create_pass_manager_builder()

        #pass_builder.opt_level = 3
        #module_manager = llvm.create_module_pass_manager()
        #self.target_machine.add_analysis_passes(module_manager)
        #pass_builder.populate(module_manager)
        #module_manager.run(parsed)
        #print(parsed)

        with open('out.ll', 'w+') as f:
            print("ok")
            f.write(str(parsed))

    def getConstString(self, string: str) -> ir.Value:
        strBytes = bytearray(string.encode()) + b'\x00'
        strT = ir.ArrayType(ir.IntType(8), len(strBytes))
        strConstant = ir.Constant(strT, strBytes)

        globalV = ir.GlobalVariable(
            self.module, strT, str(self.globalCount))
        globalV.global_constant = True
        globalV.initializer = strConstant # type: ignore
        globalV.linkage = 'internal'
        self.globalCount += 1

        zero = self.getConstant(0, 32)
        return self.builder.gep(globalV, [zero, zero])
    
    def doMemcpy(self, dst: ir.Value, src: ir.Value, size: ir.Value):
        voidPtr = ir.PointerType(ir.IntType(8))
        p1 = self.builder.bitcast(dst, voidPtr)
        p2 = self.builder.bitcast(src, voidPtr)
        assert p1 is not None
        assert p2 is not None
        dst = p1
        src = p2
        memcpy = self.symbols[0]['memcpy']
        self.builder.call(memcpy.ptr, [dst, src, size, ir.Constant(ir.IntType(1), 0)])

    def doStore(self, ptr: ir.Value, val: ir.Value, t: Class):
        if t.isLoadable():
            self.builder.store(val, ptr)
        else:
            size = self.getConstant(t.getTypeSize())
            self.doMemcpy(ptr, val, size)


    def evalNode(self, node: CheckedNode, lhs: bool) -> ir.Value | None:
        match node.base:
            case ast.Module():
                assert isinstance(node, CheckedModuleNode)
                mod: CheckedModuleNode
                mod = node
                for stmt in mod.statements:
                    self.evalNode(stmt, False)
            case ast.BinOp():
                assert isinstance(node, CheckedBinNode)
                return self.evalBinOp(node, lhs)
            case ast.Expr():
                return self.evalExpr(node, lhs)
            case ast.Assign():
                assert isinstance(node, CheckedAssignNode)
                return self.evalAssign(node, lhs)
            case ast.Constant():
                return self.evalConstant(node)
            case ast.AugAssign():
                assert isinstance(node, CheckedBinNode)
                return self.evalAugAssign(node, lhs)
            case ast.Call():
                assert isinstance(node, CheckedCallNode)
                return self.evalCall(node, lhs)
            case ast.Name():
                return self.evalName(node, lhs)
            case ast.FunctionDef():
                assert isinstance(node, CheckedFnDefNode)
                return self.evalFnDef(node)
            case ast.Return():
                assert isinstance(node, CheckedReturnNode)
                return self.evalReturn(node)
            case ast.If():
                assert isinstance(node, CheckedIfNode)
                return self.evalIf(node)
            case ast.Compare():
                assert isinstance(node, CheckedBinNode)
                return self.evalCompare(node)
            case ast.List():
                assert isinstance(node, CheckedListNode)
                return self.evalList(node)
            case ast.While():
                assert isinstance(node, CheckedIfNode)
                return self.evalWhile(node)
            case ast.Break():
                return self.evalBreak(node)
            case ast.BoolOp():
                assert isinstance(node, CheckedBoolOpNode)
                return self.evalBoolOp(node)
            case ast.Subscript():
                assert isinstance(node, CheckedSubscriptNode)
                return self.evalSubscript(node, lhs)
            case ast.For():
                assert isinstance(node, CheckedForNode)
                return self.evalFor(node)
            case _:
                print(f'LLVM unknown node type: {node.base}')
                assert False
        return None

    def isTerminated(self) -> bool:
        assert self.builder.block is not None
        return self.builder.block.is_terminated

    def evalSubscript(self, node: CheckedSubscriptNode, lhs: bool):
        op = self.evalNode(node.op, True)
        idx = self.evalNode(node.subscript, False)
        zero = self.getConstant(0, 32)
        one = self.getConstant(1, 32)

        # @TODO: bounds checking
        dataPtr = self.builder.gep(op, [zero, one])
        data = self.builder.load(dataPtr)
        elem = self.builder.gep(data, [idx])

        # If we are on the left-hand side (ex. list[3] = x) we don't load the result
        # also if it's not loadble, (ex. foo = ['str1', 'str2'] y = foo[0]) we don't load the result
        if lhs or not node.t.isLoadable():
            return elem
        else:
            return self.builder.load(elem)

    def evalBody(self, body: list[CheckedNode], block: ir.Block, after: ir.Block):
        self.builder.position_at_end(block)
        for stmt in body:
            self.evalNode(stmt, False)
        if not self.isTerminated():
            self.builder.branch(after)

    def evalList(self, node: CheckedListNode) -> ir.Value:
        # Evaluate all the values in the list
        vals = list[ir.Value]()
        for v in node.vals:
            evaled = self.evalNode(v, False)
            assert evaled is not None
            vals.append(evaled)

        # I should probably save these in self
        zero = self.getConstant(0, 32)
        one = self.getConstant(1, 32)

        # Allocate the list
        llvmT = node.t.toLLVM()
        listV = self.builder.alloca(llvmT)

        # Store the count in the list.count
        countPtr = self.builder.gep(listV, [zero, zero])
        self.builder.store(self.getConstant(len(vals)), countPtr)

        # if the list is empty we're done
        if len(vals) == 0:
            return listV

        # Allocate a buffer for the list data
        data = self.builder.alloca(node.t.asList().base.toLLVM(), len(vals))

        # list.data = allocated buffer
        dataPtr = self.builder.gep(listV, [zero, one])
        self.builder.store(data, dataPtr)

        # Walk through all the values
        # and store them in the list
        for i in range(len(node.vals)):
            iLLVM = self.getConstant(i, 32)
            ptr = self.builder.gep(data, [iLLVM])
            self.doStore(ptr, vals[i], node.t.asList().base)

        return listV
    
    def evalBoolOp(self, node: CheckedBoolOpNode) -> ir.Value:
        assert len(node.vals) >= 2
        
        suffix = node.op
        
        # Result allocation, its value is returned
        res = self.builder.alloca(ir.IntType(1))
        true = self.fn.append_basic_block('true-' + suffix)
        false = self.fn.append_basic_block('false-' + suffix)

        if node.op == 'and':
            # Allocate blocks
            blocks = [ir.Block(None)] * (len(node.vals))
            for i in range(len(blocks)-1):
                blocks[i] = self.fn.append_basic_block()
            blocks[-1] = true

            # Loop through each value, if it's true go to evaluate the next one
            # if it's false, go to the false block
            for i, v in enumerate(node.vals):
                expr = self.evalNode(v, False)
                self.builder.cbranch(expr, blocks[i], false)
                self.builder.position_at_end(blocks[i])
        else:
            assert node.op == 'or'

            # Allocate blocks
            blocks: list[ir.Block]  = [ir.Block(None)] * (len(node.vals))
            for i in range(len(blocks)-1):
                blocks[i] = self.fn.append_basic_block()
            blocks[-1] = false

            # Loop through each value, if it's true go to the true block
            # if it's false, go to the next one
            for i, v in enumerate(node.vals):
                expr = self.evalNode(v, False)
                self.builder.cbranch(expr, true, blocks[i])
                self.builder.position_at_end(blocks[i])
        
        after = self.fn.append_basic_block('after-' + suffix)
        # False block stores 0 in result allocation
        self.builder.position_at_end(false)
        self.builder.store(ir.Constant(ir.IntType(1), 0), res)
        self.builder.branch(after)

        # True block stores 1 in result allocation
        self.builder.position_at_end(true)
        self.builder.store(ir.Constant(ir.IntType(1), 1), res)
        self.builder.branch(after)

        # Reset the builder to a block where the rest of the code can be written
        # Load the result and return it
        self.builder.position_at_end(after)
        return self.builder.load(res)

    def evalBreak(self, node: CheckedNode) -> None:
        assert len(self.breakBlock) > 0
        assert node is not None
        self.builder.branch(self.breakBlock[-1])

    def evalIf(self, node: CheckedIfNode) -> None:
        #@TODO: ternary operators
        expr = self.evalNode(node.expr, False)

        iftrue = self.fn.append_basic_block('if-true')
        orelse = self.fn.append_basic_block('or-else')
        after = self.fn.append_basic_block('after')
        self.builder.cbranch(expr, iftrue, orelse)

        self.evalBody(node.iftrue, iftrue, after)
        self.evalBody(node.orelse, orelse, after)

        self.builder.position_at_end(after)

    def doStringCompare(self, node: CheckedBinNode) -> ir.Value:
        lhs = self.evalNode(node.left, True)
        rhs = self.evalNode(node.right, True)

        zero = self.getConstant(0, 32)
        one = self.getConstant(1, 32)
        leftCountPtr = self.builder.gep(lhs, [zero, zero])
        leftDataPtr = self.builder.gep(lhs,  [zero, one])
        rightCountPtr = self.builder.gep(rhs, [zero, zero])
        rightDataPtr = self.builder.gep(rhs,  [zero, one])

        memcmpB = self.fn.append_basic_block('do_memcmp')
        trueB = self.fn.append_basic_block('true-cmp')
        afterB = self.fn.append_basic_block('after')

        # Allocate result and set it to 0
        # It will be set to 1 if the comparison is true
        result = self.builder.alloca(ir.IntType(1))
        self.builder.store(self.getConstant(0, 1), result)

        # Compare the counts of the 2 strings
        # If they are equal compare the contents
        # Otherwise go to the end
        leftCount = self.builder.load(leftCountPtr)
        rightCount = self.builder.load(rightCountPtr)
        countCond = self.builder.icmp_signed('==', leftCount, rightCount)
        self.builder.cbranch(countCond, memcmpB, afterB)

        self.builder.position_at_end(memcmpB)
        leftData = self.builder.load(leftDataPtr)
        rightData = self.builder.load(rightDataPtr)
        memcmp = self.symbols[0]['memcmp'].ptr
        memcmpResult = self.builder.call(memcmp, [leftData, rightData, rightCount])

        # memcmp returns 0 on success turn it into True or False
        # If the comparison was successful go to the true block
        # Otherwise go to the end
        zero = self.getConstant(0, REGISTER_SIZE//2)
        dataCond = self.builder.icmp_signed('==', memcmpResult, zero)
        self.builder.cbranch(dataCond, trueB, afterB)

        # Make the true block
        # it just sets 1 to the result and goes to the end
        self.builder.position_at_end(trueB)
        self.builder.store(self.getConstant(1, 1), result)
        self.builder.branch(afterB)

        # Finally load the result and return it
        self.builder.position_at_end(afterB)
        return self.builder.load(result)

        
    def evalCompare(self, node: CheckedBinNode):
        if node.left.t.name == 'str':
            res = self.doStringCompare(node)
            match node.op:
                case ast.Eq():
                    return res
                case ast.NotEq():
                    res = self.builder.icmp_signed('==', res, self.getConstant(0, 1))
                    return res
                case _: assert False

        return self.evalBinOp(node, False)

    def evalReturn(self, node: CheckedReturnNode) -> None:
        if node.expr is None:
            self.builder.ret_void()
            return
        
        val = self.evalNode(node.expr, False)
        self.builder.ret(val)

    def makeFnName(self, name: str):
        return self.module.name + '.' + name

    def evalFnDef(self, node: CheckedFnDefNode) -> ir.Value:
        assert isinstance(node.base, ast.FunctionDef)
        base: ast.FunctionDef
        base = node.base

        fn = ir.Function(module=self.module, ftype=node.t.toLLVM(), name=self.makeFnName(base.name))
        entry = fn.append_basic_block('entry')

        self.symbols[-1][self.makeFnName(base.name)] = LLVMSymbol(node.t, fn)
        self.symbols.append(dict())

        was_fn = self.fn
        was_builder = self.builder
        self.fn = fn
        self.builder = ir.IRBuilder(entry)

        for i, arg in enumerate(node.args):
            llvmArg = fn.args[i]
            alloca = self.builder.alloca(arg[1].toLLVM())
            self.doStore(alloca, llvmArg, arg[1])
            self.symbols[-1][arg[0]] = LLVMSymbol(arg[1], alloca)

        for stmt in node.statements:
            self.evalNode(stmt, False)

        retType = node.t.asCallable().returnType
        if not self.isTerminated():
            if len(self.builder.basic_block.instructions) != 0 or retType.name == '<None>':
                self.builder.ret_void()
            else:
                # Have to terminate empty block, potentially created from if/for statement
                alloc = self.builder.alloca(retType.toLLVM())
                if retType.isLoadable():
                    self.builder.ret(self.builder.load(alloc))
                else:
                    self.builder.ret(alloc)

        self.fn = was_fn
        self.builder = was_builder

        return fn
    
    def evalFor(self, node: CheckedForNode):
        self.symbols.append(dict())

        zero = self.getConstant(0, 32)
        one = self.getConstant(1, 32)
        vars = list[str]()

        # Allocate the iterator variables
        # that's x in this example: for x in myList:
        for name, t in node.vars:
            alloc = self.builder.alloca(t.toLLVM())
            self.symbols[-1][name] = LLVMSymbol(t, alloc)
            vars.append(name)

        # Evaluate the list
        iter = self.evalNode(node.iter, True)

        # Allocate an index to keep track of while iterating
        idx = self.builder.alloca(ir.IntType(REGISTER_SIZE))
        self.builder.store(self.getConstant(0), idx)

        # Make a block for the iterating condition (idx < myList.count)
        condB = self.fn.append_basic_block('cond')
        # Make a block for the body of the for loop
        bodyB = self.fn.append_basic_block('for-body')
        # Make a block for the orelse of the for loop
        orelseB = self.fn.append_basic_block('orelse-body')
        # Make a block for after the loop is done
        afterB = self.fn.append_basic_block('after-for')

        # Jump to the condition block
        self.builder.branch(condB)

        # Write the condition for the loop
        self.builder.position_at_end(condB)
        i = self.builder.load(idx)
        countPtr = self.builder.gep(iter, [zero, zero])
        count = self.builder.load(countPtr)
        cond = self.builder.icmp_signed('<', i, count)
        self.builder.cbranch(cond, bodyB, orelseB)

        # Write the body of the loop
        self.builder.position_at_end(bodyB)

        # First, evaluate the vars
        # for right now only 1 is supported
        assert len(vars) == 1
        data = self.builder.gep(iter, [zero, one])
        data = self.builder.load(data)
        elem = self.builder.gep(data, [i])
        sym = self.symbols[-1][vars[0]]
        if sym.t.isLoadable():
            elem = self.builder.load(elem)
        self.doStore(sym.ptr, elem, sym.t)

        # Evaluate the body
        # if it's not terminated increment idx and go to the condition
        self.breakBlock.append(afterB)
        for stmt in node.body:
            self.evalNode(stmt, False)
        if not self.isTerminated():
            incr = self.builder.add(i, self.getConstant(1))
            self.builder.store(incr, idx)
            self.builder.branch(condB)
        self.breakBlock.pop()

        # Pop the symbol scope for the for loop
        self.symbols.pop()

        # Do the orelse block
        self.evalBody(node.orelse, orelseB, afterB)

        self.builder.position_at_end(afterB)

    
    def evalWhile(self, node: CheckedIfNode) -> None:
        
        # Create a condition branch
        # Jump to it and evaluate the condition
        # If it's true go to the loop body
        # At thend of the loop body jump back to the condition branch
        cond = self.fn.append_basic_block('cond')
        self.builder.branch(cond)
        self.builder.position_at_end(cond)
        expr = self.evalNode(node.expr, False)

        fortrue = self.fn.append_basic_block('for-true')
        orelse = self.fn.append_basic_block('or-else')
        after = self.fn.append_basic_block('after')
        self.builder.cbranch(expr, fortrue, orelse)

        self.breakBlock.append(after)
        self.evalBody(node.iftrue, fortrue, cond)
        self.breakBlock.pop()

        self.evalBody(node.orelse, orelse, after)
        self.builder.position_at_end(after)

    def getConstant(self, num: int, size=REGISTER_SIZE):
        return ir.Constant(ir.IntType(size), num)

    def doBinOp(self, t: Class, left: ir.Value, right: ir.Value, bop: Any):
        if isinstance(bop, ast.cmpop):
            op = ''
            match bop:
                case ast.Eq() | ast.Is():
                    op = '=='
                case ast.NotEq() | ast.IsNot():
                    op = '!='
                case ast.Lt():
                    op = '<'
                case ast.LtE():
                    op = '<='
                case ast.Gt():
                    op = '>'
                case ast.GtE():
                    op = '>='
                case _:
                    print(bop)
                    assert False
            
            if t.isFloat():
                return self.builder.fcmp_ordered(op, left, right)
            else:
                return self.builder.icmp_signed(op, left, right)

        
        ops = {
            ast.Add: (self.builder.fadd, self.builder.add),
            ast.Sub: (self.builder.fsub, self.builder.sub),
            ast.Mult: (self.builder.fmul, self.builder.mul),
            ast.Div: (self.builder.fdiv, self.builder.sdiv),
            ast.Mod: (self.builder.frem, self.builder.srem)
        }

        got = ops.get(type(bop))
        if got is None:
            print(f'Invalid binary operator {bop}')
            assert False

        fn = got[0 if t.isFloat() else 1]
        result = fn(left, right)
        assert result is not None
        return result

    def evalBinOp(self, node: CheckedBinNode, lhs: bool) -> ir.Value:
        left = self.evalNode(node.left, False)
        right = self.evalNode(node.right, False)
        assert left is not None
        assert right is not None
        assert lhs != True
        
        return self.doBinOp(node.left.t, left, right, node.op)
        

    def evalAssign(self, node: CheckedAssignNode, lhs: bool) -> ir.Value:
        for sym in node.declaredSymbols:
            value = self.builder.alloca(node.t.toLLVM())
            self.symbols[-1][sym] = LLVMSymbol(node.t, value)
        
        ptr = self.evalNode(node.left, True)
        val = self.evalNode(node.right, False)
        assert ptr is not None
        assert val is not None
        self.doStore(ptr, val, node.right.t)
        if lhs:
            return ptr
        return val
    
    def evalAugAssign(self, node: CheckedBinNode, lhs: bool) -> ir.Value:
        assign = self.evalNode(node.left, True)
        left = self.evalNode(node.left, False)
        right = self.evalNode(node.right, False)
        assert assign is not None
        assert left is not None
        assert right is not None
        result = self.doBinOp(node.left.t, left, right, node.op)
        self.doStore(assign, result, node.left.t)
        if lhs:
            return assign
        else:
            return result
    
    def doPrint(self, args: List[CheckedNode], newLine = True) -> ir.Value:
        printString = ''
        for i, arg in enumerate(args):
            if i != 0:
                printString += ' '
            printString += arg.t.getPrintfFormat()

        if newLine:
            printString += '\n'

        toPass = []
        # format
        toPass.append(self.getConstString(printString))
        for arg in args:
            evaled = self.evalNode(arg, False)
            assert evaled is not None
            passed = arg.t.getPrintfArgument(self.builder, evaled)
            toPass.append(passed)
        
        # Probably shouldn't return the value but I don't think it matters
        return self.builder.call(self.symbols[0]['printf'].ptr, toPass, 'print')
        
    def doLen(self, args: list[CheckedNode]) -> ir.Value:
        assert len(args) == 1
        assert isinstance(args[0].t, ListType)
        ptr = self.evalNode(args[0], True)
        zero = self.getConstant(0, 32)
        lenPtr = self.builder.gep(ptr, [zero, zero])
        return self.builder.load(lenPtr)

    def doInput(self, args: list[CheckedNode], strT: Class) -> ir.Value:
        assert len(args) == 1

        zero = self.getConstant(0, 32)
        one = self.getConstant(1, 32)
        promptStr = self.evalNode(args[0], False)
        dataPtr = self.builder.gep(promptStr, [zero, one])
        prompt = self.builder.load(dataPtr)

        readln = self.symbols[0]['readln']
        strPtr = self.builder.call(readln.ptr, [prompt])

        strlen = self.symbols[0]['strlen'].ptr
        length = self.builder.call(strlen, [strPtr])
        return self.makeStringFromPointer(strPtr, length, strT.toLLVM())

    def doRange(self, args: list[CheckedNode], retType: Class) -> ir.Value:
        assert len(args) == 1
        zero = self.getConstant(0, 32)
        one = self.getConstant(1, 32)

        count = self.evalNode(args[0], False)
        elems = self.builder.alloca(intType().toLLVM(), count)
        idx =  self.builder.alloca(intType().toLLVM())
        self.builder.store(self.getConstant(0), idx)

        condB = self.fn.append_basic_block('cond')
        bodyB = self.fn.append_basic_block('range-body')
        afterB = self.fn.append_basic_block('after')
        self.builder.branch(condB)

        self.builder.position_at_end(condB)
        i = self.builder.load(idx)
        cond = self.builder.icmp_signed('<', i, count)
        self.builder.cbranch(cond, bodyB, afterB)

        self.builder.position_at_end(bodyB)
        elem = self.builder.gep(elems, [i])
        self.builder.store(i, elem)
        newI = self.builder.add(i, self.getConstant(1))
        self.builder.store(newI, idx)
        self.builder.branch(condB)

        self.builder.position_at_end(afterB)
        result = self.builder.alloca(retType.toLLVM())
        countPtr = self.builder.gep(result, [zero, zero])
        dataPtr = self.builder.gep(result, [zero, one])
        self.builder.store(count, countPtr)
        self.builder.store(elems, dataPtr)

        return result
    
    def doFloatCast(self, args: list[CheckedNode], retType: Class) -> ir.Value:
        assert len(args) == 1
        val = self.evalNode(args[0], False)

        return self.builder.sitofp(val, retType.toLLVM())
    
    def doIntCast(self, args: list[CheckedNode], retType: Class) -> ir.Value:
        assert len(args) == 1
        val = self.evalNode(args[0], False)
        
        return self.builder.fptosi(val, retType.toLLVM())
        
    
    def evalCall(self, node: CheckedCallNode, lhs: bool) -> ir.Value:
        match node.fnName:
            case 'print':
                return self.doPrint(node.args)
            case 'len':
                return self.doLen(node.args)
            case 'input':
                return self.doInput(node.args, node.fnType.asCallable().returnType)
            case 'range':
                return self.doRange(node.args, node.fnType.asCallable().returnType)
            case 'float':
                return self.doFloatCast(node.args, node.fnType.asCallable().returnType)
            case 'int':
                return self.doIntCast(node.args, node.fnType.asCallable().returnType)

            case None:
                pass

            case _:
                print(f'Unimplemented intrinsic {node.fnName}')
                assert False

            
        operand = self.evalNode(node.operand, True)
        args = []
        for arg in node.args:
            args.append(self.evalNode(arg, False))
        
        return self.builder.call(operand, args)

    def makeStringFromPointer(self, ptr: ir.Value, count: ir.Value | int, llvmT: ir.Type) -> ir.Value:
        zero = self.getConstant(0, 32)
        one = self.getConstant(1, 32)
        strAlloc = self.builder.alloca(llvmT)
        countPtr = self.builder.gep(strAlloc, [zero, zero])
        dataPtr = self.builder.gep(strAlloc,  [zero, one])
        if type(count) is int:
            count = self.getConstant(count)

        self.builder.store(count, countPtr)
        self.builder.store(ptr, dataPtr)
        return strAlloc
    
    def evalConstant(self, node: CheckedNode) -> ir.Value:
        assert isinstance(node.base, ast.Constant)
        base: ast.Constant
        base = node.base
        if node.t.name == 'str':
            assert type(base.value) == str
            llvmT = node.t.toLLVM()
            globalV = self.getConstString(base.value)
            return self.makeStringFromPointer(globalV, len(base.value), llvmT)
        else:
            return ir.Constant(node.t.toLLVM(), base.value)
    
    def evalExpr(self, node: CheckedNode, lhs: bool) -> ir.Value | None:
        assert False
    
    def evalName(self, node: CheckedNode, lhs: bool) -> ir.Value:
        assert isinstance(node.base, ast.Name)
        base: ast.Name
        base = node.base
        ptr = self.findSymbol(base.id).ptr
        if lhs:
            return ptr
        else:
            if node.t.isLoadable():
                return self.builder.load(ptr)
            return ptr
    
    def findSymbol(self, name: str) -> LLVMSymbol:
        for scope in reversed(self.symbols):
            if name in scope:
                return scope[name]
            
        for scope in reversed(self.symbols):
            if self.makeFnName(name) in scope:
                return scope[self.makeFnName(name)]
        
        assert False
