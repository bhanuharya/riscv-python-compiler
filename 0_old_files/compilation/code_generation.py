class RISCVCodeGenerator:
    def __init__(self):
        self.code = []

    def generate_code(self, dag):
        for node, neighbors in dag.items():
            for neighbor in neighbors:
                # Translate assignment operation
                if node.startswith("Assign") and neighbor.startswith("Name"):
                    variable_name = neighbor.split(":")[1].strip()
                    value = self.get_value(dag, node)
                    self.code.append(f"li $t0, {value}")
                    self.code.append(f"sw $t0, {variable_name}")
                # Translate addition operation
                elif node.startswith("Add") and neighbor.startswith("Name"):
                    variable_name = neighbor.split(":")[1].strip()
                    left_value = self.get_value(dag, node.split(",")[1])
                    right_value = self.get_value(dag, node.split(",")[2])
                    self.code.append(f"lw $t0, {left_value}")
                    self.code.append(f"lw $t1, {right_value}")
                    self.code.append(f"add $t2, $t0, $t1")
                    self.code.append(f"sw $t2, {variable_name}")

    def get_value(self, dag, node):
        # Extract value from node label
        return node.split(":")[1].strip()

# Example usage:
dag = {
    'Assign': ['Name: arr'],
    'Add, Constant: 2, Constant: 3': ['Name: result'],
    'Constant: 2': [],
    'Constant: 3': []
}

generator = RISCVCodeGenerator()
generator.generate_code(dag)

print("Generated RISC-V Assembly Code:")
for line in generator.code:
    print(line)
