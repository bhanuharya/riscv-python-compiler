; ModuleID = '<string>'
source_filename = "<string>"
target datalayout = "e-m:e-i32:32-i16:16-i8:8-n32-S32"
target triple = "riscv32-unknown-linux-gnu"

%str = type { i32, i8* }
%"list[str]" = type { i32, %str* }

@"0" = internal constant [4 x i8] c"%s\0A\00"
@"1" = internal constant [24 x i8] c"1. List of string print\00"
@"2" = internal constant [4 x i8] c"foo\00"
@"3" = internal constant [4 x i8] c"bar\00"
@"4" = internal constant [4 x i8] c"str\00"
@"5" = internal constant [5 x i8] c"test\00"
@"6" = internal constant [5 x i8] c"halo\00"
@"7" = internal constant [4 x i8] c"%s\0A\00"
@"8" = internal constant [4 x i8] c"%s\0A\00"
@"9" = internal constant [12 x i8] c"2. Variabel\00"
@"10" = internal constant [12 x i8] c"some string\00"
@"11" = internal constant [4 x i8] c"%s\0A\00"
@"12" = internal constant [4 x i8] c"%s\0A\00"
@"13" = internal constant [19 x i8] c"3. Math Operations\00"
@"14" = internal constant [4 x i8] c"%f\0A\00"
@"15" = internal constant [4 x i8] c"%s\0A\00"
@"16" = internal constant [16 x i8] c"3. Flow Control\00"
@"17" = internal constant [4 x i8] c"%d\0A\00"

define void @main() {
entry:
  %.2 = getelementptr [4 x i8], [4 x i8]* @"0", i32 0, i32 0
  %.3 = getelementptr [24 x i8], [24 x i8]* @"1", i32 0, i32 0
  %.4 = alloca %str, align 8
  %.5 = getelementptr %str, %str* %.4, i32 0, i32 0
  %.6 = getelementptr %str, %str* %.4, i32 0, i32 1
  store i32 23, i32* %.5, align 4
  store i8* %.3, i8** %.6, align 8
  %.9 = getelementptr %str, %str* %.4, i32 0, i32 1
  %.10 = load i8*, i8** %.9, align 8
  %print = call i32 (i8*, ...) @printf(i8* %.2, i8* %.10)
  %.11 = alloca %"list[str]", align 8
  %.12 = getelementptr [4 x i8], [4 x i8]* @"2", i32 0, i32 0
  %.13 = alloca %str, align 8
  %.14 = getelementptr %str, %str* %.13, i32 0, i32 0
  %.15 = getelementptr %str, %str* %.13, i32 0, i32 1
  store i32 3, i32* %.14, align 4
  store i8* %.12, i8** %.15, align 8
  %.18 = getelementptr [4 x i8], [4 x i8]* @"3", i32 0, i32 0
  %.19 = alloca %str, align 8
  %.20 = getelementptr %str, %str* %.19, i32 0, i32 0
  %.21 = getelementptr %str, %str* %.19, i32 0, i32 1
  store i32 3, i32* %.20, align 4
  store i8* %.18, i8** %.21, align 8
  %.24 = getelementptr [4 x i8], [4 x i8]* @"4", i32 0, i32 0
  %.25 = alloca %str, align 8
  %.26 = getelementptr %str, %str* %.25, i32 0, i32 0
  %.27 = getelementptr %str, %str* %.25, i32 0, i32 1
  store i32 3, i32* %.26, align 4
  store i8* %.24, i8** %.27, align 8
  %.30 = getelementptr [5 x i8], [5 x i8]* @"5", i32 0, i32 0
  %.31 = alloca %str, align 8
  %.32 = getelementptr %str, %str* %.31, i32 0, i32 0
  %.33 = getelementptr %str, %str* %.31, i32 0, i32 1
  store i32 4, i32* %.32, align 4
  store i8* %.30, i8** %.33, align 8
  %.36 = getelementptr [5 x i8], [5 x i8]* @"6", i32 0, i32 0
  %.37 = alloca %str, align 8
  %.38 = getelementptr %str, %str* %.37, i32 0, i32 0
  %.39 = getelementptr %str, %str* %.37, i32 0, i32 1
  store i32 4, i32* %.38, align 4
  store i8* %.36, i8** %.39, align 8
  %.42 = alloca %"list[str]", align 8
  %.43 = getelementptr %"list[str]", %"list[str]"* %.42, i32 0, i32 0
  store i32 5, i32* %.43, align 4
  %.45 = alloca %str, i32 5, align 8
  %.46 = getelementptr %"list[str]", %"list[str]"* %.42, i32 0, i32 1
  store %str* %.45, %str** %.46, align 8
  %.48 = getelementptr %str, %str* %.45, i32 0
  %.49 = bitcast %str* %.48 to i8*
  %.50 = bitcast %str* %.13 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %.49, i8* %.50, i32 8, i1 false)
  %.52 = getelementptr %str, %str* %.45, i32 1
  %.53 = bitcast %str* %.52 to i8*
  %.54 = bitcast %str* %.19 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %.53, i8* %.54, i32 8, i1 false)
  %.56 = getelementptr %str, %str* %.45, i32 2
  %.57 = bitcast %str* %.56 to i8*
  %.58 = bitcast %str* %.25 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %.57, i8* %.58, i32 8, i1 false)
  %.60 = getelementptr %str, %str* %.45, i32 3
  %.61 = bitcast %str* %.60 to i8*
  %.62 = bitcast %str* %.31 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %.61, i8* %.62, i32 8, i1 false)
  %.64 = getelementptr %str, %str* %.45, i32 4
  %.65 = bitcast %str* %.64 to i8*
  %.66 = bitcast %str* %.37 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %.65, i8* %.66, i32 8, i1 false)
  %.68 = bitcast %"list[str]"* %.11 to i8*
  %.69 = bitcast %"list[str]"* %.42 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %.68, i8* %.69, i32 8, i1 false)
  %.71 = alloca %str, align 8
  %.72 = alloca i32, align 4
  store i32 0, i32* %.72, align 4
  br label %cond

cond:                                             ; preds = %for-body, %entry
  %.75 = load i32, i32* %.72, align 4
  %.76 = getelementptr %"list[str]", %"list[str]"* %.11, i32 0, i32 0
  %.77 = load i32, i32* %.76, align 4
  %.78 = icmp slt i32 %.75, %.77
  br i1 %.78, label %for-body, label %orelse-body

for-body:                                         ; preds = %cond
  %.80 = getelementptr %"list[str]", %"list[str]"* %.11, i32 0, i32 1
  %.81 = load %str*, %str** %.80, align 8
  %.82 = getelementptr %str, %str* %.81, i32 %.75
  %.83 = bitcast %str* %.71 to i8*
  %.84 = bitcast %str* %.82 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %.83, i8* %.84, i32 8, i1 false)
  %.86 = getelementptr [4 x i8], [4 x i8]* @"7", i32 0, i32 0
  %.87 = getelementptr %str, %str* %.71, i32 0, i32 1
  %.88 = load i8*, i8** %.87, align 8
  %print.1 = call i32 (i8*, ...) @printf(i8* %.86, i8* %.88)
  %.89 = add i32 %.75, 1
  store i32 %.89, i32* %.72, align 4
  br label %cond

orelse-body:                                      ; preds = %cond
  br label %after-for

after-for:                                        ; preds = %orelse-body
  %.93 = getelementptr [4 x i8], [4 x i8]* @"8", i32 0, i32 0
  %.94 = getelementptr [12 x i8], [12 x i8]* @"9", i32 0, i32 0
  %.95 = alloca %str, align 8
  %.96 = getelementptr %str, %str* %.95, i32 0, i32 0
  %.97 = getelementptr %str, %str* %.95, i32 0, i32 1
  store i32 11, i32* %.96, align 4
  store i8* %.94, i8** %.97, align 8
  %.100 = getelementptr %str, %str* %.95, i32 0, i32 1
  %.101 = load i8*, i8** %.100, align 8
  %print.2 = call i32 (i8*, ...) @printf(i8* %.93, i8* %.101)
  %.102 = alloca %str, align 8
  %.103 = getelementptr [12 x i8], [12 x i8]* @"10", i32 0, i32 0
  %.104 = alloca %str, align 8
  %.105 = getelementptr %str, %str* %.104, i32 0, i32 0
  %.106 = getelementptr %str, %str* %.104, i32 0, i32 1
  store i32 11, i32* %.105, align 4
  store i8* %.103, i8** %.106, align 8
  %.109 = bitcast %str* %.102 to i8*
  %.110 = bitcast %str* %.104 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %.109, i8* %.110, i32 8, i1 false)
  %.112 = alloca %str, align 8
  %.113 = bitcast %str* %.112 to i8*
  %.114 = bitcast %str* %.102 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %.113, i8* %.114, i32 8, i1 false)
  %.116 = getelementptr [4 x i8], [4 x i8]* @"11", i32 0, i32 0
  %.117 = getelementptr %str, %str* %.112, i32 0, i32 1
  %.118 = load i8*, i8** %.117, align 8
  %print.3 = call i32 (i8*, ...) @printf(i8* %.116, i8* %.118)
  %.119 = getelementptr [4 x i8], [4 x i8]* @"12", i32 0, i32 0
  %.120 = getelementptr [19 x i8], [19 x i8]* @"13", i32 0, i32 0
  %.121 = alloca %str, align 8
  %.122 = getelementptr %str, %str* %.121, i32 0, i32 0
  %.123 = getelementptr %str, %str* %.121, i32 0, i32 1
  store i32 18, i32* %.122, align 4
  store i8* %.120, i8** %.123, align 8
  %.126 = getelementptr %str, %str* %.121, i32 0, i32 1
  %.127 = load i8*, i8** %.126, align 8
  %print.4 = call i32 (i8*, ...) @printf(i8* %.119, i8* %.127)
  %.128 = alloca double, align 8
  %.129 = frem double 1.354000e+02, 1.000000e+01
  store double %.129, double* %.128, align 8
  %.131 = load double, double* %.128, align 8
  %.132 = fmul double %.131, 2.000000e+00
  store double %.132, double* %.128, align 8
  %.134 = load double, double* %.128, align 8
  %.135 = fsub double %.134, 4.000000e+00
  store double %.135, double* %.128, align 8
  %.137 = load double, double* %.128, align 8
  %.138 = fadd double %.137, 1.000000e+00
  store double %.138, double* %.128, align 8
  %.140 = getelementptr [4 x i8], [4 x i8]* @"14", i32 0, i32 0
  %.141 = load double, double* %.128, align 8
  %.142 = fdiv double %.141, 2.000000e+00
  %print.5 = call i32 (i8*, ...) @printf(i8* %.140, double %.142)
  %.143 = getelementptr [4 x i8], [4 x i8]* @"15", i32 0, i32 0
  %.144 = getelementptr [16 x i8], [16 x i8]* @"16", i32 0, i32 0
  %.145 = alloca %str, align 8
  %.146 = getelementptr %str, %str* %.145, i32 0, i32 0
  %.147 = getelementptr %str, %str* %.145, i32 0, i32 1
  store i32 15, i32* %.146, align 4
  store i8* %.144, i8** %.147, align 8
  %.150 = getelementptr %str, %str* %.145, i32 0, i32 1
  %.151 = load i8*, i8** %.150, align 8
  %print.6 = call i32 (i8*, ...) @printf(i8* %.143, i8* %.151)
  %.152 = alloca i32, align 4
  store i32 1, i32* %.152, align 4
  %.154 = load i32, i32* %.152, align 4
  %.155 = icmp eq i32 %.154, 3
  br i1 %.155, label %if-true, label %or-else

if-true:                                          ; preds = %after-for
  store i32 10, i32* %.152, align 4
  br label %after

or-else:                                          ; preds = %after-for
  store i32 0, i32* %.152, align 4
  br label %after

after:                                            ; preds = %or-else, %if-true
  br label %cond.1

cond.1:                                           ; preds = %for-true, %after
  %.162 = load i32, i32* %.152, align 4
  %.163 = icmp slt i32 %.162, 1000
  br i1 %.163, label %for-true, label %or-else.1

for-true:                                         ; preds = %cond.1
  %.165 = load i32, i32* %.152, align 4
  %.166 = add i32 %.165, 1
  store i32 %.166, i32* %.152, align 4
  br label %cond.1

or-else.1:                                        ; preds = %cond.1
  br label %after.1

after.1:                                          ; preds = %or-else.1
  %.170 = getelementptr [4 x i8], [4 x i8]* @"17", i32 0, i32 0
  %.171 = load i32, i32* %.152, align 4
  %print.7 = call i32 (i8*, ...) @printf(i8* %.170, i32 %.171)
  ret void
}

declare i32 @printf(i8*, ...)

declare i8* @readline(i8*, ...)

declare i32 @strlen(i8*, ...)

declare i16 @memcmp(i8*, i8*, i32)

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i32(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i32, i1 immarg) #0

attributes #0 = { argmemonly nofree nounwind willreturn }
