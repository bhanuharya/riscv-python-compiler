import ast
import io
import tokenize

def tokenize_code(source_code):
    tokens = []
    source_bytes = io.BytesIO(source_code.encode())
    for token in tokenize.tokenize(source_bytes.readline):
        tokens.append((tokenize.tok_name[token.type], token.string.strip()))
    return tokens

def parse_tokens(tokens):
    source_code = ''.join(token[1] for token in tokens)
    return ast.parse(source_code)


source_code = """
x = 10
if x == 10:
    result = x * 2
else:
    result = x
"""

# Example usage:
if __name__ == "__main__":
    
    tokens = tokenize_code(source_code)
    print("Tokens:", tokens)
    ast_tree = parse_tokens(tokens)
    print("AST:", ast.dump(ast_tree))
