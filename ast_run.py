import ast

class ASTVisualizer(ast.NodeVisitor):
    def __init__(self):
        self.dot = ["digraph G {"]
        self.node_counter = 0

    def _get_node_id(self):
        self.node_counter += 1
        return f"node{self.node_counter}"

    def visit(self, node):
        node_id = self._get_node_id()
        label = type(node).__name__
        if isinstance(node, ast.Constant):
            label += f"\\n{node.value}"
        elif isinstance(node, ast.Name):
            label += f"\\n{node.id}"
        elif isinstance(node, ast.FunctionDef):
            label += f"\\n{node.name}"

        self.dot.append(f'{node_id} [label="{label}"];')

        for child in ast.iter_child_nodes(node):
            child_id = self.visit(child)
            self.dot.append(f"{node_id} -> {child_id};")

        return node_id

    def visualize(self, tree, output_file):
        self.visit(tree)
        self.dot.append("}")
        with open(output_file, "w") as f:
            f.write("\n".join(self.dot))

# Parse the code into an AST
code = """
def sum(x, y):
    return x + y

sum(1,2)
"""
tree = ast.parse(code)

# Visualize the AST and save it to a DOT file
visualizer = ASTVisualizer()
visualizer.visualize(tree, "ast.dot")

# Convert the DOT file to a PNG image
import subprocess
subprocess.run(["dot", "-Tpng", "ast.dot", "-o", "ast_graph.png"])
