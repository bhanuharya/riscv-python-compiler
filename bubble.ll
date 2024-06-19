; ModuleID = 'bubble'
source_filename = "<string>"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.const.pickledata.123363732397504 = internal constant [66 x i8] c"\80\04\957\00\00\00\00\00\00\00\8C\08builtins\94\8C\0AIndexError\94\93\94\8C\14getitem out of range\94\85\94N\87\94."
@.const.pickledata.123363732397504.sha1 = internal constant [20 x i8] c"WSA\9F|<\9D\9EA\A5\1CzW,\CE\16$\A3\9A\7F"
@.const.picklebuf.123363732397504 = internal constant { i8*, i32, i8*, i8*, i32 } { i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.const.pickledata.123363732397504, i32 0, i32 0), i32 66, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.const.pickledata.123363732397504.sha1, i32 0, i32 0), i8* null, i32 0 }
@.const.pickledata.123363732504064 = internal constant [66 x i8] c"\80\04\957\00\00\00\00\00\00\00\8C\08builtins\94\8C\0AIndexError\94\93\94\8C\14setitem out of range\94\85\94N\87\94."
@.const.pickledata.123363732504064.sha1 = internal constant [20 x i8] c"\A5\C4N\81\D8\0E~\10\F1\DE\FE\8C\D63\07#\C9d\9E\A2"
@.const.picklebuf.123363732504064 = internal constant { i8*, i32, i8*, i8*, i32 } { i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.const.pickledata.123363732504064, i32 0, i32 0), i32 66, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.const.pickledata.123363732504064.sha1, i32 0, i32 0), i8* null, i32 0 }
@.const.bubble = internal constant [7 x i8] c"bubble\00"
@_ZN08NumbaEnv8__main__6bubbleB2v1B38c8tJTIcFKzyF2ILShI4CrgQElQb6HczSBAA_3dE42reflected_20list_28int64_29_3civ_3dNone_3e = common local_unnamed_addr global i8* null
@".const.missing Environment: _ZN08NumbaEnv8__main__6bubbleB2v1B38c8tJTIcFKzyF2ILShI4CrgQElQb6HczSBAA_3dE42reflected_20list_28int64_29_3civ_3dNone_3e" = internal constant [141 x i8] c"missing Environment: _ZN08NumbaEnv8__main__6bubbleB2v1B38c8tJTIcFKzyF2ILShI4CrgQElQb6HczSBAA_3dE42reflected_20list_28int64_29_3civ_3dNone_3e\00"
@.const.numba = internal constant [6 x i8] c"numba\00"
@.const.typeof = internal constant [7 x i8] c"typeof\00"
@PyExc_TypeError = external global i8
@".const.can't unbox heterogeneous list: %S != %S" = internal constant [41 x i8] c"can't unbox heterogeneous list: %S != %S\00"
@".const.Error creating Python tuple from runtime exception arguments" = internal constant [61 x i8] c"Error creating Python tuple from runtime exception arguments\00"
@".const.unknown error when calling native function" = internal constant [43 x i8] c"unknown error when calling native function\00"
@PyExc_RuntimeError = external global i8
@".const.Error creating Python tuple from runtime exception arguments.1" = internal constant [61 x i8] c"Error creating Python tuple from runtime exception arguments\00"
@PyExc_SystemError = external global i8
@".const.unknown error when calling native function.2" = internal constant [43 x i8] c"unknown error when calling native function\00"
@".const.<numba.core.cpu.CPUContext object at 0x7032db82a5f0>" = internal constant [53 x i8] c"<numba.core.cpu.CPUContext object at 0x7032db82a5f0>\00"

; Function Attrs: nofree norecurse nounwind
define i32 @_ZN8__main__6bubbleB2v1B38c8tJTIcFKzyF2ILShI4CrgQElQb6HczSBAA_3dE42reflected_20list_28int64_29_3civ_3dNone_3e({ i8*, i8* }* noalias nocapture writeonly %retptr, { i8*, i32, i8*, i8*, i32 }** noalias nocapture writeonly %excinfo, i8* %arg.lst.0, i8* %arg.lst.1) local_unnamed_addr #0 {
B0.endif:
  tail call void @NRT_incref(i8* %arg.lst.0)
  %.5.i = getelementptr i8, i8* %arg.lst.0, i64 24
  %0 = bitcast i8* %.5.i to { i64, i64, i8, i64 }**
  %.6.i53 = load { i64, i64, i8, i64 }*, { i64, i64, i8, i64 }** %0, align 8
  %.18155 = bitcast { i64, i64, i8, i64 }* %.6.i53 to i64*
  %.19 = load i64, i64* %.18155, align 8
  %.58 = icmp slt i64 %.19, 2
  %.20 = add nsw i64 %.19, -1
  %.102130.not150 = icmp eq i64 %.20, 0
  %.102130.not = select i1 %.58, i1 true, i1 %.102130.not150
  br i1 %.102130.not, label %B90, label %B20.endif.preheader

B20.endif.preheader:                              ; preds = %B0.endif
  br label %B20.endif

B18.loopexit:                                     ; preds = %B86, %B20.endif
  %exitcond.not = icmp eq i64 %.115, %.20
  br i1 %exitcond.not, label %B90, label %B18.loopexit.B20.endif_crit_edge

B18.loopexit.B20.endif_crit_edge:                 ; preds = %B18.loopexit
  %sunkaddr = getelementptr i8, i8* %arg.lst.0, i64 24
  %1 = bitcast i8* %sunkaddr to { i64, i64, i8, i64 }**
  %.6.i4656.pre = load { i64, i64, i8, i64 }*, { i64, i64, i8, i64 }** %1, align 8
  %.154.phi.trans.insert156 = bitcast { i64, i64, i8, i64 }* %.6.i4656.pre to i64*
  %.155.pre = load i64, i64* %.154.phi.trans.insert156, align 8
  %lsr.iv.next = add nuw nsw i64 %lsr.iv, 1
  br label %B20.endif

B86:                                              ; preds = %B60.endif.endif.endif.endif, %B42.endif.endif
  %.235 = icmp ugt i64 %.23487146, 1
  br i1 %.235, label %B86.B42_crit_edge, label %B18.loopexit

B86.B42_crit_edge:                                ; preds = %B86
  %sunkaddr157 = getelementptr i8, i8* %arg.lst.0, i64 24
  %2 = bitcast i8* %sunkaddr157 to { i64, i64, i8, i64 }**
  %.6.i4458.pre = load { i64, i64, i8, i64 }*, { i64, i64, i8, i64 }** %2, align 8
  %.287.phi.trans.insert158 = bitcast { i64, i64, i8, i64 }* %.6.i4458.pre to i64*
  %.288.pre = load i64, i64* %.287.phi.trans.insert158, align 8
  %.298.not = icmp slt i64 %.44.0131, %.288.pre
  %lsr.iv.next154 = add i64 %lsr.iv153, 1
  %.244148 = add nsw i64 %.23487146, -1
  br i1 %.298.not, label %B42.endif, label %B42.if, !prof !1

common.ret:                                       ; preds = %B60.endif.endif.endif.if, %B42.endif.if, %B42.if, %B90
  %common.ret.op = phi i32 [ 0, %B90 ], [ 1, %B42.if ], [ 1, %B42.endif.if ], [ 1, %B60.endif.endif.endif.if ]
  ret i32 %common.ret.op

B90:                                              ; preds = %B18.loopexit, %B0.endif
  %retptr.repack159 = bitcast { i8*, i8* }* %retptr to i8**
  store i8* %arg.lst.0, i8** %retptr.repack159, align 8
  %retptr.repack54 = getelementptr inbounds { i8*, i8* }, { i8*, i8* }* %retptr, i64 0, i32 1
  store i8* %arg.lst.1, i8** %retptr.repack54, align 8
  br label %common.ret

B20.endif:                                        ; preds = %B20.endif.preheader, %B18.loopexit.B20.endif_crit_edge
  %lsr.iv = phi i64 [ 1, %B20.endif.preheader ], [ %lsr.iv.next, %B18.loopexit.B20.endif_crit_edge ]
  %.155 = phi i64 [ %.155.pre, %B18.loopexit.B20.endif_crit_edge ], [ %.19, %B20.endif.preheader ]
  %.6.i4656 = phi { i64, i64, i8, i64 }* [ %.6.i4656.pre, %B18.loopexit.B20.endif_crit_edge ], [ %.6.i53, %B20.endif.preheader ]
  %.44.0131 = phi i64 [ %.115, %B18.loopexit.B20.endif_crit_edge ], [ 0, %B20.endif.preheader ]
  %.115 = add nuw nsw i64 %.44.0131, 1
  %.192 = sub i64 %.155, %.115
  %.193.inv = icmp sgt i64 %.192, 0
  br i1 %.193.inv, label %B42.preheader, label %B18.loopexit

B42.preheader:                                    ; preds = %B20.endif
  %.298.not143 = icmp slt i64 %.44.0131, %.155
  br i1 %.298.not143, label %B42.endif.lr.ph, label %B42.if, !prof !1

B42.endif.lr.ph:                                  ; preds = %B42.preheader
  br label %B42.endif

B42.if:                                           ; preds = %B42.preheader, %B86.B42_crit_edge
  store { i8*, i32, i8*, i8*, i32 }* @.const.picklebuf.123363732397504, { i8*, i32, i8*, i8*, i32 }** %excinfo, align 8, !numba_exception_output !2
  br label %common.ret

B42.endif:                                        ; preds = %B42.endif.lr.ph, %B86.B42_crit_edge
  %lsr.iv153 = phi i64 [ %lsr.iv, %B42.endif.lr.ph ], [ %lsr.iv.next154, %B86.B42_crit_edge ]
  %.23487146 = phi i64 [ %.192, %B42.endif.lr.ph ], [ %.244148, %B86.B42_crit_edge ]
  %.6.i4458145 = phi { i64, i64, i8, i64 }* [ %.6.i4656, %B42.endif.lr.ph ], [ %.6.i4458.pre, %B86.B42_crit_edge ]
  %.288144 = phi i64 [ %.155, %B42.endif.lr.ph ], [ %.288.pre, %B86.B42_crit_edge ]
  %.319 = icmp slt i64 %lsr.iv153, 0
  %.326 = select i1 %.319, i64 %.288144, i64 0
  %3 = add i64 %.326, %lsr.iv153
  %.328 = icmp slt i64 %3, 0
  %.335 = icmp sge i64 %3, %.288144
  %.336 = or i1 %.328, %.335
  br i1 %.336, label %B42.endif.if, label %B42.endif.endif, !prof !3

B42.endif.if:                                     ; preds = %B42.endif
  store { i8*, i32, i8*, i8*, i32 }* @.const.picklebuf.123363732397504, { i8*, i32, i8*, i8*, i32 }** %excinfo, align 8, !numba_exception_output !2
  br label %common.ret

B42.endif.endif:                                  ; preds = %B42.endif
  %.310 = getelementptr inbounds { i64, i64, i8, i64 }, { i64, i64, i8, i64 }* %.6.i4458145, i64 0, i32 3
  %.311 = getelementptr i64, i64* %.310, i64 %.44.0131
  %.312 = load i64, i64* %.311, align 8
  %.348 = getelementptr i64, i64* %.310, i64 %3
  %.349 = load i64, i64* %.348, align 8
  %.350 = icmp sgt i64 %.312, %.349
  br i1 %.350, label %B60.endif.endif.endif, label %B86

B60.endif.endif.endif:                            ; preds = %B42.endif.endif
  %4 = icmp slt i64 %lsr.iv153, 0
  %sunkaddr160 = mul i64 %.44.0131, 8
  %5 = bitcast { i64, i64, i8, i64 }* %.6.i4458145 to i8*
  %sunkaddr161 = getelementptr i8, i8* %5, i64 %sunkaddr160
  %sunkaddr162 = getelementptr i8, i8* %sunkaddr161, i64 24
  %6 = bitcast i8* %sunkaddr162 to i64*
  store i64 %.349, i64* %6, align 8
  %sunkaddr163 = getelementptr i8, i8* %arg.lst.0, i64 24
  %7 = bitcast i8* %sunkaddr163 to { i64, i64, i8, i64 }**
  %.6.i1273 = load { i64, i64, i8, i64 }*, { i64, i64, i8, i64 }** %7, align 8
  %.474 = getelementptr inbounds { i64, i64, i8, i64 }, { i64, i64, i8, i64 }* %.6.i1273, i64 0, i32 2
  store i8 1, i8* %.474, align 1
  %.6.i1074 = load { i64, i64, i8, i64 }*, { i64, i64, i8, i64 }** %7, align 8
  %.488164 = bitcast { i64, i64, i8, i64 }* %.6.i1074 to i64*
  %.489 = load i64, i64* %.488164, align 8
  %.490 = select i1 %4, i64 %.489, i64 0
  %8 = add i64 %.490, %lsr.iv153
  %.492 = icmp slt i64 %8, 0
  %.499 = icmp sge i64 %8, %.489
  %.500 = or i1 %.492, %.499
  br i1 %.500, label %B60.endif.endif.endif.if, label %B60.endif.endif.endif.endif, !prof !3

B60.endif.endif.endif.if:                         ; preds = %B60.endif.endif.endif
  store { i8*, i32, i8*, i8*, i32 }* @.const.picklebuf.123363732504064, { i8*, i32, i8*, i8*, i32 }** %excinfo, align 8, !numba_exception_output !2
  br label %common.ret

B60.endif.endif.endif.endif:                      ; preds = %B60.endif.endif.endif
  %.518 = getelementptr inbounds { i64, i64, i8, i64 }, { i64, i64, i8, i64 }* %.6.i1074, i64 0, i32 3
  %.519 = getelementptr i64, i64* %.518, i64 %8
  store i64 %.312, i64* %.519, align 8
  %sunkaddr165 = getelementptr i8, i8* %arg.lst.0, i64 24
  %9 = bitcast i8* %sunkaddr165 to { i64, i64, i8, i64 }**
  %.6.i277 = load { i64, i64, i8, i64 }*, { i64, i64, i8, i64 }** %9, align 8
  %.525 = getelementptr inbounds { i64, i64, i8, i64 }, { i64, i64, i8, i64 }* %.6.i277, i64 0, i32 2
  store i8 1, i8* %.525, align 1
  br label %B86
}

define i8* @_ZN7cpython8__main__6bubbleB2v1B38c8tJTIcFKzyF2ILShI4CrgQElQb6HczSBAA_3dE42reflected_20list_28int64_29_3civ_3dNone_3e(i8* nocapture readnone %py_closure, i8* %py_args, i8* nocapture readnone %py_kws) local_unnamed_addr {
entry:
  %.5 = alloca i8*, align 8
  %.6 = call i32 (i8*, i8*, i64, i64, ...) @PyArg_UnpackTuple(i8* %py_args, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.const.bubble, i64 0, i64 0), i64 1, i64 1, i8** nonnull %.5)
  %.7 = icmp eq i32 %.6, 0
  %.331 = alloca { i8*, i8* }, align 8
  %excinfo = alloca { i8*, i32, i8*, i8*, i32 }*, align 8
  store { i8*, i32, i8*, i8*, i32 }* null, { i8*, i32, i8*, i8*, i32 }** %excinfo, align 8
  br i1 %.7, label %common.ret, label %entry.endif, !prof !3

common.ret:                                       ; preds = %entry.endif.endif.endif, %entry.endif.endif.endif.endif.endif.endif.endif.if.endif, %entry.endif.endif.endif.e...if.2, %entry.endif.endif.endif.e...endif.3.endif, %entry, %entry.endif.endif.endif.e...if.1, %entry.endif.endif.endif.endif.endif.endif.if.endif.endif, %entry.endif.if
  %common.ret.op = phi i8* [ null, %entry.endif.if ], [ %.463.0, %entry.endif.endif.endif.endif.endif.endif.if.endif.endif ], [ null, %entry.endif.endif.endif.e...if.1 ], [ null, %entry ], [ null, %entry.endif.endif.endif ], [ null, %entry.endif.endif.endif.e...endif.3.endif ], [ null, %entry.endif.endif.endif.e...if.2 ], [ null, %entry.endif.endif.endif.endif.endif.endif.endif.if.endif ]
  ret i8* %common.ret.op

entry.endif:                                      ; preds = %entry
  %.11 = load i8*, i8** @_ZN08NumbaEnv8__main__6bubbleB2v1B38c8tJTIcFKzyF2ILShI4CrgQElQb6HczSBAA_3dE42reflected_20list_28int64_29_3civ_3dNone_3e, align 8
  %.16 = icmp eq i8* %.11, null
  br i1 %.16, label %entry.endif.if, label %entry.endif.endif, !prof !3

entry.endif.if:                                   ; preds = %entry.endif
  call void @PyErr_SetString(i8* nonnull @PyExc_RuntimeError, i8* getelementptr inbounds ([141 x i8], [141 x i8]* @".const.missing Environment: _ZN08NumbaEnv8__main__6bubbleB2v1B38c8tJTIcFKzyF2ILShI4CrgQElQb6HczSBAA_3dE42reflected_20list_28int64_29_3civ_3dNone_3e", i64 0, i64 0))
  br label %common.ret

entry.endif.endif:                                ; preds = %entry.endif
  %.20 = load i8*, i8** %.5, align 8
  %.21 = call i64 @PyList_Size(i8* %.20)
  %.27 = call i8* @numba_get_pyobject_private_data(i8* %.20)
  %.28.not = icmp eq i8* %.27, null
  br i1 %.28.not, label %entry.endif.endif.else, label %entry.endif.endif.if

entry.endif.endif.if:                             ; preds = %entry.endif.endif
  call void @NRT_incref(i8* nonnull %.27)
  %.5.i = getelementptr i8, i8* %.27, i64 24
  %0 = bitcast i8* %.5.i to { i64, i64, i8, i64 }**
  %.6.i70 = load { i64, i64, i8, i64 }*, { i64, i64, i8, i64 }** %0, align 8
  %.43134 = bitcast { i64, i64, i8, i64 }* %.6.i70 to i64*
  store i64 %.21, i64* %.43134, align 8
  br label %entry.endif.endif.endif.endif

entry.endif.endif.else:                           ; preds = %entry.endif.endif
  %.56 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %.21, i64 8)
  %.57 = extractvalue { i64, i1 } %.56, 0
  %.59 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %.57, i64 24)
  %.58 = extractvalue { i64, i1 } %.56, 1
  %.61 = extractvalue { i64, i1 } %.59, 1
  %.62 = or i1 %.58, %.61
  br i1 %.62, label %entry.endif.endif.endif, label %entry.endif.endif.else.endif.if, !prof !3

entry.endif.endif.endif:                          ; preds = %entry.endif.endif.else.endif.if, %entry.endif.endif.else, %entry.endif.endif.else.endif.endif.endif.thread86
  %.53.sroa.0.07985 = phi i8* [ %.69, %entry.endif.endif.else.endif.endif.endif.thread86 ], [ null, %entry.endif.endif.else ], [ null, %entry.endif.endif.else.endif.if ]
  call void @NRT_decref(i8* %.53.sroa.0.07985)
  br label %common.ret

entry.endif.endif.else.endif.if:                  ; preds = %entry.endif.endif.else
  %.60 = extractvalue { i64, i1 } %.59, 0
  %.69 = call i8* @NRT_MemInfo_new_varsize_dtor(i64 %.60, i8* bitcast (void (i8*)* @.dtor.list.int64 to i8*))
  %.70 = icmp eq i8* %.69, null
  br i1 %.70, label %entry.endif.endif.endif, label %entry.endif.endif.else.endif.endif.if, !prof !3

entry.endif.endif.else.endif.endif.if:            ; preds = %entry.endif.endif.else.endif.if
  %.5.i1 = getelementptr i8, i8* %.69, i64 24
  %1 = bitcast i8* %.5.i1 to { i64, i64, i8, i64 }**
  %.6.i265 = load { i64, i64, i8, i64 }*, { i64, i64, i8, i64 }** %1, align 8
  %.82 = getelementptr inbounds { i64, i64, i8, i64 }, { i64, i64, i8, i64 }* %.6.i265, i64 0, i32 1
  store i64 %.21, i64* %.82, align 8
  %.6.i666 = load { i64, i64, i8, i64 }*, { i64, i64, i8, i64 }** %1, align 8
  %.88135 = bitcast { i64, i64, i8, i64 }* %.6.i666 to i64*
  store i64 0, i64* %.88135, align 8
  %.6.i1867 = load { i64, i64, i8, i64 }*, { i64, i64, i8, i64 }** %1, align 8
  %.94 = getelementptr inbounds { i64, i64, i8, i64 }, { i64, i64, i8, i64 }* %.6.i1867, i64 0, i32 2
  store i8 0, i8* %.94, align 1
  %.6.i2668 = load { i64, i64, i8, i64 }*, { i64, i64, i8, i64 }** %1, align 8
  %.107 = getelementptr inbounds { i64, i64, i8, i64 }, { i64, i64, i8, i64 }* %.6.i2668, i64 0, i32 3
  %.114.idx = shl nsw i64 %.21, 3
  %.118 = bitcast i64* %.107 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 %.118, i8 0, i64 %.114.idx, i1 false)
  %.6.i3661 = load { i64, i64, i8, i64 }*, { i64, i64, i8, i64 }** %1, align 8
  %.128136 = bitcast { i64, i64, i8, i64 }* %.6.i3661 to i64*
  store i64 %.21, i64* %.128136, align 8
  %.130 = icmp sgt i64 %.21, 0
  br i1 %.130, label %for.body.lr.ph, label %entry.endif.endif.else.endif.endif.endif, !prof !1

entry.endif.endif.else.endif.endif.endif.critedge: ; preds = %for.body.endif.endif.endif.endif
  call void @Py_DecRef(i8* %.136)
  call void @Py_DecRef(i8* %.133)
  br label %entry.endif.endif.else.endif.endif.endif

entry.endif.endif.else.endif.endif.endif:         ; preds = %entry.endif.endif.else.endif.endif.endif.critedge, %entry.endif.endif.else.endif.endif.if
  %2 = bitcast i8* %.5.i1 to { i64, i64, i8, i64 }**
  call void @numba_set_pyobject_private_data(i8* %.20, i8* nonnull %.69)
  %sunkaddr = getelementptr i8, i8* %.69, i64 24
  %3 = bitcast i8* %sunkaddr to { i64, i64, i8, i64 }**
  %.6.i2862 = load { i64, i64, i8, i64 }*, { i64, i64, i8, i64 }** %3, align 8
  %.207 = getelementptr inbounds { i64, i64, i8, i64 }, { i64, i64, i8, i64 }* %.6.i2862, i64 0, i32 2
  store i8 0, i8* %.207, align 1
  br label %entry.endif.endif.endif.endif

for.body.lr.ph:                                   ; preds = %entry.endif.endif.else.endif.endif.if
  %.132 = call i8* @PyImport_ImportModuleNoBlock(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.const.numba, i64 0, i64 0))
  %.133 = call i8* @PyObject_GetAttrString(i8* %.132, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.const.typeof, i64 0, i64 0))
  call void @Py_DecRef(i8* %.132)
  %.135 = call i8* @PyList_GetItem(i8* %.20, i64 0)
  %.136 = call i8* (i8*, ...) @PyObject_CallFunctionObjArgs(i8* %.133, i8* %.135, i8* null)
  br label %for.body

entry.endif.endif.else.endif.endif.endif.thread86: ; preds = %for.body, %for.body.endif.endif.endif, %for.body.endif.if
  %4 = bitcast i8* %.5.i1 to { i64, i64, i8, i64 }**
  call void @Py_DecRef(i8* %.136)
  call void @Py_DecRef(i8* %.133)
  %.6.i286289 = load { i64, i64, i8, i64 }*, { i64, i64, i8, i64 }** %4, align 8
  %.20790 = getelementptr inbounds { i64, i64, i8, i64 }, { i64, i64, i8, i64 }* %.6.i286289, i64 0, i32 2
  store i8 0, i8* %.20790, align 1
  br label %entry.endif.endif.endif

for.body:                                         ; preds = %for.body.lr.ph, %for.body.endif.endif.endif.endif
  %loop.index52 = phi i64 [ 0, %for.body.lr.ph ], [ %.189, %for.body.endif.endif.endif.endif ]
  %.153.051 = phi i64 [ 0, %for.body.lr.ph ], [ %.153.1, %for.body.endif.endif.endif.endif ]
  %.140 = call i8* @PyList_GetItem(i8* %.20, i64 %loop.index52)
  %.141 = call i8* (i8*, ...) @PyObject_CallFunctionObjArgs(i8* %.133, i8* %.140, i8* null)
  %.142 = icmp eq i8* %.141, null
  br i1 %.142, label %entry.endif.endif.else.endif.endif.endif.thread86, label %for.body.endif, !prof !3

for.body.endif:                                   ; preds = %for.body
  %.146.not = icmp eq i8* %.141, %.136
  br i1 %.146.not, label %for.body.endif.endif, label %for.body.endif.if, !prof !1

for.body.endif.if:                                ; preds = %for.body.endif
  call void (i8*, i8*, ...) @PyErr_Format(i8* nonnull @PyExc_TypeError, i8* getelementptr inbounds ([41 x i8], [41 x i8]* @".const.can't unbox heterogeneous list: %S != %S", i64 0, i64 0), i8* %.136, i8* nonnull %.141)
  call void @Py_DecRef(i8* nonnull %.141)
  br label %entry.endif.endif.else.endif.endif.endif.thread86

for.body.endif.endif:                             ; preds = %for.body.endif
  call void @Py_DecRef(i8* nonnull %.136)
  %.155 = call i8* @PyNumber_Long(i8* %.140)
  %.156.not = icmp eq i8* %.155, null
  br i1 %.156.not, label %for.body.endif.endif.endif, label %for.body.endif.endif.if, !prof !3

for.body.endif.endif.if:                          ; preds = %for.body.endif.endif
  %.158 = call i64 @PyLong_AsLongLong(i8* nonnull %.155)
  call void @Py_DecRef(i8* nonnull %.155)
  br label %for.body.endif.endif.endif

for.body.endif.endif.endif:                       ; preds = %for.body.endif.endif.if, %for.body.endif.endif
  %.153.1 = phi i64 [ %.158, %for.body.endif.endif.if ], [ %.153.051, %for.body.endif.endif ]
  %.163 = call i8* @PyErr_Occurred()
  %.164.not = icmp eq i8* %.163, null
  br i1 %.164.not, label %for.body.endif.endif.endif.endif, label %entry.endif.endif.else.endif.endif.endif.thread86, !prof !1

for.body.endif.endif.endif.endif:                 ; preds = %for.body.endif.endif.endif
  %5 = bitcast i8* %.5.i1 to { i64, i64, i8, i64 }**
  %.6.i3263 = load { i64, i64, i8, i64 }*, { i64, i64, i8, i64 }** %5, align 8
  %scevgep131 = getelementptr { i64, i64, i8, i64 }, { i64, i64, i8, i64 }* %.6.i3263, i64 0, i32 3
  %scevgep132 = getelementptr i64, i64* %scevgep131, i64 %loop.index52
  store i64 %.153.1, i64* %scevgep132, align 8
  %.6.i3064 = load { i64, i64, i8, i64 }*, { i64, i64, i8, i64 }** %5, align 8
  %.186 = getelementptr inbounds { i64, i64, i8, i64 }, { i64, i64, i8, i64 }* %.6.i3064, i64 0, i32 2
  store i8 1, i8* %.186, align 1
  %.189 = add nuw nsw i64 %loop.index52, 1
  %exitcond101.not = icmp eq i64 %.21, %.189
  br i1 %exitcond101.not, label %entry.endif.endif.else.endif.endif.endif.critedge, label %for.body, !prof !4

entry.endif.endif.endif.endif:                    ; preds = %entry.endif.endif.if, %entry.endif.endif.else.endif.endif.endif
  %.pre-phi = phi { i64, i64, i8, i64 }** [ %0, %entry.endif.endif.if ], [ %2, %entry.endif.endif.else.endif.endif.endif ]
  %.25.sroa.0.0.ph = phi i8* [ %.27, %entry.endif.endif.if ], [ %.69, %entry.endif.endif.else.endif.endif.endif ]
  %6 = bitcast { i8*, i8* }* %.331 to i8**
  %7 = bitcast { i8*, i8* }* %.331 to i8*
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(16) %7, i8 0, i64 16, i1 false)
  %.335 = call i32 @_ZN8__main__6bubbleB2v1B38c8tJTIcFKzyF2ILShI4CrgQElQb6HczSBAA_3dE42reflected_20list_28int64_29_3civ_3dNone_3e({ i8*, i8* }* nonnull %.331, { i8*, i32, i8*, i8*, i32 }** nonnull %excinfo, i8* nonnull %.25.sroa.0.0.ph, i8* %.20) #4
  %.336 = load { i8*, i32, i8*, i8*, i32 }*, { i8*, i32, i8*, i8*, i32 }** %excinfo, align 8
  %.343 = icmp sgt i32 %.335, 0
  %.344 = select i1 %.343, { i8*, i32, i8*, i8*, i32 }* %.336, { i8*, i32, i8*, i8*, i32 }* undef
  %.345.fca.0.load = load i8*, i8** %6, align 8
  %8 = bitcast { i8*, i8* }* %.331 to i8*
  %sunkaddr137 = getelementptr inbounds i8, i8* %8, i64 8
  %9 = bitcast i8* %sunkaddr137 to i8**
  %.345.fca.1.load = load i8*, i8** %9, align 8
  %sunkaddr138 = getelementptr i8, i8* %.25.sroa.0.0.ph, i64 24
  %10 = bitcast i8* %sunkaddr138 to { i64, i64, i8, i64 }**
  %.6.i2253 = load { i64, i64, i8, i64 }*, { i64, i64, i8, i64 }** %10, align 8
  %.359 = getelementptr inbounds { i64, i64, i8, i64 }, { i64, i64, i8, i64 }* %.6.i2253, i64 0, i32 2
  %.360 = load i8, i8* %.359, align 1
  %.363 = icmp eq i8 %.360, 0
  br i1 %.363, label %entry.endif.endif.endif.endif.endif.endif, label %entry.endif.endif.endif.endif.endif.if, !prof !1

entry.endif.endif.endif.endif.endif.if:           ; preds = %entry.endif.endif.endif.endif
  %.373 = call i64 @PyList_Size(i8* %.20)
  %.6.i2056 = load { i64, i64, i8, i64 }*, { i64, i64, i8, i64 }** %.pre-phi, align 8
  %.378139 = bitcast { i64, i64, i8, i64 }* %.6.i2056 to i64*
  %.379 = load i64, i64* %.378139, align 8
  %.380 = sub i64 %.379, %.373
  %.381 = icmp sgt i64 %.380, -1
  br i1 %.381, label %for.cond.4.preheader, label %entry.endif.endif.endif.endif.endif.if.else

for.cond.4.preheader:                             ; preds = %entry.endif.endif.endif.endif.endif.if
  %.38446 = icmp sgt i64 %.373, 0
  br i1 %.38446, label %for.body.4.preheader, label %for.cond.5.preheader

for.body.4.preheader:                             ; preds = %for.cond.4.preheader
  %.390109 = getelementptr inbounds { i64, i64, i8, i64 }, { i64, i64, i8, i64 }* %.6.i2056, i64 0, i32 3
  %.392110 = load i64, i64* %.390109, align 8
  %.395111 = call i8* @PyLong_FromLongLong(i64 %.392110)
  %.398112 = call i32 @PyList_SetItem(i8* %.20, i64 0, i8* %.395111)
  %exitcond99.not113 = icmp eq i64 %.373, 1
  br i1 %exitcond99.not113, label %for.cond.5.preheader, label %for.body.4.for.body.4_crit_edge.preheader

for.body.4.for.body.4_crit_edge.preheader:        ; preds = %for.body.4.preheader
  %11 = add i64 %.373, -1
  br label %for.body.4.for.body.4_crit_edge

entry.endif.endif.endif.endif.endif.endif:        ; preds = %entry.endif.endif.endif.endif.endif.if.endif, %entry.endif.endif.endif.endif
  call void @numba_reset_pyobject_private_data(i8* %.20)
  call void @NRT_decref(i8* nonnull %.25.sroa.0.0.ph)
  switch i32 %.335, label %entry.endif.endif.endif.endif.endif.endif.endif [
    i32 -2, label %entry.endif.endif.endif.endif.endif.endif.if.endif
    i32 0, label %entry.endif.endif.endif.endif.endif.endif.if.endif
  ]

entry.endif.endif.endif.endif.endif.if.else:      ; preds = %entry.endif.endif.endif.endif.endif.if
  %.422 = call i32 @PyList_SetSlice(i8* %.20, i64 %.379, i64 %.373, i8* null)
  %.42448 = icmp sgt i64 %.379, 0
  br i1 %.42448, label %for.body.6.preheader, label %entry.endif.endif.endif.endif.endif.if.endif

for.body.6.preheader:                             ; preds = %entry.endif.endif.endif.endif.endif.if.else
  br label %for.body.6

entry.endif.endif.endif.endif.endif.if.endif:     ; preds = %for.body.6, %for.body.5, %entry.endif.endif.endif.endif.endif.if.else, %for.cond.5.preheader
  %.6.i1657 = load { i64, i64, i8, i64 }*, { i64, i64, i8, i64 }** %.pre-phi, align 8
  %.446 = getelementptr inbounds { i64, i64, i8, i64 }, { i64, i64, i8, i64 }* %.6.i1657, i64 0, i32 2
  store i8 0, i8* %.446, align 1
  br label %entry.endif.endif.endif.endif.endif.endif

for.cond.5.preheader:                             ; preds = %for.body.4.for.body.4_crit_edge, %for.body.4.preheader, %for.cond.4.preheader
  %.40244 = icmp sgt i64 %.380, 0
  br i1 %.40244, label %for.body.5.preheader, label %entry.endif.endif.endif.endif.endif.if.endif

for.body.5.preheader:                             ; preds = %for.cond.5.preheader
  br label %for.body.5

for.body.4.for.body.4_crit_edge:                  ; preds = %for.body.4.for.body.4_crit_edge.preheader, %for.body.4.for.body.4_crit_edge
  %lsr.iv124 = phi i64 [ 0, %for.body.4.for.body.4_crit_edge.preheader ], [ %lsr.iv.next125, %for.body.4.for.body.4_crit_edge ]
  %12 = add i64 %lsr.iv124, 1
  %.6.i1460.pre = load { i64, i64, i8, i64 }*, { i64, i64, i8, i64 }** %.pre-phi, align 8
  %scevgep126 = getelementptr { i64, i64, i8, i64 }, { i64, i64, i8, i64 }* %.6.i1460.pre, i64 1
  %scevgep126127 = bitcast { i64, i64, i8, i64 }* %scevgep126 to i8*
  %13 = shl i64 %lsr.iv124, 3
  %uglygep = getelementptr i8, i8* %scevgep126127, i64 %13
  %uglygep128 = bitcast i8* %uglygep to i64*
  %.392 = load i64, i64* %uglygep128, align 8
  %.395 = call i8* @PyLong_FromLongLong(i64 %.392)
  %.398 = call i32 @PyList_SetItem(i8* %.20, i64 %12, i8* %.395)
  %lsr.iv.next125 = add nuw nsw i64 %lsr.iv124, 1
  %exitcond99.not = icmp eq i64 %11, %lsr.iv.next125
  br i1 %exitcond99.not, label %for.cond.5.preheader, label %for.body.4.for.body.4_crit_edge

for.body.5:                                       ; preds = %for.body.5.preheader, %for.body.5
  %lsr.iv = phi i64 [ %.373, %for.body.5.preheader ], [ %lsr.iv.next, %for.body.5 ]
  %.6.i1259 = load { i64, i64, i8, i64 }*, { i64, i64, i8, i64 }** %.pre-phi, align 8
  %scevgep122 = getelementptr { i64, i64, i8, i64 }, { i64, i64, i8, i64 }* %.6.i1259, i64 0, i32 3
  %scevgep123 = getelementptr i64, i64* %scevgep122, i64 %lsr.iv
  %.411 = load i64, i64* %scevgep123, align 8
  %.414 = call i8* @PyLong_FromLongLong(i64 %.411)
  %.417 = call i32 @PyList_Append(i8* %.20, i8* %.414)
  call void @Py_DecRef(i8* %.414)
  %lsr.iv.next = add i64 %lsr.iv, 1
  %exitcond98.not = icmp eq i64 %.379, %lsr.iv.next
  br i1 %exitcond98.not, label %entry.endif.endif.endif.endif.endif.if.endif, label %for.body.5

for.body.6:                                       ; preds = %for.body.6.preheader, %for.body.6
  %loop.index.649 = phi i64 [ %.439, %for.body.6 ], [ 0, %for.body.6.preheader ]
  %.6.i1058 = load { i64, i64, i8, i64 }*, { i64, i64, i8, i64 }** %.pre-phi, align 8
  %scevgep129 = getelementptr { i64, i64, i8, i64 }, { i64, i64, i8, i64 }* %.6.i1058, i64 0, i32 3
  %scevgep130 = getelementptr i64, i64* %scevgep129, i64 %loop.index.649
  %.432 = load i64, i64* %scevgep130, align 8
  %.435 = call i8* @PyLong_FromLongLong(i64 %.432)
  %.438 = call i32 @PyList_SetItem(i8* %.20, i64 %loop.index.649, i8* %.435)
  %.439 = add nuw nsw i64 %loop.index.649, 1
  %exitcond100.not = icmp eq i64 %.379, %.439
  br i1 %exitcond100.not, label %entry.endif.endif.endif.endif.endif.if.endif, label %for.body.6

entry.endif.endif.endif.endif.endif.endif.endif:  ; preds = %entry.endif.endif.endif.endif.endif.endif
  %14 = icmp sgt i32 %.335, 0
  br i1 %14, label %entry.endif.endif.endif.endif.endif.endif.endif.if, label %entry.endif.endif.endif.e...endif.3.endif

entry.endif.endif.endif.endif.endif.endif.if.endif: ; preds = %entry.endif.endif.endif.endif.endif.endif, %entry.endif.endif.endif.endif.endif.endif
  %.466.not = icmp eq i8* %.345.fca.1.load, null
  br i1 %.466.not, label %entry.endif.endif.endif.endif.endif.endif.if.endif.else, label %entry.endif.endif.endif.endif.endif.endif.if.endif.if

entry.endif.endif.endif.endif.endif.endif.if.endif.if: ; preds = %entry.endif.endif.endif.endif.endif.endif.if.endif
  call void @Py_IncRef(i8* nonnull %.345.fca.1.load)
  br label %entry.endif.endif.endif.endif.endif.endif.if.endif.endif

entry.endif.endif.endif.endif.endif.endif.if.endif.else: ; preds = %entry.endif.endif.endif.endif.endif.endif.if.endif
  %.5.i7 = getelementptr i8, i8* %.345.fca.0.load, i64 24
  %15 = bitcast i8* %.5.i7 to { i64, i64, i8, i64 }**
  %.6.i854 = load { i64, i64, i8, i64 }*, { i64, i64, i8, i64 }** %15, align 8
  %.474140 = bitcast { i64, i64, i8, i64 }* %.6.i854 to i64*
  %.475 = load i64, i64* %.474140, align 8
  %.476 = call i8* @PyList_New(i64 %.475)
  %.477.not = icmp eq i8* %.476, null
  br i1 %.477.not, label %entry.endif.endif.endif.endif.endif.endif.if.endif.endif, label %for.cond.7.preheader, !prof !3

for.cond.7.preheader:                             ; preds = %entry.endif.endif.endif.endif.endif.endif.if.endif.else
  %.48042 = icmp sgt i64 %.475, 0
  br i1 %.48042, label %for.body.7.preheader, label %entry.endif.endif.endif.endif.endif.endif.if.endif.endif

for.body.7.preheader:                             ; preds = %for.cond.7.preheader
  br label %for.body.7

entry.endif.endif.endif.endif.endif.endif.if.endif.endif: ; preds = %for.body.7, %entry.endif.endif.endif.endif.endif.endif.if.endif.else, %for.cond.7.preheader, %entry.endif.endif.endif.endif.endif.endif.if.endif.if
  %.463.0 = phi i8* [ %.345.fca.1.load, %entry.endif.endif.endif.endif.endif.endif.if.endif.if ], [ %.476, %for.cond.7.preheader ], [ null, %entry.endif.endif.endif.endif.endif.endif.if.endif.else ], [ %.476, %for.body.7 ]
  call void @NRT_decref(i8* %.345.fca.0.load)
  br label %common.ret

for.body.7:                                       ; preds = %for.body.7.preheader, %for.body.7
  %loop.index.743 = phi i64 [ %.495, %for.body.7 ], [ 0, %for.body.7.preheader ]
  %sunkaddr141 = getelementptr i8, i8* %.345.fca.0.load, i64 24
  %16 = bitcast i8* %sunkaddr141 to { i64, i64, i8, i64 }**
  %.6.i455 = load { i64, i64, i8, i64 }*, { i64, i64, i8, i64 }** %16, align 8
  %scevgep = getelementptr { i64, i64, i8, i64 }, { i64, i64, i8, i64 }* %.6.i455, i64 0, i32 3
  %scevgep121 = getelementptr i64, i64* %scevgep, i64 %loop.index.743
  %.488 = load i64, i64* %scevgep121, align 8
  %.491 = call i8* @PyLong_FromLongLong(i64 %.488)
  %.494 = call i32 @PyList_SetItem(i8* nonnull %.476, i64 %loop.index.743, i8* %.491)
  %.495 = add nuw nsw i64 %loop.index.743, 1
  %exitcond.not = icmp eq i64 %.475, %.495
  br i1 %exitcond.not, label %entry.endif.endif.endif.endif.endif.endif.if.endif.endif, label %for.body.7

entry.endif.endif.endif.endif.endif.endif.endif.if: ; preds = %entry.endif.endif.endif.endif.endif.endif.endif
  call void @PyErr_Clear()
  %.506 = load { i8*, i32, i8*, i8*, i32 }, { i8*, i32, i8*, i8*, i32 }* %.344, align 8
  %.507 = extractvalue { i8*, i32, i8*, i8*, i32 } %.506, 4
  %.508 = icmp sgt i32 %.507, 0
  %.511 = extractvalue { i8*, i32, i8*, i8*, i32 } %.506, 0
  %.513 = extractvalue { i8*, i32, i8*, i8*, i32 } %.506, 1
  br i1 %.508, label %entry.endif.endif.endif.endif.endif.endif.endif.if.if, label %entry.endif.endif.endif.endif.endif.endif.endif.if.else

entry.endif.endif.endif.endif.endif.endif.endif.if.if: ; preds = %entry.endif.endif.endif.endif.endif.endif.endif.if
  %.514 = sext i32 %.513 to i64
  %.515 = call i8* @PyBytes_FromStringAndSize(i8* %.511, i64 %.514)
  %.516 = load { i8*, i32, i8*, i8*, i32 }, { i8*, i32, i8*, i8*, i32 }* %.344, align 8
  %.517 = extractvalue { i8*, i32, i8*, i8*, i32 } %.516, 2
  %.519 = extractvalue { i8*, i32, i8*, i8*, i32 } %.516, 3
  %.520 = bitcast i8* %.519 to i8* (i8*)*
  %.521 = call i8* %.520(i8* %.517)
  %.522 = icmp eq i8* %.521, null
  br i1 %.522, label %entry.endif.endif.endif.e...if.1, label %entry.endif.endif.endif.e...endif.1, !prof !3

entry.endif.endif.endif.endif.endif.endif.endif.if.else: ; preds = %entry.endif.endif.endif.endif.endif.endif.endif.if
  %.535 = extractvalue { i8*, i32, i8*, i8*, i32 } %.506, 2
  %.536 = call i8* @numba_unpickle(i8* %.511, i32 %.513, i8* %.535)
  br label %entry.endif.endif.endif.endif.endif.endif.endif.if.endif

entry.endif.endif.endif.endif.endif.endif.endif.if.endif: ; preds = %entry.endif.endif.endif.e...endif.1, %entry.endif.endif.endif.endif.endif.endif.endif.if.else
  %.538 = phi i8* [ %.526, %entry.endif.endif.endif.e...endif.1 ], [ %.536, %entry.endif.endif.endif.endif.endif.endif.endif.if.else ]
  %.539.not = icmp eq i8* %.538, null
  br i1 %.539.not, label %common.ret, label %entry.endif.endif.endif.e...if.2, !prof !3

entry.endif.endif.endif.e...if.1:                 ; preds = %entry.endif.endif.endif.endif.endif.endif.endif.if.if
  call void @PyErr_SetString(i8* nonnull @PyExc_RuntimeError, i8* getelementptr inbounds ([61 x i8], [61 x i8]* @".const.Error creating Python tuple from runtime exception arguments", i64 0, i64 0))
  br label %common.ret

entry.endif.endif.endif.e...endif.1:              ; preds = %entry.endif.endif.endif.endif.endif.endif.endif.if.if
  %.526 = call i8* @numba_runtime_build_excinfo_struct(i8* %.515, i8* nonnull %.521)
  %.527 = bitcast { i8*, i32, i8*, i8*, i32 }* %.344 to i8*
  call void @NRT_Free(i8* nonnull %.527)
  br label %entry.endif.endif.endif.endif.endif.endif.endif.if.endif

entry.endif.endif.endif.e...if.2:                 ; preds = %entry.endif.endif.endif.endif.endif.endif.endif.if.endif
  call void @numba_do_raise(i8* nonnull %.538)
  br label %common.ret

entry.endif.endif.endif.e...endif.3.endif:        ; preds = %entry.endif.endif.endif.endif.endif.endif.endif
  call void @PyErr_SetString(i8* nonnull @PyExc_SystemError, i8* getelementptr inbounds ([43 x i8], [43 x i8]* @".const.unknown error when calling native function", i64 0, i64 0))
  br label %common.ret
}

declare i32 @PyArg_UnpackTuple(i8*, i8*, i64, i64, ...) local_unnamed_addr

declare void @PyErr_SetString(i8*, i8*) local_unnamed_addr

declare i64 @PyList_Size(i8*) local_unnamed_addr

declare i8* @numba_get_pyobject_private_data(i8*) local_unnamed_addr

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.smul.with.overflow.i64(i64, i64) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.sadd.with.overflow.i64(i64, i64) #1

define linkonce_odr void @.dtor.list.int64(i8* %.1) {
.3:
  ret void
}

declare i8* @NRT_MemInfo_new_varsize_dtor(i64, i8*) local_unnamed_addr

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare i8* @PyImport_ImportModuleNoBlock(i8*) local_unnamed_addr

declare i8* @PyObject_GetAttrString(i8*, i8*) local_unnamed_addr

declare void @Py_DecRef(i8*) local_unnamed_addr

declare i8* @PyList_GetItem(i8*, i64) local_unnamed_addr

declare i8* @PyObject_CallFunctionObjArgs(i8*, ...) local_unnamed_addr

declare void @PyErr_Format(i8*, i8*, ...) local_unnamed_addr

declare i8* @PyNumber_Long(i8*) local_unnamed_addr

declare i64 @PyLong_AsLongLong(i8*) local_unnamed_addr

declare i8* @PyErr_Occurred() local_unnamed_addr

declare void @numba_set_pyobject_private_data(i8*, i8*) local_unnamed_addr

declare void @numba_reset_pyobject_private_data(i8*) local_unnamed_addr

declare i32 @PyList_SetSlice(i8*, i64, i64, i8*) local_unnamed_addr

declare i8* @PyLong_FromLongLong(i64) local_unnamed_addr

declare i32 @PyList_SetItem(i8*, i64, i8*) local_unnamed_addr

declare i32 @PyList_Append(i8*, i8*) local_unnamed_addr

declare void @Py_IncRef(i8*) local_unnamed_addr

declare i8* @PyList_New(i64) local_unnamed_addr

declare void @PyErr_Clear() local_unnamed_addr

declare i8* @PyBytes_FromStringAndSize(i8*, i64) local_unnamed_addr

declare i8* @numba_unpickle(i8*, i32, i8*) local_unnamed_addr

declare i8* @numba_runtime_build_excinfo_struct(i8*, i8*) local_unnamed_addr

declare void @NRT_Free(i8*) local_unnamed_addr

declare void @numba_do_raise(i8*) local_unnamed_addr

define { i8*, i8* } @cfunc._ZN8__main__6bubbleB2v1B38c8tJTIcFKzyF2ILShI4CrgQElQb6HczSBAA_3dE42reflected_20list_28int64_29_3civ_3dNone_3e({ i8*, i8* } %.1) local_unnamed_addr {
entry:
  %.3 = alloca { i8*, i8* }, align 8
  %.fca.0.gep1 = bitcast { i8*, i8* }* %.3 to i8**
  %.fca.1.gep = getelementptr inbounds { i8*, i8* }, { i8*, i8* }* %.3, i64 0, i32 1
  %excinfo = alloca { i8*, i32, i8*, i8*, i32 }*, align 8
  %0 = bitcast { i8*, i8* }* %.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(16) %0, i8 0, i64 16, i1 false)
  store { i8*, i32, i8*, i8*, i32 }* null, { i8*, i32, i8*, i8*, i32 }** %excinfo, align 8
  %extracted.meminfo = extractvalue { i8*, i8* } %.1, 0
  %extracted.parent = extractvalue { i8*, i8* } %.1, 1
  %.7 = call i32 @_ZN8__main__6bubbleB2v1B38c8tJTIcFKzyF2ILShI4CrgQElQb6HczSBAA_3dE42reflected_20list_28int64_29_3civ_3dNone_3e({ i8*, i8* }* nonnull %.3, { i8*, i32, i8*, i8*, i32 }** nonnull %excinfo, i8* %extracted.meminfo, i8* %extracted.parent) #4
  %.8 = load { i8*, i32, i8*, i8*, i32 }*, { i8*, i32, i8*, i8*, i32 }** %excinfo, align 8
  %.9.not = icmp eq i32 %.7, 0
  %.15 = icmp sgt i32 %.7, 0
  %.16 = select i1 %.15, { i8*, i32, i8*, i8*, i32 }* %.8, { i8*, i32, i8*, i8*, i32 }* undef
  %.17.fca.0.load = load i8*, i8** %.fca.0.gep1, align 8
  %.17.fca.1.load = load i8*, i8** %.fca.1.gep, align 8
  %inserted.meminfo = insertvalue { i8*, i8* } undef, i8* %.17.fca.0.load, 0
  %inserted.parent = insertvalue { i8*, i8* } %inserted.meminfo, i8* %.17.fca.1.load, 1
  %.21 = alloca i32, align 4
  store i32 0, i32* %.21, align 4
  br i1 %.9.not, label %common.ret, label %entry.if, !prof !1

entry.if:                                         ; preds = %entry
  %1 = icmp sgt i32 %.7, 0
  call void @numba_gil_ensure(i32* nonnull %.21)
  br i1 %1, label %entry.if.if, label %entry.if.endif.endif.endif

common.ret:                                       ; preds = %entry, %.24, %entry.if.if.if.if
  %common.ret.op = phi { i8*, i8* } [ zeroinitializer, %entry.if.if.if.if ], [ %inserted.parent, %.24 ], [ %inserted.parent, %entry ]
  ret { i8*, i8* } %common.ret.op

.24:                                              ; preds = %entry.if.if.endif, %entry.if.if.endif.if, %entry.if.endif.endif.endif
  %.72 = call i8* @PyUnicode_FromString(i8* getelementptr inbounds ([53 x i8], [53 x i8]* @".const.<numba.core.cpu.CPUContext object at 0x7032db82a5f0>", i64 0, i64 0))
  call void @PyErr_WriteUnraisable(i8* %.72)
  call void @Py_DecRef(i8* %.72)
  call void @numba_gil_release(i32* nonnull %.21)
  br label %common.ret

entry.if.if:                                      ; preds = %entry.if
  call void @PyErr_Clear()
  %.27 = load { i8*, i32, i8*, i8*, i32 }, { i8*, i32, i8*, i8*, i32 }* %.16, align 8
  %.28 = extractvalue { i8*, i32, i8*, i8*, i32 } %.27, 4
  %.29 = icmp sgt i32 %.28, 0
  %.32 = extractvalue { i8*, i32, i8*, i8*, i32 } %.27, 0
  %.34 = extractvalue { i8*, i32, i8*, i8*, i32 } %.27, 1
  br i1 %.29, label %entry.if.if.if, label %entry.if.if.else

entry.if.if.if:                                   ; preds = %entry.if.if
  %.35 = sext i32 %.34 to i64
  %.36 = call i8* @PyBytes_FromStringAndSize(i8* %.32, i64 %.35)
  %.37 = load { i8*, i32, i8*, i8*, i32 }, { i8*, i32, i8*, i8*, i32 }* %.16, align 8
  %.38 = extractvalue { i8*, i32, i8*, i8*, i32 } %.37, 2
  %.40 = extractvalue { i8*, i32, i8*, i8*, i32 } %.37, 3
  %.41 = bitcast i8* %.40 to i8* (i8*)*
  %.42 = call i8* %.41(i8* %.38)
  %.43 = icmp eq i8* %.42, null
  br i1 %.43, label %entry.if.if.if.if, label %entry.if.if.if.endif, !prof !3

entry.if.if.else:                                 ; preds = %entry.if.if
  %.56 = extractvalue { i8*, i32, i8*, i8*, i32 } %.27, 2
  %.57 = call i8* @numba_unpickle(i8* %.32, i32 %.34, i8* %.56)
  br label %entry.if.if.endif

entry.if.if.endif:                                ; preds = %entry.if.if.if.endif, %entry.if.if.else
  %.59 = phi i8* [ %.47, %entry.if.if.if.endif ], [ %.57, %entry.if.if.else ]
  %.60.not = icmp eq i8* %.59, null
  br i1 %.60.not, label %.24, label %entry.if.if.endif.if, !prof !3

entry.if.if.if.if:                                ; preds = %entry.if.if.if
  call void @PyErr_SetString(i8* nonnull @PyExc_RuntimeError, i8* getelementptr inbounds ([61 x i8], [61 x i8]* @".const.Error creating Python tuple from runtime exception arguments.1", i64 0, i64 0))
  br label %common.ret

entry.if.if.if.endif:                             ; preds = %entry.if.if.if
  %.47 = call i8* @numba_runtime_build_excinfo_struct(i8* %.36, i8* nonnull %.42)
  %.48 = bitcast { i8*, i32, i8*, i8*, i32 }* %.16 to i8*
  call void @NRT_Free(i8* nonnull %.48)
  br label %entry.if.if.endif

entry.if.if.endif.if:                             ; preds = %entry.if.if.endif
  call void @numba_do_raise(i8* nonnull %.59)
  br label %.24

entry.if.endif.endif.endif:                       ; preds = %entry.if
  call void @PyErr_SetString(i8* nonnull @PyExc_SystemError, i8* getelementptr inbounds ([43 x i8], [43 x i8]* @".const.unknown error when calling native function.2", i64 0, i64 0))
  br label %.24
}

declare void @numba_gil_ensure(i32*) local_unnamed_addr

declare i8* @PyUnicode_FromString(i8*) local_unnamed_addr

declare void @PyErr_WriteUnraisable(i8*) local_unnamed_addr

declare void @numba_gil_release(i32*) local_unnamed_addr

; Function Attrs: mustprogress nofree noinline norecurse nounwind willreturn
define linkonce_odr void @NRT_incref(i8* %.1) local_unnamed_addr #3 {
.3:
  %.4 = icmp eq i8* %.1, null
  br i1 %.4, label %common.ret, label %.3.endif, !prof !3

common.ret:                                       ; preds = %.3.endif, %.3
  ret void

.3.endif:                                         ; preds = %.3
  %.7 = bitcast i8* %.1 to i64*
  %.4.i = atomicrmw add i64* %.7, i64 1 monotonic, align 8
  br label %common.ret
}

; Function Attrs: noinline
define linkonce_odr void @NRT_decref(i8* %.1) local_unnamed_addr #4 {
.3:
  %.4 = icmp eq i8* %.1, null
  br i1 %.4, label %common.ret1, label %.3.endif, !prof !3

common.ret1:                                      ; preds = %.3, %.3.endif
  ret void

.3.endif:                                         ; preds = %.3
  fence release
  %.8 = bitcast i8* %.1 to i64*
  %.4.i = atomicrmw sub i64* %.8, i64 1 monotonic, align 8
  %.10 = icmp eq i64 %.4.i, 1
  br i1 %.10, label %.3.endif.if, label %common.ret1, !prof !3

.3.endif.if:                                      ; preds = %.3.endif
  fence acquire
  tail call void @NRT_MemInfo_call_dtor(i8* nonnull %.1)
  ret void
}

declare void @NRT_MemInfo_call_dtor(i8*) local_unnamed_addr

attributes #0 = { nofree norecurse nounwind }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly mustprogress nofree nounwind willreturn writeonly }
attributes #3 = { mustprogress nofree noinline norecurse nounwind willreturn }
attributes #4 = { noinline }

!numba_args_may_always_need_nrt = !{!0}

!0 = !{i32 ({ i8*, i8* }*, { i8*, i32, i8*, i8*, i32 }**, i8*, i8*)* @_ZN8__main__6bubbleB2v1B38c8tJTIcFKzyF2ILShI4CrgQElQb6HczSBAA_3dE42reflected_20list_28int64_29_3civ_3dNone_3e}
!1 = !{!"branch_weights", i32 99, i32 1}
!2 = !{i1 true}
!3 = !{!"branch_weights", i32 1, i32 99}
!4 = !{!"branch_weights", i32 21474836, i32 2126008812}
