"""
Compiler diagnostic infrastructure.

The ErrorInfo class contains the current location in a file.
When an error occurs it is passed to raiseError, which raises a
CompileError carrying the location and message.
"""


class CompileError(Exception):
    """
    A compile-time error (syntax, type-checking or lowering error).

    The message is fully formatted for the user, including file name
    and line number when available.
    """

    def __init__(self, message: str):
        super().__init__(message)
        self.message = message


class ErrorInfo():
    def __init__(self, lineNo: int, fileName: str):
        self.lineNo = lineNo
        self.fileName = fileName


def raiseError(info: ErrorInfo, msg: str):
    """
    Raise a CompileError with the source location attached.

    Callers that want the old "print and exit" behavior should catch
    CompileError, print it and exit with a non-zero status.
    """
    raise CompileError(f'Error in file {info.fileName} at line {info.lineNo}:\n{msg}')
