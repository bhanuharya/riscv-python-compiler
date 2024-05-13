import ast
source_code = """
x = 10
if x == 10:
    result = x * 2
else:
    result = x
"""
# Example usage:
if __name__ == "__main__":
    
    ast_tree = ast.parse(source_code)
    print(ast.dump(ast_tree))
