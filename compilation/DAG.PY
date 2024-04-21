import ast
import graphviz

class DAGBuilder(ast.NodeVisitor):
    def __init__(self):
        self.graph = graphviz.Digraph()
        self.visited = set()

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
                    child_name = f"Node_{id(child)}"
                    self.graph.node(child_name, label=self.get_node_label(child))
                    self.graph.edge(parent_name, child_name)
                    self.visit(child)
            elif isinstance(child_node, ast.AST):
                child_name = f"Node_{id(child_node)}"
                self.graph.node(child_name, label=self.get_node_label(child_node))
                self.graph.edge(parent_name, child_name)
                self.visit(child_node)

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
        else:
            return node.__class__.__name__

# Example usage:
input_ast = ast.parse('''
def bubbleSort(arr):
     
    n = len(arr)
 
    # For loop to traverse through all 
    # element in an array
    for i in range(n):
        for j in range(0, n - i - 1):
             
            # Range of the array is from 0 to n-i-1
            # Swap the elements if the element found 
            #is greater than the adjacent element
            if arr[j] > arr[j + 1]:
                arr[j], arr[j + 1] = arr[j + 1], arr[j]
                 
# Driver code
 
# Example to test the above code
arr = [ 2, 1, 10, 23 ]
 
bubbleSort(arr)
 
print("Sorted array is:")
for i in range(len(arr)):
    print("%d" % arr[i])
''')

# Build DAG
dag_builder = DAGBuilder()
dag_graph = dag_builder.build_dag(input_ast)

# Render and display DAG
dag_graph.render('dag_graph', format='png', cleanup=True)
