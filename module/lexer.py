import io
import tokenize

def tokenize_code(source_code):
    tokens = []
    source_bytes = io.BytesIO(source_code.encode())
    for token in tokenize.tokenize(source_bytes.readline):
        token_type = tokenize.tok_name[token.type]
        token_value = token.string.strip()
        tokens.append((token_type, token_value))
    return tokens

# Example usage:
if __name__ == "__main__":
    source_code = """
    if x == 10:
        result = x * 2
    """
    tokens = tokenize_code(source_code)
    for token in tokens:
        print(token)
