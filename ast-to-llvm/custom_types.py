class ASTNode:
    pass

class FunctionDefNode(ASTNode):
    def __init__(self, name, args, body):
        self.name = name
        self.args = args
        self.body = body

class ForNode(ASTNode):
    def __init__(self, target, iter, body):
        self.target = target
        self.iter = iter
        self.body = body

class IfNode(ASTNode):
    def __init__(self, test, body, orelse):
        self.test = test
        self.body = body
        self.orelse = orelse

class AssignNode(ASTNode):
    def __init__(self, targets, value):
        self.targets = targets
        self.value = value

class ReturnNode(ASTNode):
    def __init__(self, value):
        self.value = value

class BinOpNode(ASTNode):
    def __init__(self, left, op, right):
        self.left = left
        self.op = op
        self.right = right

class CallNode(ASTNode):
    def __init__(self, func, args, keywords):
        self.func = func
        self.args = args
        self.keywords = keywords

class NameNode(ASTNode):
    def __init__(self, id, ctx):
        self.id = id
        self.ctx = ctx

class ConstantNode(ASTNode):
    def __init__(self, value):
        self.value = value

class ListNode(ASTNode):
    def __init__(self, elts):
        self.elts = elts

class CompareNode(ASTNode):
    def __init__(self, left, ops, comparators):
        self.left = left
        self.ops = ops
        self.comparators = comparators

class SubscriptNode(ASTNode):
    def __init__(self, value, slice, ctx):
        self.value = value
        self.slice = slice
        self.ctx = ctx

class TupleNode(ASTNode):
    def __init__(self, elts, ctx):
        self.elts = elts
        self.ctx = ctx
