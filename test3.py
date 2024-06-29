import ast
import networkx as nx
import matplotlib.pyplot as plt

source_code = """
def compute(a, b):
    return (a + b) * (a - b)
"""

# Parse the source code into an AST
tree = ast.parse(source_code)

# Function to convert AST to DAG
def ast_to_dag(node, graph, parent=None):
    if isinstance(node, ast.Module):
        for body_item in node.body:
            ast_to_dag(body_item, graph)
    
    elif isinstance(node, ast.FunctionDef):
        for stmt in node.body:
            ast_to_dag(stmt, graph)
    
    elif isinstance(node, ast.Return):
        ast_to_dag(node.value, graph, parent)
    
    elif isinstance(node, ast.BinOp):
        left_node = ast_to_dag(node.left, graph)
        right_node = ast_to_dag(node.right, graph)
        op_node = ast_to_dag(node.op, graph)
        op_name = f"{left_node} {op_node} {right_node}"
        graph.add_node(op_name)
        graph.add_edge(left_node, op_name)
        graph.add_edge(right_node, op_name)
        return op_name
    
    elif isinstance(node, ast.Add):
        return '+'
    
    elif isinstance(node, ast.Sub):
        return '-'
    
    elif isinstance(node, ast.Mult):
        return '*'
    
    elif isinstance(node, ast.Name):
        return node.id
    
    elif isinstance(node, ast.Constant):
        return str(node.value)
    
    else:
        raise ValueError(f"Unsupported AST node type: {type(node)}")

# Create an empty graph
dag = nx.DiGraph()

# Convert AST to DAG
ast_to_dag(tree, dag)

# Draw the DAG
pos = nx.spring_layout(dag)
nx.draw(dag, pos, with_labels=True, node_size=3000, node_color="lightblue", font_size=10, font_weight="bold", arrows=True)
plt.show()
