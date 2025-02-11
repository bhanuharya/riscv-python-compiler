import ast
from re import sub
from typing import List, Literal, Any
from .type import *

"""
This file contains definitions for type-checked nodes
After going through all of Python's parsed nodes we assign them types
and construct a type-checked syntax tree for code generation
"""

class CheckedNode():
    """
    The base class that all nodes inherit from
    """
    base: ast.AST
    t: Class
    def __init__(self, base: ast.AST, type: Class):
        self.base = base
        self.t = type

class CheckedModuleNode(CheckedNode):
    """
    The top level node of each file
    """
    statements: List[CheckedNode]
    def __init__(self, base: ast.AST, statements: List[CheckedNode]):
        self.statements = statements
        super().__init__(base, noneType())
    

class CheckedBinNode(CheckedNode):
    """
    A binary operation

    3 * a
    """
    left: CheckedNode
    right: CheckedNode
    op: Any
    def __init__(self, base: ast.AST, left: CheckedNode, right: CheckedNode, op: Any):
        self.left = left
        self.right = right
        self.op = op
        super().__init__(base, left.t)

class CheckedCallNode(CheckedNode):
    """
    A function call

    x(param1, param2)
    """
    operand: CheckedNode
    fnName: str | None
    args: List[CheckedNode]
    fnType: Class
    def __init__(self, base: ast.AST, operand: CheckedNode, args: List[CheckedNode], fnType: Class, fnName: str | None):
        self.operand = operand
        self.args = args
        self.fnType = fnType
        self.fnName = fnName
        super().__init__(base, fnType.asCallable().returnType)

class CheckedAssignNode(CheckedNode):
    """
    Either an assignment or a declaration of a variable
    Python doesn't differentiate between those

    x = 10
    """
    declaredSymbols: list[str]
    left: CheckedNode
    right: CheckedNode
    def __init__(self, base: ast.AST, left: CheckedNode, right: CheckedNode, declaredSymbols: list[str]):
        self.declaredSymbols = declaredSymbols
        self.left = left
        self.right = right
        super().__init__(base, left.t)

class CheckedFnDefNode(CheckedNode):
    """
    A function definition

    def foo():
    """
    statements: list[CheckedNode]
    args: list[tuple[str, Class]]
    def __init__(self, base: ast.AST, args: list[tuple[str, Class]], statements: list[CheckedNode], fnType: Class):
        self.statements = statements
        self.args = args
        super().__init__(base, fnType)

class CheckedReturnNode(CheckedNode):
    """
    A return statement

    return x
    """
    expr: CheckedNode | None
    def __init__(self, base: ast.AST, expr: CheckedNode | None):
        self.expr = expr
        super().__init__(base, expr.t if expr is not None else noneType())


class CheckedIfNode(CheckedNode):
    """
    An if/if else statement

    if x:
        foo()
    else y:
        bar()
    """
    expr: CheckedNode
    iftrue: list[CheckedNode]
    orelse: list[CheckedNode]
    def __init__(self, base: ast.AST, expr: CheckedNode, iftrue: list[CheckedNode], orelse: list[CheckedNode]):
        self.expr = expr
        self.iftrue = iftrue
        self.orelse = orelse
        #@TODO: ternary operators
        super().__init__(base, noneType())


class CheckedForNode(CheckedNode):
    """
    A for in loop

    for x in y_list:
        foo(x)
    """
    vars: list[tuple[str, Class]]
    iter: CheckedNode
    body: list[CheckedNode]
    orelse: list[CheckedNode]
    def __init__(self, base: ast.AST, vars: list[tuple[str, Class]], iter: CheckedNode, body, orelse):
        self.vars = vars
        self.iter = iter
        self.body = body
        self.orelse = orelse
        super().__init__(base, noneType())


class CheckedBoolOpNode(CheckedNode):
    """
    Either 'and' or 'or' expression
    
    if x and y:
        foo()
    """
    vals: list[CheckedNode]
    op: Literal['and', 'or']
    def __init__(self, base: ast.AST, vals: list[CheckedNode], op: Literal['and', 'or']):
        self.vals = vals
        self.op = op
        super().__init__(base, boolType())

class CheckedListNode(CheckedNode):
    """
    A constant list literal

    [1, 2, 3, 4]
    """
    vals: list[CheckedNode]
    def __init__(self, base: ast.AST, t: Class, vals: list[CheckedNode]):
        self.vals = vals
        super().__init__(base, ListType(None, t))

class CheckedSubscriptNode(CheckedNode):
    """
    Indexing a list expression

    a[10]
    """
    op: CheckedNode
    subscript: CheckedNode
    def __init__(self, base: ast.AST, op: CheckedNode, subscript: CheckedNode):
        self.op = op
        self.subscript = subscript
        listT = op.t.asList()
        super().__init__(base, listT.base)


