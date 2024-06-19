; ModuleID = "main"
target triple = "unknown-unknown-unknown"
target datalayout = ""

define i32 @"calculate"(i32 %".1", i32 %".2", i8* %".3")
{
entry:
  %"a" = alloca i32
  store i32 %".1", i32* %"a"
  %"b" = alloca i32
  store i32 %".2", i32* %"b"
  %"c" = alloca i8*
  store i8* %".3", i8** %"c"
  %"a.1" = load i32, i32* %"a"
  %"b.1" = load i32, i32* %"b"
  %"addtmp" = add i32 %"a.1", %"b.1"
  %"result" = alloca i32
  store i32 %"addtmp", i32* %"result"
  %"a.2" = load i32, i32* %"a"
  %"b.2" = load i32, i32* %"b"
  %"cmptmp" = icmp sgt i32 %"a.2", %"b.2"
  %"ifcond" = icmp ne i1 %"cmptmp", 0
  br i1 %"ifcond", label %"then", label %"else"
then:
  %"result.1" = load i32, i32* %"result"
  %"addtmp.1" = add i32 %"result.1", 10
  store i32 %"addtmp.1", i32* %"result"
  br label %"ifcont"
else:
  %"a.3" = load i32, i32* %"a"
  %"b.3" = load i32, i32* %"b"
  %"cmptmp.1" = icmp eq i32 %"a.3", %"b.3"
  %"ifcond.1" = icmp ne i1 %"cmptmp.1", 0
  br i1 %"ifcond.1", label %"then.1", label %"else.1"
ifcont:
  %"result.4" = load i32, i32* %"result"
  ret i32 %"result.4"
then.1:
  %"result.2" = load i32, i32* %"result"
  %"addtmp.2" = add i32 %"result.2", 20
  store i32 %"addtmp.2", i32* %"result"
  br label %"ifcont.1"
else.1:
  %"result.3" = load i32, i32* %"result"
  %"addtmp.3" = add i32 %"result.3", 30
  store i32 %"addtmp.3", i32* %"result"
  br label %"ifcont.1"
ifcont.1:
}

define i8* @"check_value"(i32 %".1")
{
entry:
  %"x" = alloca i32
  store i32 %".1", i32* %"x"
  %"x.1" = load i32, i32* %"x"
  %"cmptmp" = icmp sgt i32 %"x.1", 10
  %"ifcond" = icmp ne i1 %"cmptmp", 0
  br i1 %"ifcond", label %"then", label %"else"
then:
  ret i8* bitcast ([5 x i8]* @"high_str" to i8*)
else:
  ret i8* bitcast ([4 x i8]* @"low_str" to i8*)
ifcont:
}

@"high_str" = constant [5 x i8] c"high\00"
@"low_str" = constant [4 x i8] c"low\00"
