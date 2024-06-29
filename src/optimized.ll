; ModuleID = 'input.ll'
source_filename = "<string>"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.const.sum = internal constant [4 x i8] c"sum\00"
@_ZN08NumbaEnv8__main__3sumB2v1B38c8tJTIcFKzyF2ILShI4CrgQElQb6HczSBAA_3dExx = common local_unnamed_addr global i8* null
@".const.missing Environment: _ZN08NumbaEnv8__main__3sumB2v1B38c8tJTIcFKzyF2ILShI4CrgQElQb6HczSBAA_3dExx" = internal constant [96 x i8] c"missing Environment: _ZN08NumbaEnv8__main__3sumB2v1B38c8tJTIcFKzyF2ILShI4CrgQElQb6HczSBAA_3dExx\00"
@PyExc_RuntimeError = external global i8

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn writeonly
define i32 @_ZN8__main__3sumB2v1B38c8tJTIcFKzyF2ILShI4CrgQElQb6HczSBAA_3dExx(i64* noalias nocapture writeonly %retptr, { i8*, i32, i8*, i8*, i32 }** noalias nocapture readnone %excinfo, i64 %arg.x, i64 %arg.y) local_unnamed_addr #0 {
entry:
  %.6 = add nsw i64 %arg.y, %arg.x
  store i64 %.6, i64* %retptr, align 8
  ret i32 0
}

define i8* @_ZN7cpython8__main__3sumB2v1B38c8tJTIcFKzyF2ILShI4CrgQElQb6HczSBAA_3dExx(i8* nocapture readnone %py_closure, i8* %py_args, i8* nocapture readnone %py_kws) local_unnamed_addr {
entry:
  %.5 = alloca i8*, align 8
  %.6 = alloca i8*, align 8
  %.7 = call i32 (i8*, i8*, i64, i64, ...) @PyArg_UnpackTuple(i8* %py_args, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.const.sum, i64 0, i64 0), i64 2, i64 2, i8** nonnull %.5, i8** nonnull %.6)
  %.8 = icmp eq i32 %.7, 0
  %.53 = alloca i64, align 8
  br i1 %.8, label %common.ret, label %entry.endif, !prof !0

common.ret:                                       ; preds = %entry.endif.endif.endif.endif.endif.endif, %entry.endif.endif.endif.endif.endif, %entry.endif.endif.endif, %entry.endif.if, %entry
  %common.ret.op = phi i8* [ null, %entry.endif.if ], [ %.74, %entry.endif.endif.endif.endif.endif.endif ], [ null, %entry ], [ null, %entry.endif.endif.endif ], [ null, %entry.endif.endif.endif.endif.endif ]
  ret i8* %common.ret.op

entry.endif:                                      ; preds = %entry
  %.12 = load i8*, i8** @_ZN08NumbaEnv8__main__3sumB2v1B38c8tJTIcFKzyF2ILShI4CrgQElQb6HczSBAA_3dExx, align 8
  %.17 = icmp eq i8* %.12, null
  br i1 %.17, label %entry.endif.if, label %entry.endif.endif, !prof !0

entry.endif.if:                                   ; preds = %entry.endif
  call void @PyErr_SetString(i8* nonnull @PyExc_RuntimeError, i8* getelementptr inbounds ([96 x i8], [96 x i8]* @".const.missing Environment: _ZN08NumbaEnv8__main__3sumB2v1B38c8tJTIcFKzyF2ILShI4CrgQElQb6HczSBAA_3dExx", i64 0, i64 0))
  br label %common.ret

entry.endif.endif:                                ; preds = %entry.endif
  %.21 = load i8*, i8** %.5, align 8
  %.24 = call i8* @PyNumber_Long(i8* %.21)
  %.25.not = icmp eq i8* %.24, null
  br i1 %.25.not, label %entry.endif.endif.endif, label %entry.endif.endif.if, !prof !0

entry.endif.endif.if:                             ; preds = %entry.endif.endif
  %.27 = call i64 @PyLong_AsLongLong(i8* nonnull %.24)
  call void @Py_DecRef(i8* nonnull %.24)
  br label %entry.endif.endif.endif

entry.endif.endif.endif:                          ; preds = %entry.endif.endif.if, %entry.endif.endif
  %.22.0 = phi i64 [ %.27, %entry.endif.endif.if ], [ 0, %entry.endif.endif ]
  %.32 = call i8* @PyErr_Occurred()
  %.33.not = icmp eq i8* %.32, null
  br i1 %.33.not, label %entry.endif.endif.endif.endif, label %common.ret, !prof !1

entry.endif.endif.endif.endif:                    ; preds = %entry.endif.endif.endif
  %.37 = load i8*, i8** %.6, align 8
  %.40 = call i8* @PyNumber_Long(i8* %.37)
  %.41.not = icmp eq i8* %.40, null
  br i1 %.41.not, label %entry.endif.endif.endif.endif.endif, label %entry.endif.endif.endif.endif.if, !prof !0

entry.endif.endif.endif.endif.if:                 ; preds = %entry.endif.endif.endif.endif
  %.43 = call i64 @PyLong_AsLongLong(i8* nonnull %.40)
  call void @Py_DecRef(i8* nonnull %.40)
  br label %entry.endif.endif.endif.endif.endif

entry.endif.endif.endif.endif.endif:              ; preds = %entry.endif.endif.endif.endif.if, %entry.endif.endif.endif.endif
  %.38.0 = phi i64 [ %.43, %entry.endif.endif.endif.endif.if ], [ 0, %entry.endif.endif.endif.endif ]
  %.48 = call i8* @PyErr_Occurred()
  %.49.not = icmp eq i8* %.48, null
  br i1 %.49.not, label %entry.endif.endif.endif.endif.endif.endif, label %common.ret, !prof !1

entry.endif.endif.endif.endif.endif.endif:        ; preds = %entry.endif.endif.endif.endif.endif
  store i64 0, i64* %.53, align 8
  %.57 = call i32 @_ZN8__main__3sumB2v1B38c8tJTIcFKzyF2ILShI4CrgQElQb6HczSBAA_3dExx(i64* nonnull %.53, { i8*, i32, i8*, i8*, i32 }** nonnull undef, i64 %.22.0, i64 %.38.0) #1
  %.67 = load i64, i64* %.53, align 8
  %.74 = call i8* @PyLong_FromLongLong(i64 %.67)
  br label %common.ret
}

declare i32 @PyArg_UnpackTuple(i8*, i8*, i64, i64, ...) local_unnamed_addr

declare void @PyErr_SetString(i8*, i8*) local_unnamed_addr

declare i8* @PyNumber_Long(i8*) local_unnamed_addr

declare i64 @PyLong_AsLongLong(i8*) local_unnamed_addr

declare void @Py_DecRef(i8*) local_unnamed_addr

declare i8* @PyErr_Occurred() local_unnamed_addr

declare i8* @PyLong_FromLongLong(i64) local_unnamed_addr

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn writeonly
define i64 @cfunc._ZN8__main__3sumB2v1B38c8tJTIcFKzyF2ILShI4CrgQElQb6HczSBAA_3dExx(i64 %.1, i64 %.2) local_unnamed_addr #0 {
entry:
  %.4 = alloca i64, align 8
  store i64 0, i64* %.4, align 8
  %.8 = call i32 @_ZN8__main__3sumB2v1B38c8tJTIcFKzyF2ILShI4CrgQElQb6HczSBAA_3dExx(i64* nonnull %.4, { i8*, i32, i8*, i8*, i32 }** nonnull undef, i64 %.1, i64 %.2) #1
  %.18 = load i64, i64* %.4, align 8
  ret i64 %.18
}

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn writeonly }
attributes #1 = { noinline }

!0 = !{!"branch_weights", i32 1, i32 99}
!1 = !{!"branch_weights", i32 99, i32 1}
