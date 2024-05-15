from llvmlite import binding as llvm
from llvmlite import ir

# Initialize LLVM
llvm.initialize()
llvm.initialize_native_target()
llvm.initialize_native_asmprinter()

# Load the module
with open('../llvm_ir/bubble_sort.ll', 'r') as f:
    module = llvm.parse_assembly(f.read())
module.verify()

# Custom optimization pass using a DAG
def dag_based_optimizations(module):
    for function in module.functions:
        for block in function.blocks:
            dag = {}
            for instruction in block.instructions:
                if instruction.opcode in ['add', 'sub', 'mul']:
                    operands = list(instruction.operands)
                    if tuple(operands) in dag:
                        instruction.replace_all_uses_with(dag[tuple(operands)])
                        instruction.erase_from_parent()
                    else:
                        dag[tuple(operands)] = instruction

# Apply the DAG-based optimizations
dag_based_optimizations(module)

# Standard LLVM optimizations
pass_manager = llvm.create_module_pass_manager()
pass_manager.add_constant_merge_pass()
pass_manager.add_dead_arg_elimination_pass()
pass_manager.add_function_inlining_pass(threshold=1000)  # Add a threshold argument
pass_manager.add_gvn_pass()
pass_manager.add_cfg_simplification_pass()
pass_manager.add_licm_pass()
pass_manager.add_sccp_pass()

# Run the optimization passes
pass_manager.run(module)

# Write the optimized LLVM IR to a file
with open('../llvm_ir/bubble_sort_opt.ll', 'w') as f:
    f.write(str(module))

# print(module)
