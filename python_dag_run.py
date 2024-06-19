import ast
import graphviz

class DAGBuilder(ast.NodeVisitor):
    def __init__(self):
        self.graph = graphviz.Digraph()
        self.visited = set()
        self.expr_map = {}  # For common subexpression elimination

    def build_dag(self, tree):
        self.visit(tree)
        return self.graph

    def visit(self, node):
        if node in self.visited:
            return
        self.visited.add(node)

        parent_name = f"Node_{id(node)}"
        label = self.get_node_label(node)
        self.graph.node(parent_name, label=label)

        for child_name, child_node in ast.iter_fields(node):
            if isinstance(child_node, list):
                for i, child in enumerate(child_node):
                    if isinstance(child, ast.AST):
                        child_name = f"Node_{id(child)}"
                        self.graph.node(child_name, label=self.get_node_label(child))
                        self.graph.edge(parent_name, child_name)
                        self.visit(child)
            elif isinstance(child_node, ast.AST):
                child_name = f"Node_{id(child_node)}"
                self.graph.node(child_name, label=self.get_node_label(child_node))
                self.graph.edge(parent_name, child_name)
                self.visit(child_node)

        self.optimize_constant_folding(node, parent_name)
        self.optimize_common_subexpression(node, parent_name)

    def get_node_label(self, node):
        if isinstance(node, (ast.Assign, ast.AnnAssign)):
            return node.__class__.__name__
        elif isinstance(node, ast.Name):
            return f"Type: {node.__class__.__name__}\nName: {node.id}"
        elif isinstance(node, ast.Constant):
            return f"Type: {node.__class__.__name__}\nValue: {node.value}"
        elif isinstance(node, ast.Str):
            return f"Type: {node.__class__.__name__}\nValue: {node.s}"
        elif isinstance(node, ast.Attribute):
            return f"Type: {node.__class__.__name__}\nAttribute: {node.attr}\nValue: {node.value.id}"
        elif isinstance(node, ast.BinOp):
            return f"Type: {node.__class__.__name__}\nOp: {type(node.op).__name__}"
        else:
            return node.__class__.__name__

    def optimize_constant_folding(self, node, parent_name):
        if isinstance(node, ast.BinOp):
            if isinstance(node.left, ast.Constant) and isinstance(node.right, ast.Constant):
                left_val = node.left.value
                right_val = node.right.value
                if isinstance(node.op, ast.Add):
                    folded_value = left_val + right_val
                elif isinstance(node.op, ast.Sub):
                    folded_value = left_val - right_val
                elif isinstance(node.op, ast.Mult):
                    folded_value = left_val * right_val
                else:
                    return
                # Replace node with constant value
                new_node = ast.Constant(value=folded_value)
                new_node_name = f"Node_{id(new_node)}"
                self.graph.node(new_node_name, label=self.get_node_label(new_node))
                self.graph.edge(parent_name, new_node_name)

    def optimize_common_subexpression(self, node, parent_name):
        if isinstance(node, ast.BinOp):
            left = self.get_node_label(node.left)
            right = self.get_node_label(node.right)
            op = type(node.op).__name__
            expr = (left, op, right)
            if expr in self.expr_map:
                existing_node = self.expr_map[expr]
                self.graph.edge(parent_name, existing_node)
            else:
                self.expr_map[expr] = parent_name

# Example usage:
input_code = '''
def bubbleSort(arr):
    n = len(arr)
    for i in range(n):
        for j in range(0, n - i - 1):
            if arr[j] > arr[j + 1]:
                arr[j], arr[j + 1] = arr[j + 1], arr[j]

arr = [2, 1, 10, 23]
bubbleSort(arr)
print("Sorted array is:")
for i in range(len(arr)):
    print("%d" % arr[i])
'''

input_ast = ast.parse(input_code)

# Build DAG
dag_builder = DAGBuilder()
dag_graph = dag_builder.build_dag(input_ast)
ast_tree = ast.dump(input_ast)
print(ast_tree)
print(dag_graph)

# Render and display DAG
dag_graph.render('dag_graph', format='png', cleanup=True)
