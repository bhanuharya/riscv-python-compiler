; ModuleID = '<string>'
source_filename = "<string>"
target datalayout = "e-m:e-i32:32-i16:16-i8:8-n32-S32"
target triple = "riscv32-unknown-linux-gnu"

@"0" = internal constant [4 x i8] c"%f\0A\00"

define void @main() {
entry:
  %.2 = alloca double, align 8
  %.3 = frem double 1.354000e+02, 1.000000e+01
  store double %.3, double* %.2, align 8
  %.5 = load double, double* %.2, align 8
  %.6 = fmul double %.5, 2.000000e+00
  store double %.6, double* %.2, align 8
  %.8 = load double, double* %.2, align 8
  %.9 = fsub double %.8, 4.000000e+00
  store double %.9, double* %.2, align 8
  %.11 = load double, double* %.2, align 8
  %.12 = fadd double %.11, 1.000000e+00
  store double %.12, double* %.2, align 8
  %.14 = getelementptr [4 x i8], [4 x i8]* @"0", i32 0, i32 0
  %.15 = load double, double* %.2, align 8
  %.16 = fdiv double %.15, 2.000000e+00
  %print = call i32 (i8*, ...) @printf(i8* %.14, double %.16)
  ret void
}

declare i32 @printf(i8*, ...)

declare i8* @readline(i8*, ...)

declare i32 @strlen(i8*, ...)

declare i16 @memcmp(i8*, i8*, i32)

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i32(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i32, i1 immarg) #0

attributes #0 = { argmemonly nofree nounwind willreturn }
