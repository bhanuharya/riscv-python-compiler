import ast
import subprocess
import os

class DAGNode:
    def __init__(self, op, left=None, right=None):
        self.op = op
        self.left = left
        self.right = right

    def __eq__(self, other):
        if isinstance(other, DAGNode):
            return self.op == other.op and self.left == other.left and self.right == other.right
        return False

    def __hash__(self):
        return hash((self.op, self.left, self.right))

class DAG:
    def __init__(self):
        self.nodes = []
        self.hash_table = {}

    def _hash(self, node):
        return hash(node)

    def get_value_number(self, op, left=None, right=None):
        node = DAGNode(op, left, right)
        h = self._hash(node)
        if h in self.hash_table:
            for existing_node in self.hash_table[h]:
                if existing_node == node:
                    return self.nodes.index(existing_node)
        
        # If the node is not found, create a new node
        self.nodes.append(node)
        if h not in self.hash_table:
            self.hash_table[h] = []
        self.hash_table[h].append(node)
        return len(self.nodes) - 1

    def add_leaf(self, op, value):
        node = DAGNode(op, value)
        return self.get_value_number(op, value)

    def add_interior(self, op, left_value_number, right_value_number):
        return self.get_value_number(op, left_value_number, right_value_number)

    def __str__(self):
        result = []
        for idx, node in enumerate(self.nodes):
            if node.right is not None:
                result.append(f"{idx}: {node.op} ({node.left}, {node.right})")
            else:
                result.append(f"{idx}: {node.op} ({node.left})")
        return "\n".join(result)

    def to_dot(self):
        dot = ["digraph G {"]
        for idx, node in enumerate(self.nodes):
            if node.right is not None:
                dot.append(f'{idx} [label="{node.op}"];')
                dot.append(f'{node.left} -> {idx};')
                dot.append(f'{node.right} -> {idx};')
            else:
                dot.append(f'{idx} [label="{node.op}({node.left})"];')
        dot.append("}")
        return "\n".join(dot)

    def visualize(self, output_file):
        dot_content = self.to_dot()
        with open(output_file, "w") as f:
            f.write(dot_content)
        subprocess.run(["dot", "-Tpng", output_file, "-o", output_file.replace(".dot", ".png")])
        os.remove(output_file)  # Remove the .dot file if not needed

class ASTToDAGConverter(ast.NodeVisitor):
    def __init__(self, dag):
        self.dag = dag

    def visit_Constant(self, node):
        return self.dag.add_leaf('CONST', node.value)

    def visit_Name(self, node):
        return self.dag.add_leaf('VAR', node.id)

    def visit_BinOp(self, node):
        left = self.visit(node.left)
        right = self.visit(node.right)
        return self.dag.add_interior(type(node.op).__name__, left, right)

    def visit_Assign(self, node):
        assert len(node.targets) == 1  # Simplification: only handle single target
        target = self.visit(node.targets[0])
        value = self.visit(node.value)
        return self.dag.add_interior('ASSIGN', target, value)

    def visit_FunctionDef(self, node):
        body_nodes = []
        for stmt in node.body:
            body_nodes.append(self.visit(stmt))
        # Here we assume function body is a sequence of statements resulting in a single DAG
        if body_nodes:
            return body_nodes[-1]  # Return the last node as the representative of the function
        return None

    def visit_Return(self, node):
        return self.visit(node.value)

def main():
    code = """
def add(a, b):
    return a + b

result = add(1, 2)
"""
    tree = ast.parse(code)

    dag = DAG()
    converter = ASTToDAGConverter(dag)
    converter.visit(tree)

    print(dag)
    
    # Visualize the DAG
    dag.visualize("dag.dot")

if __name__ == "__main__":
    main()
