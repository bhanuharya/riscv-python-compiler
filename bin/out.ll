; ModuleID = '<string>'
source_filename = "<string>"
target triple = "x86_64-pc-windows-msvc"

%str = type { i64, i8* }

@"0" = internal constant [3 x i8] c"%s\00"
@"1" = internal constant [8 x i8] c"Input: \00"
@"2" = internal constant [3 x i8] c"%s\00"
@"3" = internal constant [4 x i8] c"%s\0A\00"

define void @main() {
entry:
  %.2 = alloca %str, align 8
  %.3 = getelementptr [3 x i8], [3 x i8]* @"0", i32 0, i32 0
  %.4 = getelementptr [8 x i8], [8 x i8]* @"1", i32 0, i32 0
  %.5 = alloca %str, align 8
  %.6 = getelementptr %str, %str* %.5, i32 0, i32 0
  %.7 = getelementptr %str, %str* %.5, i32 0, i32 1
  store i64 7, i64* %.6, align 4
  store i8* %.4, i8** %.7, align 8
  %.10 = getelementptr %str, %str* %.5, i32 0, i32 1
  %.11 = load i8*, i8** %.10, align 8
  %print = call i64 (i8*, ...) @printf(i8* %.3, i8* %.11)
  %scanf_buffer = alloca i8, i32 4096, align 1
  %.12 = getelementptr [3 x i8], [3 x i8]* @"2", i32 0, i32 0
  %.13 = call i64 (i8*, ...) @_scanf(i8* %.12, i8* %scanf_buffer)
  %.14 = alloca %str, align 8
  %.15 = getelementptr %str, %str* %.14, i32 0, i32 0
  %.16 = getelementptr %str, %str* %.14, i32 0, i32 1
  store i64 4096, i64* %.15, align 4
  store i8* %scanf_buffer, i8** %.16, align 8
  %.19 = bitcast %str* %.2 to i8*
  %.20 = bitcast %str* %.14 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %.19, i8* %.20, i64 16, i1 false)
  %.22 = getelementptr [4 x i8], [4 x i8]* @"3", i32 0, i32 0
  %.23 = getelementptr %str, %str* %.2, i32 0, i32 1
  %.24 = load i8*, i8** %.23, align 8
  %print.1 = call i64 (i8*, ...) @printf(i8* %.22, i8* %.24)
  ret void
}

declare i64 @printf(i8*, ...)

declare i64 @_scanf(i8*, ...)

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #0

attributes #0 = { argmemonly nofree nounwind willreturn }
