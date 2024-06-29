; ModuleID = "my_module"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"add"(i32 %".1", i32 %".2")
{
entry:
  %"res" = add i32 %".1", %".2"
  ret i32 %"res"
}
