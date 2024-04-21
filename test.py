import ast
import graphviz

class ASTDAGGenerator:
    def __init__(self):
        self.ast_graph = graphviz.Digraph()
        self.dag_graph = graphviz.Digraph()
        self.node_count = 0

    def generate_ast_dag(self, code):
        tree = ast.parse(code)
        self.generate_ast_graph(tree)
        self.generate_dag_graph(tree)

    def generate_ast_graph(self, tree, parent=None):
        method_name = 'visit_' + tree.__class__.__name__
        visitor = getattr(self, method_name, self.generic_visit)
        return visitor(tree, parent)

    def generic_visit(self, node, parent):
        node_name = f"Node_{self.node_count}"
        self.ast_graph.node(node_name, label=node.__class__.__name__)
        if parent is not None:
            self.ast_graph.edge(parent, node_name)
        self.node_count += 1
        for field, value in ast.iter_fields(node):
            if isinstance(value, list):
                for item in value:
                    if isinstance(item, ast.AST):
                        self.generate_ast_graph(item, parent=node_name)
            elif isinstance(value, ast.AST):
                self.generate_ast_graph(value, parent=node_name)

    def visit_Name(self, node, parent):
        node_name = f"Node_{self.node_count}"
        self.ast_graph.node(node_name, label=f"Name: {node.id}")
        self.ast_graph.edge(parent, node_name)
        self.node_count += 1

    def visit_Constant(self, node, parent):
        node_name = f"Node_{self.node_count}"
        self.ast_graph.node(node_name, label=f"Constant: {node.value}")
        self.ast_graph.edge(parent, node_name)
        self.node_count += 1

    def visit_Str(self, node, parent):
        node_name = f"Node_{self.node_count}"
        self.ast_graph.node(node_name, label=f"String: {node.s}")
        self.ast_graph.edge(parent, node_name)
        self.node_count += 1

    def visit_FunctionDef(self, node, parent):
        node_name = f"Node_{self.node_count}"
        self.ast_graph.node(node_name, label=f"FunctionDef: {node.name}")
        self.ast_graph.edge(parent, node_name)
        self.node_count += 1
        self.generic_visit(node, parent=node_name)

    def visit_Assign(self, node, parent):
        node_name = f"Node_{self.node_count}"
        self.ast_graph.node(node_name, label="Assign")
        self.ast_graph.edge(parent, node_name)
        self.node_count += 1
        for target in node.targets:
            self.generate_ast_graph(target, parent=node_name)
        self.generate_ast_graph(node.value, parent=node_name)

    def generate_dag_graph(self, tree):
        dag_builder = DAGBuilder()
        self.dag_graph = dag_builder.build_dag(tree)

    def visualize_ast_dag(self):
        self.ast_graph.render('ast_graph', format='png', cleanup=True)
        self.dag_graph.render('dag_graph', format='png', cleanup=True)

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
input_code = '''
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
'''

generator = ASTDAGGenerator()
generator.generate_ast_dag(input_code)
generator.visualize_ast_dag()
