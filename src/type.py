from __future__ import annotations
from .constants import REGISTER_SIZE
from typing import List
import ast
import llvmlite.ir as ir

sliceTypes: dict[str, ir.Type] = dict()

def noneType() -> Class:
    return Class('<None>')

def boolType() -> Class:
    res = Class('bool')
    res.methods['__init__'] = defaultInit()
    res.parent = objectType()
    return res

def intType() -> Class:
    res = Class('int')
    res.methods['__init__'] = defaultInit()
    res.parent = objectType()
    return res

def objectType() -> Class:
    res = Class('object')
    return res

def defaultInit() -> FnType:
    return FnType(args=[objectType()], returnType=noneType())

class Class():
    """
    Base type class
    """
    name: str
    parent: Class | None

    def __init__(self, name: str):
        self.name = name
        self.methods = {}
        self.parent = None

    def __str__(self):
        return self.name

    def isInt(self) -> bool:
        return self.name == 'int'
    def isFloat(self) -> bool:
        return self.name == 'float'
    
    def getTypeSize(self) -> int:
        match self.name:
            case 'int' | 'float':
                return REGISTER_SIZE // 8
            case 'bool':
                return 1
            case _:
                print(self.name)
                assert False

    def isAssignable(self, other_t: 'Class'):
        """
        Check if the other_t can be assigned to a variable of type self
        """
        # @TODO: better type checking
        if other_t.parent != None:
            if self.isAssignable(other_t.parent):
                return True
        return self.name == other_t.name

    def isCallable(self) -> bool:
        return False

    def asCallable(self) -> 'FnType':
        """
        Returns the type as a function
        """
        assert isinstance(self, FnType)
        return self

    def isList(self) -> bool:
        return False

    def asList(self) -> ListType:
        assert isinstance(self, ListType)
        return self
    
    def isBool(self) -> bool:
        return self.name == 'bool'
    
    def toLLVM(self) -> ir.Type:
        match self.name:
            case 'int':
                return ir.IntType(REGISTER_SIZE)
            case 'float':
                if REGISTER_SIZE == 64:
                    return ir.DoubleType()
                else:
                    return ir.DoubleType()
            case 'char':
                return ir.IntType(8)
            case 'bool':
                return ir.IntType(1)
            case '<None>':
                return ir.VoidType()
            case _:
                print(self.name)
                assert False

    def isIterable(self) -> bool:
        return False

    def getIteratorType(self) -> 'Class':
        return noneType()

    def isLoadable(self) -> bool:
        return True

    def canPerformBinOp(self, other: Class, op) -> bool:
        """
        Basic types can perform every binary operation
        as long as the types are compatible
        """
        _ = op
        return self.isAssignable(other)

    def getPrintfFormat(self) -> str:
        match self.name:
            case 'int':
                return '%d'
            case 'float':
                return '%f'
            case 'str':
                return '%s'
            case 'bool':
                return '%d'
            case 'char':
                return '%c'
        
        print(f'Unknown format for type {self.name}')
        return ''

    def getPrintfArgument(self, builder: ir.IRBuilder, llvmV: ir.Value) -> ir.Value:
        """
        Take the evaluated llvm argument and give it in a proper form for printf.
        Doesn't do anything in base type
        """
        _ = builder
        return llvmV



class FnType(Class):
    def __init__(self, args: List[Class], returnType: Class):
        super().__init__('function')
        self.args = args
        self.returnType = returnType
        self.llvmTypeCached = None

    def __str__(self) -> str:
        string = f'def ('
        for i, arg in enumerate(self.args):
            if i != 0:
                string += ', '
            string += str(arg)

        string += f') -> {self.returnType}'
        return string

    def isCallable(self) -> bool:
        return True

    def toLLVM(self) -> ir.Type:
        if self.llvmTypeCached is not None:
            return self.llvmTypeCached

        args = list[ir.Type]()
        for arg in self.args:
            if not arg.isLoadable():
                args.append(ir.PointerType(arg.toLLVM()))
            else:
                args.append(arg.toLLVM())

        self.llvmTypeCached = ir.FunctionType(self.returnType.toLLVM(), args)
        return self.llvmTypeCached

    def getTypeSize(self) -> int:
        return REGISTER_SIZE//8

    def isLoadable(self) -> bool:
        return False


class ListType(Class):
    def __init__(self, name: str | None, base: Class):
        self.base = base
        if name is None:
            self.name = ""
            name = self.__str__()
        super().__init__(name)

    def __str__(self) -> str:
        if self.name == 'str':
            return 'str'

        base = self.base.__str__()
        return f'list[{base}]'

    def toLLVM(self):
        got = sliceTypes.get(self.name)
        if got is not None:
            return got
        base_t = self.base.toLLVM()
        t = ir.global_context.get_identified_type(self.name)
        t.set_body(ir.IntType(REGISTER_SIZE), ir.PointerType(base_t))
        sliceTypes[self.name] = t
        return t

    def isAssignable(self, other_t: Class):
        if not other_t.isList():
            return False
        return self.base.isAssignable(other_t.asList().base)

    def isIterable(self) -> bool:
        return True

    def getIteratorType(self) -> Class:
        return self.base

    def isList(self) -> bool:
        return True

    def isLoadable(self) -> bool:
        return False

    def getTypeSize(self) -> int:
        return REGISTER_SIZE // 4

    def getPrintfArgument(self, builder: ir.IRBuilder, llvmV: ir.Value) -> ir.Value:
        zero = ir.Constant(ir.IntType(32), 0)
        one =  ir.Constant(ir.IntType(32), 1)
        return builder.load(builder.gep(llvmV, [zero, one]))

    def canPerformBinOp(self, other: Class, op) -> bool:
        _ = other
        match op:
            case ast.Eq() | ast.NotEq():
                return self.isAssignable(other)
        return False

