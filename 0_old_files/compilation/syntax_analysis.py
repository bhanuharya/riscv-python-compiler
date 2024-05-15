import ast
import graphviz

class ASTNodeVisitor(ast.NodeVisitor):
    def __init__(self):
        self.graph = graphviz.Digraph()
        self.node_count = 0
    
    def visit(self, node, parent=None):
        method_name = 'visit_' + node.__class__.__name__
        visitor = getattr(self, method_name, self.generic_visit)
        return visitor(node, parent)
    
    def generic_visit(self, node, parent):
        node_name = f"Node_{self.node_count}"
        self.graph.node(node_name, label=node.__class__.__name__)
        if parent is not None:
            self.graph.edge(parent, node_name)
        self.node_count += 1
        for field, value in ast.iter_fields(node):
            if isinstance(value, list):
                for item in value:
                    if isinstance(item, ast.AST):
                        self.visit(item, parent=node_name)
            elif isinstance(value, ast.AST):
                self.visit(value, parent=node_name)
                
    def visit_Name(self, node, parent):
        node_name = f"Node_{self.node_count}"
        self.graph.node(node_name, label=f"Name: {node.id}")
        self.graph.edge(parent, node_name)
        self.node_count += 1

    def visit_Constant(self, node, parent):
        node_name = f"Node_{self.node_count}"
        self.graph.node(node_name, label=f"Constant: {node.value}")
        self.graph.edge(parent, node_name)
        self.node_count += 1

    def visit_Str(self, node, parent):
        node_name = f"Node_{self.node_count}"
        self.graph.node(node_name, label=f"String: {node.s}")
        self.graph.edge(parent, node_name)
        self.node_count += 1

    def visit_FunctionDef(self, node, parent):
        node_name = f"Node_{self.node_count}"
        self.graph.node(node_name, label=f"FunctionDef: {node.name}")
        self.graph.edge(parent, node_name)
        self.node_count += 1
        self.generic_visit(node, parent=node_name)

    def visit_Assign(self, node, parent):
        node_name = f"Node_{self.node_count}"
        self.graph.node(node_name, label="Assign")
        self.graph.edge(parent, node_name)
        self.node_count += 1
        for target in node.targets:
            self.visit(target, parent=node_name)
        self.visit(node.value, parent=node_name)

def generate_ast(code):
    tree = ast.parse(code)
    print(tree.body)
    visitor = ASTNodeVisitor()
    visitor.visit(tree)
    return visitor.graph

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

ast_graph = generate_ast(input_code)
print(ast_graph)
ast_graph.render('ast_graph', format='png', cleanup=True)
