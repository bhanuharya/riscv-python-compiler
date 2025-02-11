import argparse
from src.compiler import Compiler
import src.constants as constants


def main():
    """
    Parse the commandline arguments and create the Compiler

    Currently the only commandline argument is the single python file to compile
    """
    parser = argparse.ArgumentParser(prog='PythonRISCV')
    parser.add_argument('filein')
    parser.add_argument('--bits', '-b', type=int, default=32)
    args = parser.parse_args()

    # print(args.filein)

    constants.REGISTER_SIZE = args.bits
    compiler = Compiler(args.filein)

    
    try:
        with open(args.filein) as f:
            if not compiler.parseFile(f, args.filein):
                return
        
        compiler.typeCheck()
        compiler.compileToLLVM()
    except FileNotFoundError:
        print(f'File not found: {args.filein}')
    except PermissionError:
        print(f'Could not open file: {args.filein}')



if __name__ == '__main__':
    main()
