; ModuleID = "bubble_sort"
target triple = "unknown-unknown-unknown"
target datalayout = ""

define void @"bubble_sort"(i32* %"lst", i32 %"n")
{
entry:
  %"i" = alloca i32
  store i32 0, i32* %"i"
  br label %"outer_loop_cond"
outer_loop_cond:
  %".6" = load i32, i32* %"i"
  %".7" = sub i32 %"n", 1
  %".8" = icmp slt i32 %".6", %".7"
  br i1 %".8", label %"outer_loop_body", label %"outer_loop_end"
outer_loop_body:
  %"j" = alloca i32
  %".10" = add i32 %".6", 1
  store i32 %".10", i32* %"j"
outer_loop_inc:
  %".34" = add i32 %".6", 1
  store i32 %".34", i32* %"i"
  br label %"outer_loop_cond"
outer_loop_end:
  ret void
inner_loop_cond:
  %".12" = load i32, i32* %"j"
  %".13" = icmp slt i32 %".12", %"n"
  br i1 %".13", label %"inner_loop_body", label %"inner_loop_end"
inner_loop_body:
  %".15" = getelementptr i32, i32* %"lst", i32 %".6"
  %".16" = getelementptr i32, i32* %"lst", i32 %".12"
  %".17" = load i32, i32* %".15"
  %".18" = load i32, i32* %".16"
  %".19" = icmp sgt i32 %".17", %".18"
  br i1 %".19", label %"inner_loop_body.if", label %"inner_loop_body.endif"
inner_loop_inc:
  %".29" = load i32, i32* %"j"
  %".30" = add i32 %".29", 1
  store i32 %".30", i32* %"j"
  br label %"inner_loop_cond"
inner_loop_end:
  br label %"outer_loop_inc"
inner_loop_body.if:
  %".21" = getelementptr i32, i32* %"lst", i32 %".6"
  %".22" = getelementptr i32, i32* %"lst", i32 %".12"
  %".23" = load i32, i32* %".21"
  %".24" = load i32, i32* %".22"
  store i32 %".24", i32* %".21"
  store i32 %".23", i32* %".22"
  br label %"inner_loop_body.endif"
inner_loop_body.endif:
  br label %"inner_loop_inc"
}

