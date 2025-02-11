#include <stdarg.h>
#include <stdio.h>


//int vscanf( const char *restrict format, va_list vlist );

// 
// I am working on this on Windows and this function that's needed for the compiler
// is not exported by the standard library so i am defining it myself for now
//

int _scanf(const char *fmt, ...) {
	va_list list;
	va_start(list, fmt);
	int result = vscanf(fmt, list);
	va_end(list);
	return result;
}

