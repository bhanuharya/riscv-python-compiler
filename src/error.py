
"""
The ErrorInfo class contains the current location in a file
when an error occurs it is passed to the raiseError function to signal to the user
"""
class ErrorInfo():
    def __init__(self, lineNo: int, fileName: str):
        self.lineNo = lineNo
        self.fileName = fileName


"""
Print an error message, its location and exit the program.
"""
def raiseError(info: ErrorInfo, msg: str):
    print(f'Error in file {info.fileName} at line {info.lineNo}:\n{msg}')
    exit(1)
