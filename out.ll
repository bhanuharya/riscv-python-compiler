; ModuleID = '<string>'
source_filename = "<string>"
target datalayout = "e-m:e-i32:32-i16:16-i8:8-n32-S32"
target triple = "riscv32-unknown-linux-gnu"

%str = type { i32, i8* }
%"list[int]" = type { i32, i32* }
%"list[str]" = type { i32, %str* }

@"0" = internal constant [4 x i8] c"%s\0A\00"
@"1" = internal constant [21 x i8] c"test deret fibonacci\00"
@"2" = internal constant [4 x i8] c"%f\0A\00"
@"3" = internal constant [4 x i8] c"%s\0A\00"
@"4" = internal constant [19 x i8] c"operasi aritmetika\00"
@"5" = internal constant [4 x i8] c"%d\0A\00"
@"6" = internal constant [4 x i8] c"%f\0A\00"
@"7" = internal constant [4 x i8] c"%d\0A\00"
@"8" = internal constant [4 x i8] c"%f\0A\00"
@"9" = internal constant [4 x i8] c"%s\0A\00"
@"10" = internal constant [21 x i8] c"testing iterasi list\00"
@"11" = internal constant [4 x i8] c"foo\00"
@"12" = internal constant [4 x i8] c"bar\00"
@"13" = internal constant [4 x i8] c"str\00"
@"14" = internal constant [5 x i8] c"test\00"
@"15" = internal constant [5 x i8] c"halo\00"
@"16" = internal constant [4 x i8] c"%s\0A\00"

define void @main() {
entry:
  %.2 = getelementptr [4 x i8], [4 x i8]* @"0", i32 0, i32 0
  %.3 = getelementptr [21 x i8], [21 x i8]* @"1", i32 0, i32 0
  %.4 = alloca %str, align 8
  %.5 = getelementptr %str, %str* %.4, i32 0, i32 0
  %.6 = getelementptr %str, %str* %.4, i32 0, i32 1
  store i32 20, i32* %.5, align 4
  store i8* %.3, i8** %.6, align 8
  %.9 = getelementptr %str, %str* %.4, i32 0, i32 1
  %.10 = load i8*, i8** %.9, align 8
  %print = call i32 (i8*, ...) @printf(i8* %.2, i8* %.10)
  %.11 = alloca i32, align 4
  store i32 20, i32* %.11, align 4
  %.13 = alloca i32, align 4
  %.14 = load i32, i32* %.11, align 4
  %.15 = alloca i32, i32 %.14, align 4
  %.16 = alloca i32, align 4
  store i32 0, i32* %.16, align 4
  br label %cond

cond:                                             ; preds = %range-body, %entry
  %.19 = load i32, i32* %.16, align 4
  %.20 = icmp slt i32 %.19, %.14
  br i1 %.20, label %range-body, label %after

range-body:                                       ; preds = %cond
  %.22 = getelementptr i32, i32* %.15, i32 %.19
  store i32 %.19, i32* %.22, align 4
  %.24 = add i32 %.19, 1
  store i32 %.24, i32* %.16, align 4
  br label %cond

after:                                            ; preds = %cond
  %.27 = alloca %"list[int]", align 8
  %.28 = getelementptr %"list[int]", %"list[int]"* %.27, i32 0, i32 0
  %.29 = getelementptr %"list[int]", %"list[int]"* %.27, i32 0, i32 1
  store i32 %.14, i32* %.28, align 4
  store i32* %.15, i32** %.29, align 8
  %.32 = alloca i32, align 4
  store i32 0, i32* %.32, align 4
  br label %cond.1

cond.1:                                           ; preds = %after.1, %after
  %.35 = load i32, i32* %.32, align 4
  %.36 = getelementptr %"list[int]", %"list[int]"* %.27, i32 0, i32 0
  %.37 = load i32, i32* %.36, align 4
  %.38 = icmp slt i32 %.35, %.37
  br i1 %.38, label %for-body, label %orelse-body

for-body:                                         ; preds = %cond.1
  %.40 = getelementptr %"list[int]", %"list[int]"* %.27, i32 0, i32 1
  %.41 = load i32*, i32** %.40, align 8
  %.42 = getelementptr i32, i32* %.41, i32 %.35
  %.43 = load i32, i32* %.42, align 4
  store i32 %.43, i32* %.13, align 4
  %.45 = load i32, i32* %.13, align 4
  %.46 = icmp ne i32 %.45, 0
  br i1 %.46, label %if-true, label %or-else

orelse-body:                                      ; preds = %cond.1
  br label %after-for

after-for:                                        ; preds = %orelse-body
  %.58 = getelementptr [4 x i8], [4 x i8]* @"3", i32 0, i32 0
  %.59 = getelementptr [19 x i8], [19 x i8]* @"4", i32 0, i32 0
  %.60 = alloca %str, align 8
  %.61 = getelementptr %str, %str* %.60, i32 0, i32 0
  %.62 = getelementptr %str, %str* %.60, i32 0, i32 1
  store i32 18, i32* %.61, align 4
  store i8* %.59, i8** %.62, align 8
  %.65 = getelementptr %str, %str* %.60, i32 0, i32 1
  %.66 = load i8*, i8** %.65, align 8
  %print.2 = call i32 (i8*, ...) @printf(i8* %.58, i8* %.66)
  %.67 = alloca i32, align 4
  store i32 3, i32* %.67, align 4
  %.69 = alloca i32, align 4
  store i32 2, i32* %.69, align 4
  %.71 = alloca i32, align 4
  %.72 = load i32, i32* %.67, align 4
  %.73 = load i32, i32* %.69, align 4
  %.74 = sdiv i32 %.72, %.73
  store i32 %.74, i32* %.71, align 4
  %.76 = getelementptr [4 x i8], [4 x i8]* @"5", i32 0, i32 0
  %.77 = load i32, i32* %.71, align 4
  %print.3 = call i32 (i8*, ...) @printf(i8* %.76, i32 %.77)
  %.78 = alloca double, align 8
  %.79 = load i32, i32* %.67, align 4
  %.80 = sitofp i32 %.79 to double
  %.81 = load i32, i32* %.69, align 4
  %.82 = sitofp i32 %.81 to double
  %.83 = fdiv double %.80, %.82
  store double %.83, double* %.78, align 8
  %.85 = getelementptr [4 x i8], [4 x i8]* @"6", i32 0, i32 0
  %.86 = load double, double* %.78, align 8
  %print.4 = call i32 (i8*, ...) @printf(i8* %.85, double %.86)
  %.87 = alloca i32, align 4
  %.88 = mul i32 5, 2
  %.89 = add i32 3, %.88
  %.90 = sdiv i32 8, 4
  %.91 = sub i32 %.89, %.90
  store i32 %.91, i32* %.87, align 4
  %.93 = getelementptr [4 x i8], [4 x i8]* @"7", i32 0, i32 0
  %.94 = load i32, i32* %.87, align 4
  %print.5 = call i32 (i8*, ...) @printf(i8* %.93, i32 %.94)
  %.95 = alloca double, align 8
  %.96 = sitofp i32 3 to double
  %.97 = sitofp i32 5 to double
  %.98 = sitofp i32 2 to double
  %.99 = fmul double %.97, %.98
  %.100 = fadd double %.96, %.99
  %.101 = sitofp i32 8 to double
  %.102 = sitofp i32 4 to double
  %.103 = fdiv double %.101, %.102
  %.104 = fsub double %.100, %.103
  store double %.104, double* %.95, align 8
  %.106 = getelementptr [4 x i8], [4 x i8]* @"8", i32 0, i32 0
  %.107 = load double, double* %.95, align 8
  %print.6 = call i32 (i8*, ...) @printf(i8* %.106, double %.107)
  %.108 = getelementptr [4 x i8], [4 x i8]* @"9", i32 0, i32 0
  %.109 = getelementptr [21 x i8], [21 x i8]* @"10", i32 0, i32 0
  %.110 = alloca %str, align 8
  %.111 = getelementptr %str, %str* %.110, i32 0, i32 0
  %.112 = getelementptr %str, %str* %.110, i32 0, i32 1
  store i32 20, i32* %.111, align 4
  store i8* %.109, i8** %.112, align 8
  %.115 = getelementptr %str, %str* %.110, i32 0, i32 1
  %.116 = load i8*, i8** %.115, align 8
  %print.7 = call i32 (i8*, ...) @printf(i8* %.108, i8* %.116)
  %.117 = alloca %"list[str]", align 8
  %.118 = getelementptr [4 x i8], [4 x i8]* @"11", i32 0, i32 0
  %.119 = alloca %str, align 8
  %.120 = getelementptr %str, %str* %.119, i32 0, i32 0
  %.121 = getelementptr %str, %str* %.119, i32 0, i32 1
  store i32 3, i32* %.120, align 4
  store i8* %.118, i8** %.121, align 8
  %.124 = getelementptr [4 x i8], [4 x i8]* @"12", i32 0, i32 0
  %.125 = alloca %str, align 8
  %.126 = getelementptr %str, %str* %.125, i32 0, i32 0
  %.127 = getelementptr %str, %str* %.125, i32 0, i32 1
  store i32 3, i32* %.126, align 4
  store i8* %.124, i8** %.127, align 8
  %.130 = getelementptr [4 x i8], [4 x i8]* @"13", i32 0, i32 0
  %.131 = alloca %str, align 8
  %.132 = getelementptr %str, %str* %.131, i32 0, i32 0
  %.133 = getelementptr %str, %str* %.131, i32 0, i32 1
  store i32 3, i32* %.132, align 4
  store i8* %.130, i8** %.133, align 8
  %.136 = getelementptr [5 x i8], [5 x i8]* @"14", i32 0, i32 0
  %.137 = alloca %str, align 8
  %.138 = getelementptr %str, %str* %.137, i32 0, i32 0
  %.139 = getelementptr %str, %str* %.137, i32 0, i32 1
  store i32 4, i32* %.138, align 4
  store i8* %.136, i8** %.139, align 8
  %.142 = getelementptr [5 x i8], [5 x i8]* @"15", i32 0, i32 0
  %.143 = alloca %str, align 8
  %.144 = getelementptr %str, %str* %.143, i32 0, i32 0
  %.145 = getelementptr %str, %str* %.143, i32 0, i32 1
  store i32 4, i32* %.144, align 4
  store i8* %.142, i8** %.145, align 8
  %.148 = alloca %"list[str]", align 8
  %.149 = getelementptr %"list[str]", %"list[str]"* %.148, i32 0, i32 0
  store i32 5, i32* %.149, align 4
  %.151 = alloca %str, i32 5, align 8
  %.152 = getelementptr %"list[str]", %"list[str]"* %.148, i32 0, i32 1
  store %str* %.151, %str** %.152, align 8
  %.154 = getelementptr %str, %str* %.151, i32 0
  %.155 = bitcast %str* %.154 to i8*
  %.156 = bitcast %str* %.119 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %.155, i8* %.156, i32 8, i1 false)
  %.158 = getelementptr %str, %str* %.151, i32 1
  %.159 = bitcast %str* %.158 to i8*
  %.160 = bitcast %str* %.125 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %.159, i8* %.160, i32 8, i1 false)
  %.162 = getelementptr %str, %str* %.151, i32 2
  %.163 = bitcast %str* %.162 to i8*
  %.164 = bitcast %str* %.131 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %.163, i8* %.164, i32 8, i1 false)
  %.166 = getelementptr %str, %str* %.151, i32 3
  %.167 = bitcast %str* %.166 to i8*
  %.168 = bitcast %str* %.137 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %.167, i8* %.168, i32 8, i1 false)
  %.170 = getelementptr %str, %str* %.151, i32 4
  %.171 = bitcast %str* %.170 to i8*
  %.172 = bitcast %str* %.143 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %.171, i8* %.172, i32 8, i1 false)
  %.174 = bitcast %"list[str]"* %.117 to i8*
  %.175 = bitcast %"list[str]"* %.148 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %.174, i8* %.175, i32 8, i1 false)
  %.177 = alloca %str, align 8
  %.178 = alloca i32, align 4
  store i32 0, i32* %.178, align 4
  br label %cond.2

if-true:                                          ; preds = %for-body
  %.48 = getelementptr [4 x i8], [4 x i8]* @"2", i32 0, i32 0
  %.49 = load i32, i32* %.13, align 4
  %.50 = sitofp i32 %.49 to double
  %.51 = call double @performance_test.fibonacci(double %.50)
  %print.1 = call i32 (i8*, ...) @printf(i8* %.48, double %.51)
  br label %after.1

or-else:                                          ; preds = %for-body
  br label %after.1

after.1:                                          ; preds = %or-else, %if-true
  %.54 = add i32 %.35, 1
  store i32 %.54, i32* %.32, align 4
  br label %cond.1

cond.2:                                           ; preds = %for-body.1, %after-for
  %.181 = load i32, i32* %.178, align 4
  %.182 = getelementptr %"list[str]", %"list[str]"* %.117, i32 0, i32 0
  %.183 = load i32, i32* %.182, align 4
  %.184 = icmp slt i32 %.181, %.183
  br i1 %.184, label %for-body.1, label %orelse-body.1

for-body.1:                                       ; preds = %cond.2
  %.186 = getelementptr %"list[str]", %"list[str]"* %.117, i32 0, i32 1
  %.187 = load %str*, %str** %.186, align 8
  %.188 = getelementptr %str, %str* %.187, i32 %.181
  %.189 = bitcast %str* %.177 to i8*
  %.190 = bitcast %str* %.188 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %.189, i8* %.190, i32 8, i1 false)
  %.192 = getelementptr [4 x i8], [4 x i8]* @"16", i32 0, i32 0
  %.193 = getelementptr %str, %str* %.177, i32 0, i32 1
  %.194 = load i8*, i8** %.193, align 8
  %print.8 = call i32 (i8*, ...) @printf(i8* %.192, i8* %.194)
  %.195 = add i32 %.181, 1
  store i32 %.195, i32* %.178, align 4
  br label %cond.2

orelse-body.1:                                    ; preds = %cond.2
  br label %after-for.1

after-for.1:                                      ; preds = %orelse-body.1
  ret void
}

declare i32 @printf(i8*, ...)

declare i8* @readline(i8*, ...)

declare i32 @strlen(i8*, ...)

declare i16 @memcmp(i8*, i8*, i32)

define double @performance_test.fibonacci(double %.1) {
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
  %.12 = call double @performance_test.fibonacci(double %.11)
  %.13 = load double, double* %.3, align 8
  %.14 = fsub double %.13, 2.000000e+00
  %.15 = call double @performance_test.fibonacci(double %.14)
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
