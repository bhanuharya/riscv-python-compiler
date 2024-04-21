import re
from graphviz import Digraph

# Lexer
class Lexer:
    def __init__(self, code):
        self.code = code
        self.tokens = []
        self.current_pos = 0

    def tokenize(self):
        while self.current_pos < len(self.code):
            match = self.match_token()
            if match:
                self.tokens.append(match)
            else:
                self.current_pos += 1

    def match_token(self):
        for pattern, token_type in token_patterns.items():
            regex = re.compile(pattern)
            match = regex.match(self.code, self.current_pos)
            if match:
                value = match.group(0)
                self.current_pos = match.end()
                if token_type != "IGNORE":
                    return Token(token_type, value)
                else:
                    return None
        return None

# Token class
class Token:
    def __init__(self, token_type, value):
        self.type = token_type
        self.value = value

# Syntax Analyzer
class SyntaxAnalyzer:
    def __init__(self, tokens):
        self.tokens = tokens
        self.current_token = None
        self.current_pos = 0

    def eat(self, token_type):
        if self.current_token.type == token_type:
            self.current_pos += 1
            if self.current_pos < len(self.tokens):
                self.current_token = self.tokens[self.current_pos]
            return True
        return False

    def expr(self):
        # Implement parsing logic for expressions
        pass

# Semantic Analyzer
class SemanticAnalyzer:
    def __init__(self, ast):
        self.ast = ast

    def analyze(self):
        # Implement semantic analysis logic
        pass

# AST Node
class ASTNode:
    def __init__(self, type, value=None):
        self.type = type
        self.value = value
        self.children = []

    def add_child(self, child):
        self.children.append(child)

# AST Generator
class ASTGenerator:
    def __init__(self, code):
        self.lexer = Lexer(code)
        self.parser = SyntaxAnalyzer([])
        self.semantic_analyzer = SemanticAnalyzer(None)

    def generate_ast(self):
        self.lexer.tokenize()
        self.parser.tokens = self.lexer.tokens
        self.parser.current_token = self.lexer.tokens[0]
        ast_root = self.parser.expr()  # Start parsing from the root expression
        self.semantic_analyzer.ast = ast_root
        self.semantic_analyzer.analyze()
        return ast_root

# Token patterns
token_patterns = {
    r'\bint\b|\bshort\b|\bdouble\b|\bfloat\b|\bchar\b|\bvoid\b|\bfor\b|\bwhile\b|\bif\b|\belse\b|\bdo\b|\breturn\b|\bbreak\b': "KEYWORD",
    r'==|!=|&&|\|\||>=|<=|\+\+|--|\+=|-=|\*=|/=|[\+\-\*\/\=\&\|\>\<\(\)\[\]\{\}\,\;\"]': "OPERATOR",
    r'[a-zA-Z_][a-zA-Z0-9_]*': "IDENTIFIER",
    r'\d+': "NUMBER",
    r'\"([^\\\"]|\\.)*\"': "STRING_LITERAL",
    r'\s+': "IGNORE"
}

# Main function
def main():
    code = '''\
int main() {
    int a = 10;
    int b = 20;
    int sum = a + b;
    return sum;
}
'''
    ast_generator = ASTGenerator(code)
    ast_root = ast_generator.generate_ast()
    visualize_ast(ast_root)

# Function to visualize AST
def visualize_ast(node):
    dot = Digraph()

    def traverse(node):
        dot.node(str(id(node)), f"{node.type}{'=' + node.value if node.value else ''}")
        for child in node.children:
            child_id = traverse(child)
            dot.edge(str(id(node)), str(child_id))
        return id(node)

    traverse(node)
    dot.render('ast', format='png', cleanup=True)

if __name__ == "__main__":
    main()
