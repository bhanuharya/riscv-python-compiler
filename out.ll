; ModuleID = '<string>'
source_filename = "<string>"
target datalayout = "e-m:e-i32:32-i16:16-i8:8-n32-S32"
target triple = "riscv32-unknown-linux-gnu"

%"list[int]" = type { i32, i32* }

@"0" = internal constant [4 x i8] c"%f\0A\00"

define void @main() {
entry:
  %.2 = alloca i32, align 4
  store i32 10, i32* %.2, align 4
  %.4 = alloca i32, align 4
  %.5 = load i32, i32* %.2, align 4
  %.6 = alloca i32, i32 %.5, align 4
  %.7 = alloca i32, align 4
  store i32 0, i32* %.7, align 4
  br label %cond

cond:                                             ; preds = %range-body, %entry
  %.10 = load i32, i32* %.7, align 4
  %.11 = icmp slt i32 %.10, %.5
  br i1 %.11, label %range-body, label %after

range-body:                                       ; preds = %cond
  %.13 = getelementptr i32, i32* %.6, i32 %.10
  store i32 %.10, i32* %.13, align 4
  %.15 = add i32 %.10, 1
  store i32 %.15, i32* %.7, align 4
  br label %cond

after:                                            ; preds = %cond
  %.18 = alloca %"list[int]", align 8
  %.19 = getelementptr %"list[int]", %"list[int]"* %.18, i32 0, i32 0
  %.20 = getelementptr %"list[int]", %"list[int]"* %.18, i32 0, i32 1
  store i32 %.5, i32* %.19, align 4
  store i32* %.6, i32** %.20, align 8
  %.23 = alloca i32, align 4
  store i32 0, i32* %.23, align 4
  br label %cond.1

cond.1:                                           ; preds = %after.1, %after
  %.26 = load i32, i32* %.23, align 4
  %.27 = getelementptr %"list[int]", %"list[int]"* %.18, i32 0, i32 0
  %.28 = load i32, i32* %.27, align 4
  %.29 = icmp slt i32 %.26, %.28
  br i1 %.29, label %for-body, label %orelse-body

for-body:                                         ; preds = %cond.1
  %.31 = getelementptr %"list[int]", %"list[int]"* %.18, i32 0, i32 1
  %.32 = load i32*, i32** %.31, align 8
  %.33 = getelementptr i32, i32* %.32, i32 %.26
  %.34 = load i32, i32* %.33, align 4
  store i32 %.34, i32* %.4, align 4
  %.36 = load i32, i32* %.4, align 4
  %.37 = icmp ne i32 %.36, 0
  br i1 %.37, label %if-true, label %or-else

orelse-body:                                      ; preds = %cond.1
  br label %after-for

after-for:                                        ; preds = %orelse-body
  ret void

if-true:                                          ; preds = %for-body
  %.39 = getelementptr [4 x i8], [4 x i8]* @"0", i32 0, i32 0
  %.40 = load i32, i32* %.4, align 4
  %.41 = sitofp i32 %.40 to double
  %.42 = call double @functions.fibonacci(double %.41)
  %print = call i32 (i8*, ...) @printf(i8* %.39, double %.42)
  br label %after.1

or-else:                                          ; preds = %for-body
  br label %after.1

after.1:                                          ; preds = %or-else, %if-true
  %.45 = add i32 %.26, 1
  store i32 %.45, i32* %.23, align 4
  br label %cond.1
}

declare i32 @printf(i8*, ...)

declare i8* @readline(i8*, ...)

declare i32 @strlen(i8*, ...)

declare i16 @memcmp(i8*, i8*, i32)

define double @functions.fibonacci(double %.1) {
entry:
  %.3 = alloca double, align 8
  store double %.1, double* %.3, align 8
  %.5 = load double, double* %.3, align 8
  %.6 = fcmp ole double %.5, 1.000000e+00
  br i1 %.6, label %if-true, label %or-else

if-true:                                          ; preds = %entry
  %.8 = load double, double* %.3, align 8
  ret double %.8

or-else:                                          ; preds = %entry
  %.10 = load double, double* %.3, align 8
  %.11 = fsub double %.10, 1.000000e+00
  %.12 = call double @functions.fibonacci(double %.11)
  %.13 = load double, double* %.3, align 8
  %.14 = fsub double %.13, 2.000000e+00
  %.15 = call double @functions.fibonacci(double %.14)
  %.16 = fadd double %.12, %.15
  ret double %.16

after:                                            ; No predecessors!
  %.18 = alloca double, align 8
  %.19 = load double, double* %.18, align 8
  ret double %.19
}

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i32(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i32, i1 immarg) #0

attributes #0 = { argmemonly nofree nounwind willreturn }
