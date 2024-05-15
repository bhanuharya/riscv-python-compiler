; ModuleID = 'bubble_sort.c'
source_filename = "bubble_sort.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.PyModuleDef = type { %struct.PyModuleDef_Base, i8*, i8*, i64, %struct.PyMethodDef*, %struct.PyModuleDef_Slot*, i32 (%struct._object*, i32 (%struct._object*, i8*)*, i8*)*, i32 (%struct._object*)*, void (i8*)* }
%struct.PyModuleDef_Base = type { %struct._object, %struct._object* ()*, i64, %struct._object* }
%struct._object = type { i64, %struct._typeobject* }
%struct._typeobject = type { %struct.PyVarObject, i8*, i64, i64, void (%struct._object*)*, i64, %struct._object* (%struct._object*, i8*)*, i32 (%struct._object*, i8*, %struct._object*)*, %struct.PyAsyncMethods*, %struct._object* (%struct._object*)*, %struct.PyNumberMethods*, %struct.PySequenceMethods*, %struct.PyMappingMethods*, i64 (%struct._object*)*, %struct._object* (%struct._object*, %struct._object*, %struct._object*)*, %struct._object* (%struct._object*)*, %struct._object* (%struct._object*, %struct._object*)*, i32 (%struct._object*, %struct._object*, %struct._object*)*, %struct.PyBufferProcs*, i64, i8*, i32 (%struct._object*, i32 (%struct._object*, i8*)*, i8*)*, i32 (%struct._object*)*, %struct._object* (%struct._object*, %struct._object*, i32)*, i64, %struct._object* (%struct._object*)*, %struct._object* (%struct._object*)*, %struct.PyMethodDef*, %struct.PyMemberDef*, %struct.PyGetSetDef*, %struct._typeobject*, %struct._object*, %struct._object* (%struct._object*, %struct._object*, %struct._object*)*, i32 (%struct._object*, %struct._object*, %struct._object*)*, i64, i32 (%struct._object*, %struct._object*, %struct._object*)*, %struct._object* (%struct._typeobject*, i64)*, %struct._object* (%struct._typeobject*, %struct._object*, %struct._object*)*, void (i8*)*, i32 (%struct._object*)*, %struct._object*, %struct._object*, %struct._object*, %struct._object*, %struct._object*, void (%struct._object*)*, i32, void (%struct._object*)*, %struct._object* (%struct._object*, %struct._object**, i64, %struct._object*)* }
%struct.PyVarObject = type { %struct._object, i64 }
%struct.PyAsyncMethods = type { %struct._object* (%struct._object*)*, %struct._object* (%struct._object*)*, %struct._object* (%struct._object*)*, i32 (%struct._object*, %struct._object*, %struct._object**)* }
%struct.PyNumberMethods = type { %struct._object* (%struct._object*, %struct._object*)*, %struct._object* (%struct._object*, %struct._object*)*, %struct._object* (%struct._object*, %struct._object*)*, %struct._object* (%struct._object*, %struct._object*)*, %struct._object* (%struct._object*, %struct._object*)*, %struct._object* (%struct._object*, %struct._object*, %struct._object*)*, %struct._object* (%struct._object*)*, %struct._object* (%struct._object*)*, %struct._object* (%struct._object*)*, i32 (%struct._object*)*, %struct._object* (%struct._object*)*, %struct._object* (%struct._object*, %struct._object*)*, %struct._object* (%struct._object*, %struct._object*)*, %struct._object* (%struct._object*, %struct._object*)*, %struct._object* (%struct._object*, %struct._object*)*, %struct._object* (%struct._object*, %struct._object*)*, %struct._object* (%struct._object*)*, i8*, %struct._object* (%struct._object*)*, %struct._object* (%struct._object*, %struct._object*)*, %struct._object* (%struct._object*, %struct._object*)*, %struct._object* (%struct._object*, %struct._object*)*, %struct._object* (%struct._object*, %struct._object*)*, %struct._object* (%struct._object*, %struct._object*, %struct._object*)*, %struct._object* (%struct._object*, %struct._object*)*, %struct._object* (%struct._object*, %struct._object*)*, %struct._object* (%struct._object*, %struct._object*)*, %struct._object* (%struct._object*, %struct._object*)*, %struct._object* (%struct._object*, %struct._object*)*, %struct._object* (%struct._object*, %struct._object*)*, %struct._object* (%struct._object*, %struct._object*)*, %struct._object* (%struct._object*, %struct._object*)*, %struct._object* (%struct._object*, %struct._object*)*, %struct._object* (%struct._object*)*, %struct._object* (%struct._object*, %struct._object*)*, %struct._object* (%struct._object*, %struct._object*)* }
%struct.PySequenceMethods = type { i64 (%struct._object*)*, %struct._object* (%struct._object*, %struct._object*)*, %struct._object* (%struct._object*, i64)*, %struct._object* (%struct._object*, i64)*, i8*, i32 (%struct._object*, i64, %struct._object*)*, i8*, i32 (%struct._object*, %struct._object*)*, %struct._object* (%struct._object*, %struct._object*)*, %struct._object* (%struct._object*, i64)* }
%struct.PyMappingMethods = type { i64 (%struct._object*)*, %struct._object* (%struct._object*, %struct._object*)*, i32 (%struct._object*, %struct._object*, %struct._object*)* }
%struct.PyBufferProcs = type { i32 (%struct._object*, %struct.bufferinfo*, i32)*, void (%struct._object*, %struct.bufferinfo*)* }
%struct.bufferinfo = type { i8*, %struct._object*, i64, i64, i32, i32, i8*, i64*, i64*, i64*, i8* }
%struct.PyMemberDef = type opaque
%struct.PyGetSetDef = type { i8*, %struct._object* (%struct._object*, i8*)*, i32 (%struct._object*, %struct._object*, i8*)*, i8*, i8* }
%struct.PyMethodDef = type { i8*, %struct._object* (%struct._object*, %struct._object*)*, i32, i8* }
%struct.PyModuleDef_Slot = type { i32, i8* }
%struct.__pyx_mstate = type { %struct._object*, %struct._object*, %struct._object*, %struct._object*, %struct._object*, %struct._object*, %struct._object*, %struct._object*, %struct._object*, %struct._object*, %struct._object*, %struct._object*, %struct._object*, %struct._object*, %struct._object*, %struct._object*, %struct._object*, %struct._object* }
%struct._longobject = type { %struct.PyVarObject, [1 x i32] }
%struct.__Pyx_CodeObjectCache = type { i32, i32, %struct.__Pyx_CodeObjectCacheEntry* }
%struct.__Pyx_CodeObjectCacheEntry = type { %struct.PyCodeObject*, i32 }
%struct.PyCodeObject = type { %struct._object, i32, i32, i32, i32, i32, i32, i32, %struct._object*, %struct._object*, %struct._object*, %struct._object*, %struct._object*, %struct._object*, i64*, %struct._object*, %struct._object*, %struct._object*, i8*, %struct._object*, i8*, i8*, %struct._PyOpcache*, i32, i8 }
%struct._PyOpcache = type opaque
%struct.PyDictObject = type { %struct._object, i64, i64, %struct._dictkeysobject*, %struct._object** }
%struct._dictkeysobject = type opaque
%struct._ts = type { %struct._ts*, %struct._ts*, %struct._is*, %struct._frame*, i32, i32, i32, i32, %struct._cframe*, i32 (%struct._object*, %struct._frame*, i32, %struct._object*)*, i32 (%struct._object*, %struct._frame*, i32, %struct._object*)*, %struct._object*, %struct._object*, %struct._object*, %struct._object*, %struct._object*, %struct._err_stackitem, %struct._err_stackitem*, %struct._object*, i32, %struct._object*, i64, i32, %struct._object*, void (i8*)*, i8*, i32, %struct._object*, %struct._object*, %struct._object*, i64, i64, %struct._cframe }
%struct._is = type opaque
%struct._frame = type { %struct.PyVarObject, %struct._frame*, %struct.PyCodeObject*, %struct._object*, %struct._object*, %struct._object*, %struct._object**, %struct._object*, i32, i8, i8, %struct._object*, i32, i32, i32, i8, [20 x %struct.PyTryBlock], [1 x %struct._object*] }
%struct.PyTryBlock = type { i32, i32, i32 }
%struct._err_stackitem = type { %struct._object*, %struct._object*, %struct._object*, %struct._err_stackitem* }
%struct._cframe = type { i32, %struct._cframe* }
%struct.PyASCIIObject = type { %struct._object, i64, i64, %struct.anon, i32* }
%struct.anon = type { i32 }
%struct.PyFloatObject = type { %struct._object, double }
%struct.__Pyx_StringTabEntry = type { %struct._object**, i8*, i64, i8*, i8, i8, i8 }
%struct.PyTupleObject = type { %struct.PyVarObject, [1 x %struct._object*] }

@__pyx_module_is_main_bubble_sort = dso_local global i32 0, align 4
@__pyx_moduledef = internal global %struct.PyModuleDef { %struct.PyModuleDef_Base { %struct._object { i64 1, %struct._typeobject* null }, %struct._object* ()* null, i64 0, %struct._object* null }, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i8* null, i64 0, %struct.PyMethodDef* getelementptr inbounds ([1 x %struct.PyMethodDef], [1 x %struct.PyMethodDef]* @__pyx_methods, i32 0, i32 0), %struct.PyModuleDef_Slot* getelementptr inbounds ([3 x %struct.PyModuleDef_Slot], [3 x %struct.PyModuleDef_Slot]* @__pyx_moduledef_slots, i32 0, i32 0), i32 (%struct._object*, i32 (%struct._object*, i8*)*, i8*)* null, i32 (%struct._object*)* null, void (i8*)* null }, align 8
@.str = private unnamed_addr constant [12 x i8] c"bubble_sort\00", align 1
@__pyx_methods = internal global [1 x %struct.PyMethodDef] zeroinitializer, align 16
@__pyx_moduledef_slots = internal global [3 x %struct.PyModuleDef_Slot] [%struct.PyModuleDef_Slot { i32 1, i8* bitcast (%struct._object* (%struct._object*, %struct.PyModuleDef*)* @__pyx_pymod_create to i8*) }, %struct.PyModuleDef_Slot { i32 2, i8* bitcast (i32 (%struct._object*)* @__pyx_pymod_exec_bubble_sort to i8*) }, %struct.PyModuleDef_Slot zeroinitializer], align 16
@__pyx_m = internal global %struct._object* null, align 8
@.str.1 = private unnamed_addr constant [5 x i8] c"name\00", align 1
@.str.2 = private unnamed_addr constant [7 x i8] c"loader\00", align 1
@.str.3 = private unnamed_addr constant [11 x i8] c"__loader__\00", align 1
@.str.4 = private unnamed_addr constant [7 x i8] c"origin\00", align 1
@.str.5 = private unnamed_addr constant [9 x i8] c"__file__\00", align 1
@.str.6 = private unnamed_addr constant [7 x i8] c"parent\00", align 1
@.str.7 = private unnamed_addr constant [12 x i8] c"__package__\00", align 1
@.str.8 = private unnamed_addr constant [27 x i8] c"submodule_search_locations\00", align 1
@.str.9 = private unnamed_addr constant [9 x i8] c"__path__\00", align 1
@__Pyx_check_single_interpreter.main_interpreter_id = internal global i64 -1, align 8
@PyExc_ImportError = external global %struct._object*, align 8
@.str.10 = private unnamed_addr constant [95 x i8] c"Interpreter change detected - this module can only be loaded into one interpreter per process.\00", align 1
@_Py_NoneStruct = external global %struct._object, align 8
@PyExc_AttributeError = external global %struct._object*, align 8
@PyExc_RuntimeError = external global %struct._object*, align 8
@.str.11 = private unnamed_addr constant [84 x i8] c"Module 'bubble_sort' has already been imported. Re-initialisation is not supported.\00", align 1
@__pyx_mstate_global = internal global %struct.__pyx_mstate* @__pyx_mstate_global_static, align 8
@__pyx_f = internal global [1 x i8*] [i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.25, i32 0, i32 0)], align 8
@.str.12 = private unnamed_addr constant [9 x i8] c"builtins\00", align 1
@.str.13 = private unnamed_addr constant [15 x i8] c"cython_runtime\00", align 1
@.str.14 = private unnamed_addr constant [13 x i8] c"__builtins__\00", align 1
@.str.15 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@__pyx_pymod_exec_bubble_sort.__pyx_dict_version = internal global i64 0, align 8
@__pyx_pymod_exec_bubble_sort.__pyx_dict_cached_value = internal global %struct._object* null, align 8
@__pyx_pymod_exec_bubble_sort.__pyx_dict_version.16 = internal global i64 0, align 8
@__pyx_pymod_exec_bubble_sort.__pyx_dict_cached_value.17 = internal global %struct._object* null, align 8
@__pyx_pymod_exec_bubble_sort.__pyx_dict_version.18 = internal global i64 0, align 8
@__pyx_pymod_exec_bubble_sort.__pyx_dict_cached_value.19 = internal global %struct._object* null, align 8
@__pyx_pymod_exec_bubble_sort.__pyx_dict_version.20 = internal global i64 0, align 8
@__pyx_pymod_exec_bubble_sort.__pyx_dict_cached_value.21 = internal global %struct._object* null, align 8
@__pyx_pymod_exec_bubble_sort.__pyx_dict_version.22 = internal global i64 0, align 8
@__pyx_pymod_exec_bubble_sort.__pyx_dict_cached_value.23 = internal global %struct._object* null, align 8
@.str.24 = private unnamed_addr constant [17 x i8] c"init bubble_sort\00", align 1
@__pyx_mstate_global_static = internal global %struct.__pyx_mstate zeroinitializer, align 8
@.str.25 = private unnamed_addr constant [16 x i8] c"bubble_sort.pyx\00", align 1
@.str.26 = private unnamed_addr constant [78 x i8] c"compile time Python version %d.%d of module '%.100s' %s runtime version %d.%d\00", align 1
@.str.27 = private unnamed_addr constant [15 x i8] c"was newer than\00", align 1
@.str.28 = private unnamed_addr constant [15 x i8] c"does not match\00", align 1
@__pyx_filename = internal global i8* null, align 8
@__pyx_lineno = internal global i32 0, align 4
@__pyx_clineno = internal global i32 0, align 4
@__pyx_k_ = internal constant [2 x i8] c"?\00", align 1
@__pyx_k_cline_in_traceback = internal constant [19 x i8] c"cline_in_traceback\00", align 16
@__pyx_k_main = internal constant [9 x i8] c"__main__\00", align 1
@__pyx_k_name = internal constant [9 x i8] c"__name__\00", align 1
@__pyx_k_result = internal constant [7 x i8] c"result\00", align 1
@__pyx_k_test = internal constant [9 x i8] c"__test__\00", align 1
@__pyx_k_x = internal constant [2 x i8] c"x\00", align 1
@__pyx_k_y = internal constant [2 x i8] c"y\00", align 1
@__pyx_k_z = internal constant [2 x i8] c"z\00", align 1
@PyExc_NameError = external global %struct._object*, align 8
@.str.29 = private unnamed_addr constant [25 x i8] c"name '%U' is not defined\00", align 1
@.str.30 = private unnamed_addr constant [21 x i8] c"PyTuple_Check(tuple)\00", align 1
@.str.31 = private unnamed_addr constant [14 x i8] c"bubble_sort.c\00", align 1
@__PRETTY_FUNCTION__.__Pyx_PyErr_ExceptionMatchesTuple = private unnamed_addr constant [62 x i8] c"int __Pyx_PyErr_ExceptionMatchesTuple(PyObject *, PyObject *)\00", align 1
@.str.32 = private unnamed_addr constant [19 x i8] c"PyTuple_Check(mro)\00", align 1
@__PRETTY_FUNCTION__.__Pyx_IsAnySubtype2 = private unnamed_addr constant [72 x i8] c"int __Pyx_IsAnySubtype2(PyTypeObject *, PyTypeObject *, PyTypeObject *)\00", align 1
@PyBaseObject_Type = external global %struct._typeobject, align 8
@__PRETTY_FUNCTION__.__Pyx_IsSubtype = private unnamed_addr constant [52 x i8] c"int __Pyx_IsSubtype(PyTypeObject *, PyTypeObject *)\00", align 1
@.str.33 = private unnamed_addr constant [33 x i8] c"PyExceptionClass_Check(exc_type)\00", align 1
@__PRETTY_FUNCTION__.__Pyx_PyErr_GivenExceptionMatchesTuple = private unnamed_addr constant [67 x i8] c"int __Pyx_PyErr_GivenExceptionMatchesTuple(PyObject *, PyObject *)\00", align 1
@PyLong_Type = external global %struct._typeobject, align 8
@PyFloat_Type = external global %struct._typeobject, align 8
@_Py_TrueStruct = external global %struct._longobject, align 8
@_Py_FalseStruct = external global %struct._longobject, align 8
@__Pyx_CLineForTraceback.__pyx_dict_version = internal global i64 0, align 8
@__Pyx_CLineForTraceback.__pyx_dict_cached_value = internal global %struct._object* null, align 8
@__pyx_code_cache = internal global %struct.__Pyx_CodeObjectCache zeroinitializer, align 8
@.str.34 = private unnamed_addr constant [11 x i8] c"%s (%s:%d)\00", align 1
@__pyx_cfilenm = internal global i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.31, i32 0, i32 0), align 8

; Function Attrs: noinline nounwind optnone uwtable
define dso_local %struct._object* @PyInit_bubble_sort() #0 {
  %1 = call %struct._object* @PyModuleDef_Init(%struct.PyModuleDef* noundef @__pyx_moduledef)
  ret %struct._object* %1
}

declare %struct._object* @PyModuleDef_Init(%struct.PyModuleDef* noundef) #1

; Function Attrs: noinline nounwind optnone uwtable
define internal %struct._object* @__pyx_pymod_create(%struct._object* noundef %0, %struct.PyModuleDef* noundef %1) #0 {
  %3 = alloca %struct._object*, align 8
  %4 = alloca %struct._object*, align 8
  %5 = alloca %struct.PyModuleDef*, align 8
  %6 = alloca %struct._object*, align 8
  %7 = alloca %struct._object*, align 8
  %8 = alloca %struct._object*, align 8
  store %struct._object* %0, %struct._object** %4, align 8
  store %struct.PyModuleDef* %1, %struct.PyModuleDef** %5, align 8
  store %struct._object* null, %struct._object** %6, align 8
  %9 = load %struct.PyModuleDef*, %struct.PyModuleDef** %5, align 8
  %10 = call i32 @__Pyx_check_single_interpreter()
  %11 = icmp ne i32 %10, 0
  br i1 %11, label %12, label %13

12:                                               ; preds = %2
  store %struct._object* null, %struct._object** %3, align 8
  br label %104

13:                                               ; preds = %2
  %14 = load %struct._object*, %struct._object** @__pyx_m, align 8
  %15 = icmp ne %struct._object* %14, null
  br i1 %15, label %16, label %19

16:                                               ; preds = %13
  %17 = load %struct._object*, %struct._object** @__pyx_m, align 8
  call void @_Py_INCREF(%struct._object* noundef %17)
  %18 = load %struct._object*, %struct._object** @__pyx_m, align 8
  store %struct._object* %18, %struct._object** %3, align 8
  br label %104

19:                                               ; preds = %13
  %20 = load %struct._object*, %struct._object** %4, align 8
  %21 = call %struct._object* @PyObject_GetAttrString(%struct._object* noundef %20, i8* noundef getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i64 0, i64 0))
  store %struct._object* %21, %struct._object** %8, align 8
  %22 = load %struct._object*, %struct._object** %8, align 8
  %23 = icmp ne %struct._object* %22, null
  %24 = xor i1 %23, true
  %25 = xor i1 %24, true
  %26 = xor i1 %25, true
  %27 = zext i1 %26 to i32
  %28 = sext i32 %27 to i64
  %29 = icmp ne i64 %28, 0
  br i1 %29, label %30, label %31

30:                                               ; preds = %19
  br label %102

31:                                               ; preds = %19
  %32 = load %struct._object*, %struct._object** %8, align 8
  %33 = call %struct._object* @PyModule_NewObject(%struct._object* noundef %32)
  store %struct._object* %33, %struct._object** %6, align 8
  %34 = load %struct._object*, %struct._object** %8, align 8
  call void @_Py_DECREF(%struct._object* noundef %34)
  %35 = load %struct._object*, %struct._object** %6, align 8
  %36 = icmp ne %struct._object* %35, null
  %37 = xor i1 %36, true
  %38 = xor i1 %37, true
  %39 = xor i1 %38, true
  %40 = zext i1 %39 to i32
  %41 = sext i32 %40 to i64
  %42 = icmp ne i64 %41, 0
  br i1 %42, label %43, label %44

43:                                               ; preds = %31
  br label %102

44:                                               ; preds = %31
  %45 = load %struct._object*, %struct._object** %6, align 8
  %46 = call %struct._object* @PyModule_GetDict(%struct._object* noundef %45)
  store %struct._object* %46, %struct._object** %7, align 8
  %47 = load %struct._object*, %struct._object** %7, align 8
  %48 = icmp ne %struct._object* %47, null
  %49 = xor i1 %48, true
  %50 = xor i1 %49, true
  %51 = xor i1 %50, true
  %52 = zext i1 %51 to i32
  %53 = sext i32 %52 to i64
  %54 = icmp ne i64 %53, 0
  br i1 %54, label %55, label %56

55:                                               ; preds = %44
  br label %102

56:                                               ; preds = %44
  %57 = load %struct._object*, %struct._object** %4, align 8
  %58 = load %struct._object*, %struct._object** %7, align 8
  %59 = call i32 @__Pyx_copy_spec_to_module(%struct._object* noundef %57, %struct._object* noundef %58, i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str.2, i64 0, i64 0), i8* noundef getelementptr inbounds ([11 x i8], [11 x i8]* @.str.3, i64 0, i64 0), i32 noundef 1)
  %60 = icmp slt i32 %59, 0
  %61 = xor i1 %60, true
  %62 = xor i1 %61, true
  %63 = zext i1 %62 to i32
  %64 = sext i32 %63 to i64
  %65 = icmp ne i64 %64, 0
  br i1 %65, label %66, label %67

66:                                               ; preds = %56
  br label %102

67:                                               ; preds = %56
  %68 = load %struct._object*, %struct._object** %4, align 8
  %69 = load %struct._object*, %struct._object** %7, align 8
  %70 = call i32 @__Pyx_copy_spec_to_module(%struct._object* noundef %68, %struct._object* noundef %69, i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str.4, i64 0, i64 0), i8* noundef getelementptr inbounds ([9 x i8], [9 x i8]* @.str.5, i64 0, i64 0), i32 noundef 1)
  %71 = icmp slt i32 %70, 0
  %72 = xor i1 %71, true
  %73 = xor i1 %72, true
  %74 = zext i1 %73 to i32
  %75 = sext i32 %74 to i64
  %76 = icmp ne i64 %75, 0
  br i1 %76, label %77, label %78

77:                                               ; preds = %67
  br label %102

78:                                               ; preds = %67
  %79 = load %struct._object*, %struct._object** %4, align 8
  %80 = load %struct._object*, %struct._object** %7, align 8
  %81 = call i32 @__Pyx_copy_spec_to_module(%struct._object* noundef %79, %struct._object* noundef %80, i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str.6, i64 0, i64 0), i8* noundef getelementptr inbounds ([12 x i8], [12 x i8]* @.str.7, i64 0, i64 0), i32 noundef 1)
  %82 = icmp slt i32 %81, 0
  %83 = xor i1 %82, true
  %84 = xor i1 %83, true
  %85 = zext i1 %84 to i32
  %86 = sext i32 %85 to i64
  %87 = icmp ne i64 %86, 0
  br i1 %87, label %88, label %89

88:                                               ; preds = %78
  br label %102

89:                                               ; preds = %78
  %90 = load %struct._object*, %struct._object** %4, align 8
  %91 = load %struct._object*, %struct._object** %7, align 8
  %92 = call i32 @__Pyx_copy_spec_to_module(%struct._object* noundef %90, %struct._object* noundef %91, i8* noundef getelementptr inbounds ([27 x i8], [27 x i8]* @.str.8, i64 0, i64 0), i8* noundef getelementptr inbounds ([9 x i8], [9 x i8]* @.str.9, i64 0, i64 0), i32 noundef 0)
  %93 = icmp slt i32 %92, 0
  %94 = xor i1 %93, true
  %95 = xor i1 %94, true
  %96 = zext i1 %95 to i32
  %97 = sext i32 %96 to i64
  %98 = icmp ne i64 %97, 0
  br i1 %98, label %99, label %100

99:                                               ; preds = %89
  br label %102

100:                                              ; preds = %89
  %101 = load %struct._object*, %struct._object** %6, align 8
  store %struct._object* %101, %struct._object** %3, align 8
  br label %104

102:                                              ; preds = %99, %88, %77, %66, %55, %43, %30
  %103 = load %struct._object*, %struct._object** %6, align 8
  call void @_Py_XDECREF(%struct._object* noundef %103)
  store %struct._object* null, %struct._object** %3, align 8
  br label %104

104:                                              ; preds = %102, %100, %16, %12
  %105 = load %struct._object*, %struct._object** %3, align 8
  ret %struct._object* %105
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @__pyx_pymod_exec_bubble_sort(%struct._object* noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca %struct._object*, align 8
  %4 = alloca i32, align 4
  %5 = alloca %struct._object*, align 8
  %6 = alloca %struct._object*, align 8
  %7 = alloca %struct._object*, align 8
  %8 = alloca %struct._object*, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i8*, align 8
  %12 = alloca i32, align 4
  %13 = alloca %struct._object*, align 8
  %14 = alloca %struct._object*, align 8
  store %struct._object* %0, %struct._object** %3, align 8
  store i32 0, i32* %4, align 4
  store %struct._object* null, %struct._object** %5, align 8
  store %struct._object* null, %struct._object** %6, align 8
  store %struct._object* null, %struct._object** %7, align 8
  store %struct._object* null, %struct._object** %8, align 8
  store i32 0, i32* %10, align 4
  store i8* null, i8** %11, align 8
  store i32 0, i32* %12, align 4
  %15 = load %struct._object*, %struct._object** @__pyx_m, align 8
  %16 = icmp ne %struct._object* %15, null
  br i1 %16, label %17, label %24

17:                                               ; preds = %1
  %18 = load %struct._object*, %struct._object** @__pyx_m, align 8
  %19 = load %struct._object*, %struct._object** %3, align 8
  %20 = icmp eq %struct._object* %18, %19
  br i1 %20, label %21, label %22

21:                                               ; preds = %17
  store i32 0, i32* %2, align 4
  br label %765

22:                                               ; preds = %17
  %23 = load %struct._object*, %struct._object** @PyExc_RuntimeError, align 8
  call void @PyErr_SetString(%struct._object* noundef %23, i8* noundef getelementptr inbounds ([84 x i8], [84 x i8]* @.str.11, i64 0, i64 0))
  store i32 -1, i32* %2, align 4
  br label %765

24:                                               ; preds = %1
  %25 = load %struct._object*, %struct._object** %3, align 8
  store %struct._object* %25, %struct._object** @__pyx_m, align 8
  %26 = load %struct._object*, %struct._object** @__pyx_m, align 8
  call void @_Py_INCREF(%struct._object* noundef %26)
  %27 = load %struct._object*, %struct._object** %5, align 8
  %28 = load %struct._object*, %struct._object** @__pyx_m, align 8
  %29 = call %struct._object* @PyModule_GetDict(%struct._object* noundef %28)
  %30 = load %struct.__pyx_mstate*, %struct.__pyx_mstate** @__pyx_mstate_global, align 8
  %31 = getelementptr inbounds %struct.__pyx_mstate, %struct.__pyx_mstate* %30, i32 0, i32 0
  store %struct._object* %29, %struct._object** %31, align 8
  %32 = load %struct.__pyx_mstate*, %struct.__pyx_mstate** @__pyx_mstate_global, align 8
  %33 = getelementptr inbounds %struct.__pyx_mstate, %struct.__pyx_mstate* %32, i32 0, i32 0
  %34 = load %struct._object*, %struct._object** %33, align 8
  %35 = icmp ne %struct._object* %34, null
  %36 = xor i1 %35, true
  %37 = xor i1 %36, true
  %38 = xor i1 %37, true
  %39 = zext i1 %38 to i32
  %40 = sext i32 %39 to i64
  %41 = icmp ne i64 %40, 0
  br i1 %41, label %42, label %47

42:                                               ; preds = %24
  %43 = load i8*, i8** getelementptr inbounds ([1 x i8*], [1 x i8*]* @__pyx_f, i64 0, i64 0), align 8
  store i8* %43, i8** %11, align 8
  %44 = load i8*, i8** %11, align 8
  store i32 1, i32* %10, align 4
  %45 = load i32, i32* %10, align 4
  store i32 2298, i32* %12, align 4
  %46 = load i32, i32* %12, align 4
  br label %726

47:                                               ; preds = %24
  %48 = load %struct.__pyx_mstate*, %struct.__pyx_mstate** @__pyx_mstate_global, align 8
  %49 = getelementptr inbounds %struct.__pyx_mstate, %struct.__pyx_mstate* %48, i32 0, i32 0
  %50 = load %struct._object*, %struct._object** %49, align 8
  call void @_Py_INCREF(%struct._object* noundef %50)
  %51 = call %struct._object* @__Pyx_PyImport_AddModuleRef(i8* noundef getelementptr inbounds ([9 x i8], [9 x i8]* @.str.12, i64 0, i64 0))
  %52 = load %struct.__pyx_mstate*, %struct.__pyx_mstate** @__pyx_mstate_global, align 8
  %53 = getelementptr inbounds %struct.__pyx_mstate, %struct.__pyx_mstate* %52, i32 0, i32 1
  store %struct._object* %51, %struct._object** %53, align 8
  %54 = load %struct.__pyx_mstate*, %struct.__pyx_mstate** @__pyx_mstate_global, align 8
  %55 = getelementptr inbounds %struct.__pyx_mstate, %struct.__pyx_mstate* %54, i32 0, i32 1
  %56 = load %struct._object*, %struct._object** %55, align 8
  %57 = icmp ne %struct._object* %56, null
  %58 = xor i1 %57, true
  %59 = xor i1 %58, true
  %60 = xor i1 %59, true
  %61 = zext i1 %60 to i32
  %62 = sext i32 %61 to i64
  %63 = icmp ne i64 %62, 0
  br i1 %63, label %64, label %69

64:                                               ; preds = %47
  %65 = load i8*, i8** getelementptr inbounds ([1 x i8*], [1 x i8*]* @__pyx_f, i64 0, i64 0), align 8
  store i8* %65, i8** %11, align 8
  %66 = load i8*, i8** %11, align 8
  store i32 1, i32* %10, align 4
  %67 = load i32, i32* %10, align 4
  store i32 2300, i32* %12, align 4
  %68 = load i32, i32* %12, align 4
  br label %726

69:                                               ; preds = %47
  %70 = call %struct._object* @__Pyx_PyImport_AddModuleRef(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.13, i64 0, i64 0))
  %71 = load %struct.__pyx_mstate*, %struct.__pyx_mstate** @__pyx_mstate_global, align 8
  %72 = getelementptr inbounds %struct.__pyx_mstate, %struct.__pyx_mstate* %71, i32 0, i32 2
  store %struct._object* %70, %struct._object** %72, align 8
  %73 = load %struct.__pyx_mstate*, %struct.__pyx_mstate** @__pyx_mstate_global, align 8
  %74 = getelementptr inbounds %struct.__pyx_mstate, %struct.__pyx_mstate* %73, i32 0, i32 2
  %75 = load %struct._object*, %struct._object** %74, align 8
  %76 = icmp ne %struct._object* %75, null
  %77 = xor i1 %76, true
  %78 = xor i1 %77, true
  %79 = xor i1 %78, true
  %80 = zext i1 %79 to i32
  %81 = sext i32 %80 to i64
  %82 = icmp ne i64 %81, 0
  br i1 %82, label %83, label %88

83:                                               ; preds = %69
  %84 = load i8*, i8** getelementptr inbounds ([1 x i8*], [1 x i8*]* @__pyx_f, i64 0, i64 0), align 8
  store i8* %84, i8** %11, align 8
  %85 = load i8*, i8** %11, align 8
  store i32 1, i32* %10, align 4
  %86 = load i32, i32* %10, align 4
  store i32 2301, i32* %12, align 4
  %87 = load i32, i32* %12, align 4
  br label %726

88:                                               ; preds = %69
  %89 = load %struct._object*, %struct._object** @__pyx_m, align 8
  %90 = load %struct.__pyx_mstate*, %struct.__pyx_mstate** @__pyx_mstate_global, align 8
  %91 = getelementptr inbounds %struct.__pyx_mstate, %struct.__pyx_mstate* %90, i32 0, i32 1
  %92 = load %struct._object*, %struct._object** %91, align 8
  %93 = call i32 @PyObject_SetAttrString(%struct._object* noundef %89, i8* noundef getelementptr inbounds ([13 x i8], [13 x i8]* @.str.14, i64 0, i64 0), %struct._object* noundef %92)
  %94 = icmp slt i32 %93, 0
  br i1 %94, label %95, label %100

95:                                               ; preds = %88
  %96 = load i8*, i8** getelementptr inbounds ([1 x i8*], [1 x i8*]* @__pyx_f, i64 0, i64 0), align 8
  store i8* %96, i8** %11, align 8
  %97 = load i8*, i8** %11, align 8
  store i32 1, i32* %10, align 4
  %98 = load i32, i32* %10, align 4
  store i32 2302, i32* %12, align 4
  %99 = load i32, i32* %12, align 4
  br label %726

100:                                              ; preds = %88
  %101 = call i64 @__Pyx_get_runtime_version()
  %102 = call i32 @__Pyx_check_binary_version(i64 noundef 50990832, i64 noundef %101, i32 noundef 0)
  %103 = icmp slt i32 %102, 0
  br i1 %103, label %104, label %109

104:                                              ; preds = %100
  %105 = load i8*, i8** getelementptr inbounds ([1 x i8*], [1 x i8*]* @__pyx_f, i64 0, i64 0), align 8
  store i8* %105, i8** %11, align 8
  %106 = load i8*, i8** %11, align 8
  store i32 1, i32* %10, align 4
  %107 = load i32, i32* %10, align 4
  store i32 2313, i32* %12, align 4
  %108 = load i32, i32* %12, align 4
  br label %726

109:                                              ; preds = %100
  %110 = call %struct._object* @PyTuple_New(i64 noundef 0)
  %111 = load %struct.__pyx_mstate*, %struct.__pyx_mstate** @__pyx_mstate_global, align 8
  %112 = getelementptr inbounds %struct.__pyx_mstate, %struct.__pyx_mstate* %111, i32 0, i32 3
  store %struct._object* %110, %struct._object** %112, align 8
  %113 = load %struct.__pyx_mstate*, %struct.__pyx_mstate** @__pyx_mstate_global, align 8
  %114 = getelementptr inbounds %struct.__pyx_mstate, %struct.__pyx_mstate* %113, i32 0, i32 3
  %115 = load %struct._object*, %struct._object** %114, align 8
  %116 = icmp ne %struct._object* %115, null
  %117 = xor i1 %116, true
  %118 = xor i1 %117, true
  %119 = xor i1 %118, true
  %120 = zext i1 %119 to i32
  %121 = sext i32 %120 to i64
  %122 = icmp ne i64 %121, 0
  br i1 %122, label %123, label %128

123:                                              ; preds = %109
  %124 = load i8*, i8** getelementptr inbounds ([1 x i8*], [1 x i8*]* @__pyx_f, i64 0, i64 0), align 8
  store i8* %124, i8** %11, align 8
  %125 = load i8*, i8** %11, align 8
  store i32 1, i32* %10, align 4
  %126 = load i32, i32* %10, align 4
  store i32 2317, i32* %12, align 4
  %127 = load i32, i32* %12, align 4
  br label %726

128:                                              ; preds = %109
  %129 = call %struct._object* @PyBytes_FromStringAndSize(i8* noundef getelementptr inbounds ([1 x i8], [1 x i8]* @.str.15, i64 0, i64 0), i64 noundef 0)
  %130 = load %struct.__pyx_mstate*, %struct.__pyx_mstate** @__pyx_mstate_global, align 8
  %131 = getelementptr inbounds %struct.__pyx_mstate, %struct.__pyx_mstate* %130, i32 0, i32 4
  store %struct._object* %129, %struct._object** %131, align 8
  %132 = load %struct.__pyx_mstate*, %struct.__pyx_mstate** @__pyx_mstate_global, align 8
  %133 = getelementptr inbounds %struct.__pyx_mstate, %struct.__pyx_mstate* %132, i32 0, i32 4
  %134 = load %struct._object*, %struct._object** %133, align 8
  %135 = icmp ne %struct._object* %134, null
  %136 = xor i1 %135, true
  %137 = xor i1 %136, true
  %138 = xor i1 %137, true
  %139 = zext i1 %138 to i32
  %140 = sext i32 %139 to i64
  %141 = icmp ne i64 %140, 0
  br i1 %141, label %142, label %147

142:                                              ; preds = %128
  %143 = load i8*, i8** getelementptr inbounds ([1 x i8*], [1 x i8*]* @__pyx_f, i64 0, i64 0), align 8
  store i8* %143, i8** %11, align 8
  %144 = load i8*, i8** %11, align 8
  store i32 1, i32* %10, align 4
  %145 = load i32, i32* %10, align 4
  store i32 2318, i32* %12, align 4
  %146 = load i32, i32* %12, align 4
  br label %726

147:                                              ; preds = %128
  %148 = call %struct._object* @PyUnicode_FromStringAndSize(i8* noundef getelementptr inbounds ([1 x i8], [1 x i8]* @.str.15, i64 0, i64 0), i64 noundef 0)
  %149 = load %struct.__pyx_mstate*, %struct.__pyx_mstate** @__pyx_mstate_global, align 8
  %150 = getelementptr inbounds %struct.__pyx_mstate, %struct.__pyx_mstate* %149, i32 0, i32 5
  store %struct._object* %148, %struct._object** %150, align 8
  %151 = load %struct.__pyx_mstate*, %struct.__pyx_mstate** @__pyx_mstate_global, align 8
  %152 = getelementptr inbounds %struct.__pyx_mstate, %struct.__pyx_mstate* %151, i32 0, i32 5
  %153 = load %struct._object*, %struct._object** %152, align 8
  %154 = icmp ne %struct._object* %153, null
  %155 = xor i1 %154, true
  %156 = xor i1 %155, true
  %157 = xor i1 %156, true
  %158 = zext i1 %157 to i32
  %159 = sext i32 %158 to i64
  %160 = icmp ne i64 %159, 0
  br i1 %160, label %161, label %166

161:                                              ; preds = %147
  %162 = load i8*, i8** getelementptr inbounds ([1 x i8*], [1 x i8*]* @__pyx_f, i64 0, i64 0), align 8
  store i8* %162, i8** %11, align 8
  %163 = load i8*, i8** %11, align 8
  store i32 1, i32* %10, align 4
  %164 = load i32, i32* %10, align 4
  store i32 2319, i32* %12, align 4
  %165 = load i32, i32* %12, align 4
  br label %726

166:                                              ; preds = %147
  %167 = call i32 @__Pyx_InitConstants()
  %168 = icmp slt i32 %167, 0
  br i1 %168, label %169, label %174

169:                                              ; preds = %166
  %170 = load i8*, i8** getelementptr inbounds ([1 x i8*], [1 x i8*]* @__pyx_f, i64 0, i64 0), align 8
  store i8* %170, i8** %11, align 8
  %171 = load i8*, i8** %11, align 8
  store i32 1, i32* %10, align 4
  %172 = load i32, i32* %10, align 4
  store i32 2344, i32* %12, align 4
  %173 = load i32, i32* %12, align 4
  br label %726

174:                                              ; preds = %166
  store i32 1, i32* %4, align 4
  %175 = call i32 @__Pyx_InitGlobals()
  %176 = icmp slt i32 %175, 0
  br i1 %176, label %177, label %182

177:                                              ; preds = %174
  %178 = load i8*, i8** getelementptr inbounds ([1 x i8*], [1 x i8*]* @__pyx_f, i64 0, i64 0), align 8
  store i8* %178, i8** %11, align 8
  %179 = load i8*, i8** %11, align 8
  store i32 1, i32* %10, align 4
  %180 = load i32, i32* %10, align 4
  store i32 2346, i32* %12, align 4
  %181 = load i32, i32* %12, align 4
  br label %726

182:                                              ; preds = %174
  %183 = load i32, i32* @__pyx_module_is_main_bubble_sort, align 4
  %184 = icmp ne i32 %183, 0
  br i1 %184, label %185, label %201

185:                                              ; preds = %182
  %186 = load %struct._object*, %struct._object** @__pyx_m, align 8
  %187 = load %struct.__pyx_mstate*, %struct.__pyx_mstate** @__pyx_mstate_global, align 8
  %188 = getelementptr inbounds %struct.__pyx_mstate, %struct.__pyx_mstate* %187, i32 0, i32 9
  %189 = load %struct._object*, %struct._object** %188, align 8
  %190 = load %struct.__pyx_mstate*, %struct.__pyx_mstate** @__pyx_mstate_global, align 8
  %191 = getelementptr inbounds %struct.__pyx_mstate, %struct.__pyx_mstate* %190, i32 0, i32 8
  %192 = load %struct._object*, %struct._object** %191, align 8
  %193 = call i32 @PyObject_SetAttr(%struct._object* noundef %186, %struct._object* noundef %189, %struct._object* noundef %192)
  %194 = icmp slt i32 %193, 0
  br i1 %194, label %195, label %200

195:                                              ; preds = %185
  %196 = load i8*, i8** getelementptr inbounds ([1 x i8*], [1 x i8*]* @__pyx_f, i64 0, i64 0), align 8
  store i8* %196, i8** %11, align 8
  %197 = load i8*, i8** %11, align 8
  store i32 1, i32* %10, align 4
  %198 = load i32, i32* %10, align 4
  store i32 2351, i32* %12, align 4
  %199 = load i32, i32* %12, align 4
  br label %726

200:                                              ; preds = %185
  br label %201

201:                                              ; preds = %200, %182
  %202 = call %struct._object* @PyImport_GetModuleDict()
  store %struct._object* %202, %struct._object** %13, align 8
  %203 = load %struct._object*, %struct._object** %13, align 8
  %204 = icmp ne %struct._object* %203, null
  %205 = xor i1 %204, true
  %206 = xor i1 %205, true
  %207 = xor i1 %206, true
  %208 = zext i1 %207 to i32
  %209 = sext i32 %208 to i64
  %210 = icmp ne i64 %209, 0
  br i1 %210, label %211, label %216

211:                                              ; preds = %201
  %212 = load i8*, i8** getelementptr inbounds ([1 x i8*], [1 x i8*]* @__pyx_f, i64 0, i64 0), align 8
  store i8* %212, i8** %11, align 8
  %213 = load i8*, i8** %11, align 8
  store i32 1, i32* %10, align 4
  %214 = load i32, i32* %10, align 4
  store i32 2355, i32* %12, align 4
  %215 = load i32, i32* %12, align 4
  br label %726

216:                                              ; preds = %201
  %217 = load %struct._object*, %struct._object** %13, align 8
  %218 = call %struct._object* @PyDict_GetItemString(%struct._object* noundef %217, i8* noundef getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i64 0, i64 0))
  %219 = icmp ne %struct._object* %218, null
  br i1 %219, label %236, label %220

220:                                              ; preds = %216
  %221 = load %struct._object*, %struct._object** %13, align 8
  %222 = load %struct._object*, %struct._object** @__pyx_m, align 8
  %223 = call i32 @PyDict_SetItemString(%struct._object* noundef %221, i8* noundef getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i64 0, i64 0), %struct._object* noundef %222)
  %224 = icmp slt i32 %223, 0
  %225 = xor i1 %224, true
  %226 = xor i1 %225, true
  %227 = zext i1 %226 to i32
  %228 = sext i32 %227 to i64
  %229 = icmp ne i64 %228, 0
  br i1 %229, label %230, label %235

230:                                              ; preds = %220
  %231 = load i8*, i8** getelementptr inbounds ([1 x i8*], [1 x i8*]* @__pyx_f, i64 0, i64 0), align 8
  store i8* %231, i8** %11, align 8
  %232 = load i8*, i8** %11, align 8
  store i32 1, i32* %10, align 4
  %233 = load i32, i32* %10, align 4
  store i32 2357, i32* %12, align 4
  %234 = load i32, i32* %12, align 4
  br label %726

235:                                              ; preds = %220
  br label %236

236:                                              ; preds = %235, %216
  %237 = call i32 @__Pyx_InitCachedBuiltins()
  %238 = icmp slt i32 %237, 0
  br i1 %238, label %239, label %244

239:                                              ; preds = %236
  %240 = load i8*, i8** getelementptr inbounds ([1 x i8*], [1 x i8*]* @__pyx_f, i64 0, i64 0), align 8
  store i8* %240, i8** %11, align 8
  %241 = load i8*, i8** %11, align 8
  store i32 1, i32* %10, align 4
  %242 = load i32, i32* %10, align 4
  store i32 2362, i32* %12, align 4
  %243 = load i32, i32* %12, align 4
  br label %726

244:                                              ; preds = %236
  %245 = call i32 @__Pyx_InitCachedConstants()
  %246 = icmp slt i32 %245, 0
  br i1 %246, label %247, label %252

247:                                              ; preds = %244
  %248 = load i8*, i8** getelementptr inbounds ([1 x i8*], [1 x i8*]* @__pyx_f, i64 0, i64 0), align 8
  store i8* %248, i8** %11, align 8
  %249 = load i8*, i8** %11, align 8
  store i32 1, i32* %10, align 4
  %250 = load i32, i32* %10, align 4
  store i32 2364, i32* %12, align 4
  %251 = load i32, i32* %12, align 4
  br label %726

252:                                              ; preds = %244
  %253 = call i32 @__Pyx_modinit_global_init_code()
  %254 = call i32 @__Pyx_modinit_variable_export_code()
  %255 = call i32 @__Pyx_modinit_function_export_code()
  %256 = call i32 @__Pyx_modinit_type_init_code()
  %257 = call i32 @__Pyx_modinit_type_import_code()
  %258 = call i32 @__Pyx_modinit_variable_import_code()
  %259 = call i32 @__Pyx_modinit_function_import_code()
  %260 = load %struct.__pyx_mstate*, %struct.__pyx_mstate** @__pyx_mstate_global, align 8
  %261 = getelementptr inbounds %struct.__pyx_mstate, %struct.__pyx_mstate* %260, i32 0, i32 0
  %262 = load %struct._object*, %struct._object** %261, align 8
  %263 = load %struct.__pyx_mstate*, %struct.__pyx_mstate** @__pyx_mstate_global, align 8
  %264 = getelementptr inbounds %struct.__pyx_mstate, %struct.__pyx_mstate* %263, i32 0, i32 12
  %265 = load %struct._object*, %struct._object** %264, align 8
  %266 = load %struct.__pyx_mstate*, %struct.__pyx_mstate** @__pyx_mstate_global, align 8
  %267 = getelementptr inbounds %struct.__pyx_mstate, %struct.__pyx_mstate* %266, i32 0, i32 16
  %268 = load %struct._object*, %struct._object** %267, align 8
  %269 = call i32 @PyDict_SetItem(%struct._object* noundef %262, %struct._object* noundef %265, %struct._object* noundef %268)
  %270 = icmp slt i32 %269, 0
  br i1 %270, label %271, label %276

271:                                              ; preds = %252
  %272 = load i8*, i8** getelementptr inbounds ([1 x i8*], [1 x i8*]* @__pyx_f, i64 0, i64 0), align 8
  store i8* %272, i8** %11, align 8
  %273 = load i8*, i8** %11, align 8
  store i32 1, i32* %10, align 4
  %274 = load i32, i32* %10, align 4
  store i32 2383, i32* %12, align 4
  %275 = load i32, i32* %12, align 4
  br label %726

276:                                              ; preds = %252
  %277 = load %struct.__pyx_mstate*, %struct.__pyx_mstate** @__pyx_mstate_global, align 8
  %278 = getelementptr inbounds %struct.__pyx_mstate, %struct.__pyx_mstate* %277, i32 0, i32 0
  %279 = load %struct._object*, %struct._object** %278, align 8
  %280 = load %struct.__pyx_mstate*, %struct.__pyx_mstate** @__pyx_mstate_global, align 8
  %281 = getelementptr inbounds %struct.__pyx_mstate, %struct.__pyx_mstate* %280, i32 0, i32 13
  %282 = load %struct._object*, %struct._object** %281, align 8
  %283 = load %struct.__pyx_mstate*, %struct.__pyx_mstate** @__pyx_mstate_global, align 8
  %284 = getelementptr inbounds %struct.__pyx_mstate, %struct.__pyx_mstate* %283, i32 0, i32 15
  %285 = load %struct._object*, %struct._object** %284, align 8
  %286 = call i32 @PyDict_SetItem(%struct._object* noundef %279, %struct._object* noundef %282, %struct._object* noundef %285)
  %287 = icmp slt i32 %286, 0
  br i1 %287, label %288, label %293

288:                                              ; preds = %276
  %289 = load i8*, i8** getelementptr inbounds ([1 x i8*], [1 x i8*]* @__pyx_f, i64 0, i64 0), align 8
  store i8* %289, i8** %11, align 8
  %290 = load i8*, i8** %11, align 8
  store i32 2, i32* %10, align 4
  %291 = load i32, i32* %10, align 4
  store i32 2391, i32* %12, align 4
  %292 = load i32, i32* %12, align 4
  br label %726

293:                                              ; preds = %276
  br label %294

294:                                              ; preds = %293
  %295 = load i64, i64* @__pyx_pymod_exec_bubble_sort.__pyx_dict_version, align 8
  %296 = load %struct.__pyx_mstate*, %struct.__pyx_mstate** @__pyx_mstate_global, align 8
  %297 = getelementptr inbounds %struct.__pyx_mstate, %struct.__pyx_mstate* %296, i32 0, i32 0
  %298 = load %struct._object*, %struct._object** %297, align 8
  %299 = bitcast %struct._object* %298 to %struct.PyDictObject*
  %300 = getelementptr inbounds %struct.PyDictObject, %struct.PyDictObject* %299, i32 0, i32 2
  %301 = load i64, i64* %300, align 8
  %302 = icmp eq i64 %295, %301
  %303 = xor i1 %302, true
  %304 = xor i1 %303, true
  %305 = zext i1 %304 to i32
  %306 = sext i32 %305 to i64
  %307 = icmp ne i64 %306, 0
  br i1 %307, label %308, label %326

308:                                              ; preds = %294
  %309 = load %struct._object*, %struct._object** @__pyx_pymod_exec_bubble_sort.__pyx_dict_cached_value, align 8
  %310 = icmp ne %struct._object* %309, null
  %311 = xor i1 %310, true
  %312 = xor i1 %311, true
  %313 = zext i1 %312 to i32
  %314 = sext i32 %313 to i64
  %315 = icmp ne i64 %314, 0
  br i1 %315, label %316, label %319

316:                                              ; preds = %308
  %317 = load %struct._object*, %struct._object** @__pyx_pymod_exec_bubble_sort.__pyx_dict_cached_value, align 8
  call void @_Py_INCREF(%struct._object* noundef %317)
  %318 = load %struct._object*, %struct._object** @__pyx_pymod_exec_bubble_sort.__pyx_dict_cached_value, align 8
  br label %324

319:                                              ; preds = %308
  %320 = load %struct.__pyx_mstate*, %struct.__pyx_mstate** @__pyx_mstate_global, align 8
  %321 = getelementptr inbounds %struct.__pyx_mstate, %struct.__pyx_mstate* %320, i32 0, i32 12
  %322 = load %struct._object*, %struct._object** %321, align 8
  %323 = call %struct._object* @__Pyx_GetBuiltinName(%struct._object* noundef %322)
  br label %324

324:                                              ; preds = %319, %316
  %325 = phi %struct._object* [ %318, %316 ], [ %323, %319 ]
  br label %331

326:                                              ; preds = %294
  %327 = load %struct.__pyx_mstate*, %struct.__pyx_mstate** @__pyx_mstate_global, align 8
  %328 = getelementptr inbounds %struct.__pyx_mstate, %struct.__pyx_mstate* %327, i32 0, i32 12
  %329 = load %struct._object*, %struct._object** %328, align 8
  %330 = call %struct._object* @__Pyx__GetModuleGlobalName(%struct._object* noundef %329, i64* noundef @__pyx_pymod_exec_bubble_sort.__pyx_dict_version, %struct._object** noundef @__pyx_pymod_exec_bubble_sort.__pyx_dict_cached_value)
  br label %331

331:                                              ; preds = %326, %324
  %332 = phi %struct._object* [ %325, %324 ], [ %330, %326 ]
  store %struct._object* %332, %struct._object** %6, align 8
  br label %333

333:                                              ; preds = %331
  %334 = load %struct._object*, %struct._object** %6, align 8
  %335 = icmp ne %struct._object* %334, null
  %336 = xor i1 %335, true
  %337 = xor i1 %336, true
  %338 = xor i1 %337, true
  %339 = zext i1 %338 to i32
  %340 = sext i32 %339 to i64
  %341 = icmp ne i64 %340, 0
  br i1 %341, label %342, label %347

342:                                              ; preds = %333
  %343 = load i8*, i8** getelementptr inbounds ([1 x i8*], [1 x i8*]* @__pyx_f, i64 0, i64 0), align 8
  store i8* %343, i8** %11, align 8
  %344 = load i8*, i8** %11, align 8
  store i32 3, i32* %10, align 4
  %345 = load i32, i32* %10, align 4
  store i32 2400, i32* %12, align 4
  %346 = load i32, i32* %12, align 4
  br label %726

347:                                              ; preds = %333
  br label %348

348:                                              ; preds = %347
  %349 = load i64, i64* @__pyx_pymod_exec_bubble_sort.__pyx_dict_version.16, align 8
  %350 = load %struct.__pyx_mstate*, %struct.__pyx_mstate** @__pyx_mstate_global, align 8
  %351 = getelementptr inbounds %struct.__pyx_mstate, %struct.__pyx_mstate* %350, i32 0, i32 0
  %352 = load %struct._object*, %struct._object** %351, align 8
  %353 = bitcast %struct._object* %352 to %struct.PyDictObject*
  %354 = getelementptr inbounds %struct.PyDictObject, %struct.PyDictObject* %353, i32 0, i32 2
  %355 = load i64, i64* %354, align 8
  %356 = icmp eq i64 %349, %355
  %357 = xor i1 %356, true
  %358 = xor i1 %357, true
  %359 = zext i1 %358 to i32
  %360 = sext i32 %359 to i64
  %361 = icmp ne i64 %360, 0
  br i1 %361, label %362, label %380

362:                                              ; preds = %348
  %363 = load %struct._object*, %struct._object** @__pyx_pymod_exec_bubble_sort.__pyx_dict_cached_value.17, align 8
  %364 = icmp ne %struct._object* %363, null
  %365 = xor i1 %364, true
  %366 = xor i1 %365, true
  %367 = zext i1 %366 to i32
  %368 = sext i32 %367 to i64
  %369 = icmp ne i64 %368, 0
  br i1 %369, label %370, label %373

370:                                              ; preds = %362
  %371 = load %struct._object*, %struct._object** @__pyx_pymod_exec_bubble_sort.__pyx_dict_cached_value.17, align 8
  call void @_Py_INCREF(%struct._object* noundef %371)
  %372 = load %struct._object*, %struct._object** @__pyx_pymod_exec_bubble_sort.__pyx_dict_cached_value.17, align 8
  br label %378

373:                                              ; preds = %362
  %374 = load %struct.__pyx_mstate*, %struct.__pyx_mstate** @__pyx_mstate_global, align 8
  %375 = getelementptr inbounds %struct.__pyx_mstate, %struct.__pyx_mstate* %374, i32 0, i32 13
  %376 = load %struct._object*, %struct._object** %375, align 8
  %377 = call %struct._object* @__Pyx_GetBuiltinName(%struct._object* noundef %376)
  br label %378

378:                                              ; preds = %373, %370
  %379 = phi %struct._object* [ %372, %370 ], [ %377, %373 ]
  br label %385

380:                                              ; preds = %348
  %381 = load %struct.__pyx_mstate*, %struct.__pyx_mstate** @__pyx_mstate_global, align 8
  %382 = getelementptr inbounds %struct.__pyx_mstate, %struct.__pyx_mstate* %381, i32 0, i32 13
  %383 = load %struct._object*, %struct._object** %382, align 8
  %384 = call %struct._object* @__Pyx__GetModuleGlobalName(%struct._object* noundef %383, i64* noundef @__pyx_pymod_exec_bubble_sort.__pyx_dict_version.16, %struct._object** noundef @__pyx_pymod_exec_bubble_sort.__pyx_dict_cached_value.17)
  br label %385

385:                                              ; preds = %380, %378
  %386 = phi %struct._object* [ %379, %378 ], [ %384, %380 ]
  store %struct._object* %386, %struct._object** %7, align 8
  br label %387

387:                                              ; preds = %385
  %388 = load %struct._object*, %struct._object** %7, align 8
  %389 = icmp ne %struct._object* %388, null
  %390 = xor i1 %389, true
  %391 = xor i1 %390, true
  %392 = xor i1 %391, true
  %393 = zext i1 %392 to i32
  %394 = sext i32 %393 to i64
  %395 = icmp ne i64 %394, 0
  br i1 %395, label %396, label %401

396:                                              ; preds = %387
  %397 = load i8*, i8** getelementptr inbounds ([1 x i8*], [1 x i8*]* @__pyx_f, i64 0, i64 0), align 8
  store i8* %397, i8** %11, align 8
  %398 = load i8*, i8** %11, align 8
  store i32 3, i32* %10, align 4
  %399 = load i32, i32* %10, align 4
  store i32 2402, i32* %12, align 4
  %400 = load i32, i32* %12, align 4
  br label %726

401:                                              ; preds = %387
  %402 = load %struct._object*, %struct._object** %6, align 8
  %403 = load %struct._object*, %struct._object** %7, align 8
  %404 = call %struct._object* @PyNumber_Multiply(%struct._object* noundef %402, %struct._object* noundef %403)
  store %struct._object* %404, %struct._object** %8, align 8
  %405 = load %struct._object*, %struct._object** %8, align 8
  %406 = icmp ne %struct._object* %405, null
  %407 = xor i1 %406, true
  %408 = xor i1 %407, true
  %409 = xor i1 %408, true
  %410 = zext i1 %409 to i32
  %411 = sext i32 %410 to i64
  %412 = icmp ne i64 %411, 0
  br i1 %412, label %413, label %418

413:                                              ; preds = %401
  %414 = load i8*, i8** getelementptr inbounds ([1 x i8*], [1 x i8*]* @__pyx_f, i64 0, i64 0), align 8
  store i8* %414, i8** %11, align 8
  %415 = load i8*, i8** %11, align 8
  store i32 3, i32* %10, align 4
  %416 = load i32, i32* %10, align 4
  store i32 2404, i32* %12, align 4
  %417 = load i32, i32* %12, align 4
  br label %726

418:                                              ; preds = %401
  %419 = load %struct._object*, %struct._object** %6, align 8
  call void @_Py_DECREF(%struct._object* noundef %419)
  store %struct._object* null, %struct._object** %6, align 8
  %420 = load %struct._object*, %struct._object** %7, align 8
  call void @_Py_DECREF(%struct._object* noundef %420)
  store %struct._object* null, %struct._object** %7, align 8
  %421 = load %struct.__pyx_mstate*, %struct.__pyx_mstate** @__pyx_mstate_global, align 8
  %422 = getelementptr inbounds %struct.__pyx_mstate, %struct.__pyx_mstate* %421, i32 0, i32 0
  %423 = load %struct._object*, %struct._object** %422, align 8
  %424 = load %struct.__pyx_mstate*, %struct.__pyx_mstate** @__pyx_mstate_global, align 8
  %425 = getelementptr inbounds %struct.__pyx_mstate, %struct.__pyx_mstate* %424, i32 0, i32 14
  %426 = load %struct._object*, %struct._object** %425, align 8
  %427 = load %struct._object*, %struct._object** %8, align 8
  %428 = call i32 @PyDict_SetItem(%struct._object* noundef %423, %struct._object* noundef %426, %struct._object* noundef %427)
  %429 = icmp slt i32 %428, 0
  br i1 %429, label %430, label %435

430:                                              ; preds = %418
  %431 = load i8*, i8** getelementptr inbounds ([1 x i8*], [1 x i8*]* @__pyx_f, i64 0, i64 0), align 8
  store i8* %431, i8** %11, align 8
  %432 = load i8*, i8** %11, align 8
  store i32 3, i32* %10, align 4
  %433 = load i32, i32* %10, align 4
  store i32 2408, i32* %12, align 4
  %434 = load i32, i32* %12, align 4
  br label %726

435:                                              ; preds = %418
  %436 = load %struct._object*, %struct._object** %8, align 8
  call void @_Py_DECREF(%struct._object* noundef %436)
  store %struct._object* null, %struct._object** %8, align 8
  br label %437

437:                                              ; preds = %435
  %438 = load i64, i64* @__pyx_pymod_exec_bubble_sort.__pyx_dict_version.18, align 8
  %439 = load %struct.__pyx_mstate*, %struct.__pyx_mstate** @__pyx_mstate_global, align 8
  %440 = getelementptr inbounds %struct.__pyx_mstate, %struct.__pyx_mstate* %439, i32 0, i32 0
  %441 = load %struct._object*, %struct._object** %440, align 8
  %442 = bitcast %struct._object* %441 to %struct.PyDictObject*
  %443 = getelementptr inbounds %struct.PyDictObject, %struct.PyDictObject* %442, i32 0, i32 2
  %444 = load i64, i64* %443, align 8
  %445 = icmp eq i64 %438, %444
  %446 = xor i1 %445, true
  %447 = xor i1 %446, true
  %448 = zext i1 %447 to i32
  %449 = sext i32 %448 to i64
  %450 = icmp ne i64 %449, 0
  br i1 %450, label %451, label %469

451:                                              ; preds = %437
  %452 = load %struct._object*, %struct._object** @__pyx_pymod_exec_bubble_sort.__pyx_dict_cached_value.19, align 8
  %453 = icmp ne %struct._object* %452, null
  %454 = xor i1 %453, true
  %455 = xor i1 %454, true
  %456 = zext i1 %455 to i32
  %457 = sext i32 %456 to i64
  %458 = icmp ne i64 %457, 0
  br i1 %458, label %459, label %462

459:                                              ; preds = %451
  %460 = load %struct._object*, %struct._object** @__pyx_pymod_exec_bubble_sort.__pyx_dict_cached_value.19, align 8
  call void @_Py_INCREF(%struct._object* noundef %460)
  %461 = load %struct._object*, %struct._object** @__pyx_pymod_exec_bubble_sort.__pyx_dict_cached_value.19, align 8
  br label %467

462:                                              ; preds = %451
  %463 = load %struct.__pyx_mstate*, %struct.__pyx_mstate** @__pyx_mstate_global, align 8
  %464 = getelementptr inbounds %struct.__pyx_mstate, %struct.__pyx_mstate* %463, i32 0, i32 14
  %465 = load %struct._object*, %struct._object** %464, align 8
  %466 = call %struct._object* @__Pyx_GetBuiltinName(%struct._object* noundef %465)
  br label %467

467:                                              ; preds = %462, %459
  %468 = phi %struct._object* [ %461, %459 ], [ %466, %462 ]
  br label %474

469:                                              ; preds = %437
  %470 = load %struct.__pyx_mstate*, %struct.__pyx_mstate** @__pyx_mstate_global, align 8
  %471 = getelementptr inbounds %struct.__pyx_mstate, %struct.__pyx_mstate* %470, i32 0, i32 14
  %472 = load %struct._object*, %struct._object** %471, align 8
  %473 = call %struct._object* @__Pyx__GetModuleGlobalName(%struct._object* noundef %472, i64* noundef @__pyx_pymod_exec_bubble_sort.__pyx_dict_version.18, %struct._object** noundef @__pyx_pymod_exec_bubble_sort.__pyx_dict_cached_value.19)
  br label %474

474:                                              ; preds = %469, %467
  %475 = phi %struct._object* [ %468, %467 ], [ %473, %469 ]
  store %struct._object* %475, %struct._object** %8, align 8
  br label %476

476:                                              ; preds = %474
  %477 = load %struct._object*, %struct._object** %8, align 8
  %478 = icmp ne %struct._object* %477, null
  %479 = xor i1 %478, true
  %480 = xor i1 %479, true
  %481 = xor i1 %480, true
  %482 = zext i1 %481 to i32
  %483 = sext i32 %482 to i64
  %484 = icmp ne i64 %483, 0
  br i1 %484, label %485, label %490

485:                                              ; preds = %476
  %486 = load i8*, i8** getelementptr inbounds ([1 x i8*], [1 x i8*]* @__pyx_f, i64 0, i64 0), align 8
  store i8* %486, i8** %11, align 8
  %487 = load i8*, i8** %11, align 8
  store i32 4, i32* %10, align 4
  %488 = load i32, i32* %10, align 4
  store i32 2418, i32* %12, align 4
  %489 = load i32, i32* %12, align 4
  br label %726

490:                                              ; preds = %476
  %491 = load %struct._object*, %struct._object** %8, align 8
  %492 = load %struct.__pyx_mstate*, %struct.__pyx_mstate** @__pyx_mstate_global, align 8
  %493 = getelementptr inbounds %struct.__pyx_mstate, %struct.__pyx_mstate* %492, i32 0, i32 17
  %494 = load %struct._object*, %struct._object** %493, align 8
  %495 = call i32 @__Pyx_PyInt_BoolEqObjC(%struct._object* noundef %491, %struct._object* noundef %494, i64 noundef 50, i64 noundef 0)
  store i32 %495, i32* %9, align 4
  %496 = load i32, i32* %9, align 4
  %497 = icmp slt i32 %496, 0
  %498 = xor i1 %497, true
  %499 = xor i1 %498, true
  %500 = zext i1 %499 to i32
  %501 = sext i32 %500 to i64
  %502 = icmp ne i64 %501, 0
  br i1 %502, label %503, label %508

503:                                              ; preds = %490
  %504 = load i8*, i8** getelementptr inbounds ([1 x i8*], [1 x i8*]* @__pyx_f, i64 0, i64 0), align 8
  store i8* %504, i8** %11, align 8
  %505 = load i8*, i8** %11, align 8
  store i32 4, i32* %10, align 4
  %506 = load i32, i32* %10, align 4
  store i32 2420, i32* %12, align 4
  %507 = load i32, i32* %12, align 4
  br label %726

508:                                              ; preds = %490
  %509 = load %struct._object*, %struct._object** %8, align 8
  call void @_Py_DECREF(%struct._object* noundef %509)
  store %struct._object* null, %struct._object** %8, align 8
  %510 = load i32, i32* %9, align 4
  %511 = icmp ne i32 %510, 0
  br i1 %511, label %512, label %603

512:                                              ; preds = %508
  br label %513

513:                                              ; preds = %512
  %514 = load i64, i64* @__pyx_pymod_exec_bubble_sort.__pyx_dict_version.20, align 8
  %515 = load %struct.__pyx_mstate*, %struct.__pyx_mstate** @__pyx_mstate_global, align 8
  %516 = getelementptr inbounds %struct.__pyx_mstate, %struct.__pyx_mstate* %515, i32 0, i32 0
  %517 = load %struct._object*, %struct._object** %516, align 8
  %518 = bitcast %struct._object* %517 to %struct.PyDictObject*
  %519 = getelementptr inbounds %struct.PyDictObject, %struct.PyDictObject* %518, i32 0, i32 2
  %520 = load i64, i64* %519, align 8
  %521 = icmp eq i64 %514, %520
  %522 = xor i1 %521, true
  %523 = xor i1 %522, true
  %524 = zext i1 %523 to i32
  %525 = sext i32 %524 to i64
  %526 = icmp ne i64 %525, 0
  br i1 %526, label %527, label %545

527:                                              ; preds = %513
  %528 = load %struct._object*, %struct._object** @__pyx_pymod_exec_bubble_sort.__pyx_dict_cached_value.21, align 8
  %529 = icmp ne %struct._object* %528, null
  %530 = xor i1 %529, true
  %531 = xor i1 %530, true
  %532 = zext i1 %531 to i32
  %533 = sext i32 %532 to i64
  %534 = icmp ne i64 %533, 0
  br i1 %534, label %535, label %538

535:                                              ; preds = %527
  %536 = load %struct._object*, %struct._object** @__pyx_pymod_exec_bubble_sort.__pyx_dict_cached_value.21, align 8
  call void @_Py_INCREF(%struct._object* noundef %536)
  %537 = load %struct._object*, %struct._object** @__pyx_pymod_exec_bubble_sort.__pyx_dict_cached_value.21, align 8
  br label %543

538:                                              ; preds = %527
  %539 = load %struct.__pyx_mstate*, %struct.__pyx_mstate** @__pyx_mstate_global, align 8
  %540 = getelementptr inbounds %struct.__pyx_mstate, %struct.__pyx_mstate* %539, i32 0, i32 14
  %541 = load %struct._object*, %struct._object** %540, align 8
  %542 = call %struct._object* @__Pyx_GetBuiltinName(%struct._object* noundef %541)
  br label %543

543:                                              ; preds = %538, %535
  %544 = phi %struct._object* [ %537, %535 ], [ %542, %538 ]
  br label %550

545:                                              ; preds = %513
  %546 = load %struct.__pyx_mstate*, %struct.__pyx_mstate** @__pyx_mstate_global, align 8
  %547 = getelementptr inbounds %struct.__pyx_mstate, %struct.__pyx_mstate* %546, i32 0, i32 14
  %548 = load %struct._object*, %struct._object** %547, align 8
  %549 = call %struct._object* @__Pyx__GetModuleGlobalName(%struct._object* noundef %548, i64* noundef @__pyx_pymod_exec_bubble_sort.__pyx_dict_version.20, %struct._object** noundef @__pyx_pymod_exec_bubble_sort.__pyx_dict_cached_value.21)
  br label %550

550:                                              ; preds = %545, %543
  %551 = phi %struct._object* [ %544, %543 ], [ %549, %545 ]
  store %struct._object* %551, %struct._object** %8, align 8
  br label %552

552:                                              ; preds = %550
  %553 = load %struct._object*, %struct._object** %8, align 8
  %554 = icmp ne %struct._object* %553, null
  %555 = xor i1 %554, true
  %556 = xor i1 %555, true
  %557 = xor i1 %556, true
  %558 = zext i1 %557 to i32
  %559 = sext i32 %558 to i64
  %560 = icmp ne i64 %559, 0
  br i1 %560, label %561, label %566

561:                                              ; preds = %552
  %562 = load i8*, i8** getelementptr inbounds ([1 x i8*], [1 x i8*]* @__pyx_f, i64 0, i64 0), align 8
  store i8* %562, i8** %11, align 8
  %563 = load i8*, i8** %11, align 8
  store i32 5, i32* %10, align 4
  %564 = load i32, i32* %10, align 4
  store i32 2431, i32* %12, align 4
  %565 = load i32, i32* %12, align 4
  br label %726

566:                                              ; preds = %552
  %567 = load %struct._object*, %struct._object** %8, align 8
  %568 = load %struct.__pyx_mstate*, %struct.__pyx_mstate** @__pyx_mstate_global, align 8
  %569 = getelementptr inbounds %struct.__pyx_mstate, %struct.__pyx_mstate* %568, i32 0, i32 16
  %570 = load %struct._object*, %struct._object** %569, align 8
  %571 = call %struct._object* @__Pyx_PyInt_SubtractObjC(%struct._object* noundef %567, %struct._object* noundef %570, i64 noundef 10, i32 noundef 0, i32 noundef 0)
  store %struct._object* %571, %struct._object** %7, align 8
  %572 = load %struct._object*, %struct._object** %7, align 8
  %573 = icmp ne %struct._object* %572, null
  %574 = xor i1 %573, true
  %575 = xor i1 %574, true
  %576 = xor i1 %575, true
  %577 = zext i1 %576 to i32
  %578 = sext i32 %577 to i64
  %579 = icmp ne i64 %578, 0
  br i1 %579, label %580, label %585

580:                                              ; preds = %566
  %581 = load i8*, i8** getelementptr inbounds ([1 x i8*], [1 x i8*]* @__pyx_f, i64 0, i64 0), align 8
  store i8* %581, i8** %11, align 8
  %582 = load i8*, i8** %11, align 8
  store i32 5, i32* %10, align 4
  %583 = load i32, i32* %10, align 4
  store i32 2433, i32* %12, align 4
  %584 = load i32, i32* %12, align 4
  br label %726

585:                                              ; preds = %566
  %586 = load %struct._object*, %struct._object** %8, align 8
  call void @_Py_DECREF(%struct._object* noundef %586)
  store %struct._object* null, %struct._object** %8, align 8
  %587 = load %struct.__pyx_mstate*, %struct.__pyx_mstate** @__pyx_mstate_global, align 8
  %588 = getelementptr inbounds %struct.__pyx_mstate, %struct.__pyx_mstate* %587, i32 0, i32 0
  %589 = load %struct._object*, %struct._object** %588, align 8
  %590 = load %struct.__pyx_mstate*, %struct.__pyx_mstate** @__pyx_mstate_global, align 8
  %591 = getelementptr inbounds %struct.__pyx_mstate, %struct.__pyx_mstate* %590, i32 0, i32 10
  %592 = load %struct._object*, %struct._object** %591, align 8
  %593 = load %struct._object*, %struct._object** %7, align 8
  %594 = call i32 @PyDict_SetItem(%struct._object* noundef %589, %struct._object* noundef %592, %struct._object* noundef %593)
  %595 = icmp slt i32 %594, 0
  br i1 %595, label %596, label %601

596:                                              ; preds = %585
  %597 = load i8*, i8** getelementptr inbounds ([1 x i8*], [1 x i8*]* @__pyx_f, i64 0, i64 0), align 8
  store i8* %597, i8** %11, align 8
  %598 = load i8*, i8** %11, align 8
  store i32 5, i32* %10, align 4
  %599 = load i32, i32* %10, align 4
  store i32 2436, i32* %12, align 4
  %600 = load i32, i32* %12, align 4
  br label %726

601:                                              ; preds = %585
  %602 = load %struct._object*, %struct._object** %7, align 8
  call void @_Py_DECREF(%struct._object* noundef %602)
  store %struct._object* null, %struct._object** %7, align 8
  br label %694

603:                                              ; preds = %508
  br label %604

604:                                              ; preds = %603
  %605 = load i64, i64* @__pyx_pymod_exec_bubble_sort.__pyx_dict_version.22, align 8
  %606 = load %struct.__pyx_mstate*, %struct.__pyx_mstate** @__pyx_mstate_global, align 8
  %607 = getelementptr inbounds %struct.__pyx_mstate, %struct.__pyx_mstate* %606, i32 0, i32 0
  %608 = load %struct._object*, %struct._object** %607, align 8
  %609 = bitcast %struct._object* %608 to %struct.PyDictObject*
  %610 = getelementptr inbounds %struct.PyDictObject, %struct.PyDictObject* %609, i32 0, i32 2
  %611 = load i64, i64* %610, align 8
  %612 = icmp eq i64 %605, %611
  %613 = xor i1 %612, true
  %614 = xor i1 %613, true
  %615 = zext i1 %614 to i32
  %616 = sext i32 %615 to i64
  %617 = icmp ne i64 %616, 0
  br i1 %617, label %618, label %636

618:                                              ; preds = %604
  %619 = load %struct._object*, %struct._object** @__pyx_pymod_exec_bubble_sort.__pyx_dict_cached_value.23, align 8
  %620 = icmp ne %struct._object* %619, null
  %621 = xor i1 %620, true
  %622 = xor i1 %621, true
  %623 = zext i1 %622 to i32
  %624 = sext i32 %623 to i64
  %625 = icmp ne i64 %624, 0
  br i1 %625, label %626, label %629

626:                                              ; preds = %618
  %627 = load %struct._object*, %struct._object** @__pyx_pymod_exec_bubble_sort.__pyx_dict_cached_value.23, align 8
  call void @_Py_INCREF(%struct._object* noundef %627)
  %628 = load %struct._object*, %struct._object** @__pyx_pymod_exec_bubble_sort.__pyx_dict_cached_value.23, align 8
  br label %634

629:                                              ; preds = %618
  %630 = load %struct.__pyx_mstate*, %struct.__pyx_mstate** @__pyx_mstate_global, align 8
  %631 = getelementptr inbounds %struct.__pyx_mstate, %struct.__pyx_mstate* %630, i32 0, i32 14
  %632 = load %struct._object*, %struct._object** %631, align 8
  %633 = call %struct._object* @__Pyx_GetBuiltinName(%struct._object* noundef %632)
  br label %634

634:                                              ; preds = %629, %626
  %635 = phi %struct._object* [ %628, %626 ], [ %633, %629 ]
  br label %641

636:                                              ; preds = %604
  %637 = load %struct.__pyx_mstate*, %struct.__pyx_mstate** @__pyx_mstate_global, align 8
  %638 = getelementptr inbounds %struct.__pyx_mstate, %struct.__pyx_mstate* %637, i32 0, i32 14
  %639 = load %struct._object*, %struct._object** %638, align 8
  %640 = call %struct._object* @__Pyx__GetModuleGlobalName(%struct._object* noundef %639, i64* noundef @__pyx_pymod_exec_bubble_sort.__pyx_dict_version.22, %struct._object** noundef @__pyx_pymod_exec_bubble_sort.__pyx_dict_cached_value.23)
  br label %641

641:                                              ; preds = %636, %634
  %642 = phi %struct._object* [ %635, %634 ], [ %640, %636 ]
  store %struct._object* %642, %struct._object** %7, align 8
  br label %643

643:                                              ; preds = %641
  %644 = load %struct._object*, %struct._object** %7, align 8
  %645 = icmp ne %struct._object* %644, null
  %646 = xor i1 %645, true
  %647 = xor i1 %646, true
  %648 = xor i1 %647, true
  %649 = zext i1 %648 to i32
  %650 = sext i32 %649 to i64
  %651 = icmp ne i64 %650, 0
  br i1 %651, label %652, label %657

652:                                              ; preds = %643
  %653 = load i8*, i8** getelementptr inbounds ([1 x i8*], [1 x i8*]* @__pyx_f, i64 0, i64 0), align 8
  store i8* %653, i8** %11, align 8
  %654 = load i8*, i8** %11, align 8
  store i32 7, i32* %10, align 4
  %655 = load i32, i32* %10, align 4
  store i32 2455, i32* %12, align 4
  %656 = load i32, i32* %12, align 4
  br label %726

657:                                              ; preds = %643
  %658 = load %struct._object*, %struct._object** %7, align 8
  %659 = load %struct.__pyx_mstate*, %struct.__pyx_mstate** @__pyx_mstate_global, align 8
  %660 = getelementptr inbounds %struct.__pyx_mstate, %struct.__pyx_mstate* %659, i32 0, i32 16
  %661 = load %struct._object*, %struct._object** %660, align 8
  %662 = call %struct._object* @__Pyx_PyInt_AddObjC(%struct._object* noundef %658, %struct._object* noundef %661, i64 noundef 10, i32 noundef 0, i32 noundef 0)
  store %struct._object* %662, %struct._object** %8, align 8
  %663 = load %struct._object*, %struct._object** %8, align 8
  %664 = icmp ne %struct._object* %663, null
  %665 = xor i1 %664, true
  %666 = xor i1 %665, true
  %667 = xor i1 %666, true
  %668 = zext i1 %667 to i32
  %669 = sext i32 %668 to i64
  %670 = icmp ne i64 %669, 0
  br i1 %670, label %671, label %676

671:                                              ; preds = %657
  %672 = load i8*, i8** getelementptr inbounds ([1 x i8*], [1 x i8*]* @__pyx_f, i64 0, i64 0), align 8
  store i8* %672, i8** %11, align 8
  %673 = load i8*, i8** %11, align 8
  store i32 7, i32* %10, align 4
  %674 = load i32, i32* %10, align 4
  store i32 2457, i32* %12, align 4
  %675 = load i32, i32* %12, align 4
  br label %726

676:                                              ; preds = %657
  %677 = load %struct._object*, %struct._object** %7, align 8
  call void @_Py_DECREF(%struct._object* noundef %677)
  store %struct._object* null, %struct._object** %7, align 8
  %678 = load %struct.__pyx_mstate*, %struct.__pyx_mstate** @__pyx_mstate_global, align 8
  %679 = getelementptr inbounds %struct.__pyx_mstate, %struct.__pyx_mstate* %678, i32 0, i32 0
  %680 = load %struct._object*, %struct._object** %679, align 8
  %681 = load %struct.__pyx_mstate*, %struct.__pyx_mstate** @__pyx_mstate_global, align 8
  %682 = getelementptr inbounds %struct.__pyx_mstate, %struct.__pyx_mstate* %681, i32 0, i32 10
  %683 = load %struct._object*, %struct._object** %682, align 8
  %684 = load %struct._object*, %struct._object** %8, align 8
  %685 = call i32 @PyDict_SetItem(%struct._object* noundef %680, %struct._object* noundef %683, %struct._object* noundef %684)
  %686 = icmp slt i32 %685, 0
  br i1 %686, label %687, label %692

687:                                              ; preds = %676
  %688 = load i8*, i8** getelementptr inbounds ([1 x i8*], [1 x i8*]* @__pyx_f, i64 0, i64 0), align 8
  store i8* %688, i8** %11, align 8
  %689 = load i8*, i8** %11, align 8
  store i32 7, i32* %10, align 4
  %690 = load i32, i32* %10, align 4
  store i32 2460, i32* %12, align 4
  %691 = load i32, i32* %12, align 4
  br label %726

692:                                              ; preds = %676
  %693 = load %struct._object*, %struct._object** %8, align 8
  call void @_Py_DECREF(%struct._object* noundef %693)
  store %struct._object* null, %struct._object** %8, align 8
  br label %694

694:                                              ; preds = %692, %601
  %695 = call %struct._object* @PyDict_New()
  store %struct._object* %695, %struct._object** %8, align 8
  %696 = load %struct._object*, %struct._object** %8, align 8
  %697 = icmp ne %struct._object* %696, null
  %698 = xor i1 %697, true
  %699 = xor i1 %698, true
  %700 = xor i1 %699, true
  %701 = zext i1 %700 to i32
  %702 = sext i32 %701 to i64
  %703 = icmp ne i64 %702, 0
  br i1 %703, label %704, label %709

704:                                              ; preds = %694
  %705 = load i8*, i8** getelementptr inbounds ([1 x i8*], [1 x i8*]* @__pyx_f, i64 0, i64 0), align 8
  store i8* %705, i8** %11, align 8
  %706 = load i8*, i8** %11, align 8
  store i32 1, i32* %10, align 4
  %707 = load i32, i32* %10, align 4
  store i32 2470, i32* %12, align 4
  %708 = load i32, i32* %12, align 4
  br label %726

709:                                              ; preds = %694
  %710 = load %struct.__pyx_mstate*, %struct.__pyx_mstate** @__pyx_mstate_global, align 8
  %711 = getelementptr inbounds %struct.__pyx_mstate, %struct.__pyx_mstate* %710, i32 0, i32 0
  %712 = load %struct._object*, %struct._object** %711, align 8
  %713 = load %struct.__pyx_mstate*, %struct.__pyx_mstate** @__pyx_mstate_global, align 8
  %714 = getelementptr inbounds %struct.__pyx_mstate, %struct.__pyx_mstate* %713, i32 0, i32 11
  %715 = load %struct._object*, %struct._object** %714, align 8
  %716 = load %struct._object*, %struct._object** %8, align 8
  %717 = call i32 @PyDict_SetItem(%struct._object* noundef %712, %struct._object* noundef %715, %struct._object* noundef %716)
  %718 = icmp slt i32 %717, 0
  br i1 %718, label %719, label %724

719:                                              ; preds = %709
  %720 = load i8*, i8** getelementptr inbounds ([1 x i8*], [1 x i8*]* @__pyx_f, i64 0, i64 0), align 8
  store i8* %720, i8** %11, align 8
  %721 = load i8*, i8** %11, align 8
  store i32 1, i32* %10, align 4
  %722 = load i32, i32* %10, align 4
  store i32 2472, i32* %12, align 4
  %723 = load i32, i32* %12, align 4
  br label %726

724:                                              ; preds = %709
  %725 = load %struct._object*, %struct._object** %8, align 8
  call void @_Py_DECREF(%struct._object* noundef %725)
  store %struct._object* null, %struct._object** %8, align 8
  br label %760

726:                                              ; preds = %719, %704, %687, %671, %652, %596, %580, %561, %503, %485, %430, %413, %396, %342, %288, %271, %247, %239, %230, %211, %195, %177, %169, %161, %142, %123, %104, %95, %83, %64, %42
  %727 = load %struct._object*, %struct._object** %6, align 8
  call void @_Py_XDECREF(%struct._object* noundef %727)
  %728 = load %struct._object*, %struct._object** %7, align 8
  call void @_Py_XDECREF(%struct._object* noundef %728)
  %729 = load %struct._object*, %struct._object** %8, align 8
  call void @_Py_XDECREF(%struct._object* noundef %729)
  %730 = load %struct._object*, %struct._object** @__pyx_m, align 8
  %731 = icmp ne %struct._object* %730, null
  br i1 %731, label %732, label %753

732:                                              ; preds = %726
  %733 = load %struct.__pyx_mstate*, %struct.__pyx_mstate** @__pyx_mstate_global, align 8
  %734 = getelementptr inbounds %struct.__pyx_mstate, %struct.__pyx_mstate* %733, i32 0, i32 0
  %735 = load %struct._object*, %struct._object** %734, align 8
  %736 = icmp ne %struct._object* %735, null
  br i1 %736, label %737, label %744

737:                                              ; preds = %732
  %738 = load i32, i32* %4, align 4
  %739 = icmp ne i32 %738, 0
  br i1 %739, label %740, label %744

740:                                              ; preds = %737
  %741 = load i32, i32* %12, align 4
  %742 = load i32, i32* %10, align 4
  %743 = load i8*, i8** %11, align 8
  call void @__Pyx_AddTraceback(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.24, i64 0, i64 0), i32 noundef %741, i32 noundef %742, i8* noundef %743)
  br label %744

744:                                              ; preds = %740, %737, %732
  br label %745

745:                                              ; preds = %744
  %746 = load %struct._object*, %struct._object** @__pyx_m, align 8
  store %struct._object* %746, %struct._object** %14, align 8
  %747 = load %struct._object*, %struct._object** %14, align 8
  %748 = icmp ne %struct._object* %747, null
  br i1 %748, label %749, label %751

749:                                              ; preds = %745
  store %struct._object* null, %struct._object** @__pyx_m, align 8
  %750 = load %struct._object*, %struct._object** %14, align 8
  call void @_Py_DECREF(%struct._object* noundef %750)
  br label %751

751:                                              ; preds = %749, %745
  br label %752

752:                                              ; preds = %751
  br label %759

753:                                              ; preds = %726
  %754 = call %struct._object* @PyErr_Occurred()
  %755 = icmp ne %struct._object* %754, null
  br i1 %755, label %758, label %756

756:                                              ; preds = %753
  %757 = load %struct._object*, %struct._object** @PyExc_ImportError, align 8
  call void @PyErr_SetString(%struct._object* noundef %757, i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.24, i64 0, i64 0))
  br label %758

758:                                              ; preds = %756, %753
  br label %759

759:                                              ; preds = %758, %752
  br label %760

760:                                              ; preds = %759, %724
  %761 = load %struct._object*, %struct._object** @__pyx_m, align 8
  %762 = icmp ne %struct._object* %761, null
  %763 = zext i1 %762 to i64
  %764 = select i1 %762, i32 0, i32 -1
  store i32 %764, i32* %2, align 4
  br label %765

765:                                              ; preds = %760, %22, %21
  %766 = load i32, i32* %2, align 4
  ret i32 %766
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @__Pyx_check_single_interpreter() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i64, align 8
  %3 = call %struct._ts* @PyThreadState_Get()
  %4 = getelementptr inbounds %struct._ts, %struct._ts* %3, i32 0, i32 2
  %5 = load %struct._is*, %struct._is** %4, align 8
  %6 = call i64 @PyInterpreterState_GetID(%struct._is* noundef %5)
  store i64 %6, i64* %2, align 8
  %7 = load i64, i64* @__Pyx_check_single_interpreter.main_interpreter_id, align 8
  %8 = icmp eq i64 %7, -1
  br i1 %8, label %9, label %20

9:                                                ; preds = %0
  %10 = load i64, i64* %2, align 8
  store i64 %10, i64* @__Pyx_check_single_interpreter.main_interpreter_id, align 8
  %11 = load i64, i64* %2, align 8
  %12 = icmp eq i64 %11, -1
  %13 = xor i1 %12, true
  %14 = xor i1 %13, true
  %15 = zext i1 %14 to i32
  %16 = sext i32 %15 to i64
  %17 = icmp ne i64 %16, 0
  %18 = zext i1 %17 to i64
  %19 = select i1 %17, i32 -1, i32 0
  store i32 %19, i32* %1, align 4
  br label %33

20:                                               ; preds = %0
  %21 = load i64, i64* @__Pyx_check_single_interpreter.main_interpreter_id, align 8
  %22 = load i64, i64* %2, align 8
  %23 = icmp ne i64 %21, %22
  %24 = xor i1 %23, true
  %25 = xor i1 %24, true
  %26 = zext i1 %25 to i32
  %27 = sext i32 %26 to i64
  %28 = icmp ne i64 %27, 0
  br i1 %28, label %29, label %31

29:                                               ; preds = %20
  %30 = load %struct._object*, %struct._object** @PyExc_ImportError, align 8
  call void @PyErr_SetString(%struct._object* noundef %30, i8* noundef getelementptr inbounds ([95 x i8], [95 x i8]* @.str.10, i64 0, i64 0))
  store i32 -1, i32* %1, align 4
  br label %33

31:                                               ; preds = %20
  br label %32

32:                                               ; preds = %31
  store i32 0, i32* %1, align 4
  br label %33

33:                                               ; preds = %32, %29, %9
  %34 = load i32, i32* %1, align 4
  ret i32 %34
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @_Py_INCREF(%struct._object* noundef %0) #0 {
  %2 = alloca %struct._object*, align 8
  store %struct._object* %0, %struct._object** %2, align 8
  %3 = load %struct._object*, %struct._object** %2, align 8
  %4 = getelementptr inbounds %struct._object, %struct._object* %3, i32 0, i32 0
  %5 = load i64, i64* %4, align 8
  %6 = add nsw i64 %5, 1
  store i64 %6, i64* %4, align 8
  ret void
}

declare %struct._object* @PyObject_GetAttrString(%struct._object* noundef, i8* noundef) #1

declare %struct._object* @PyModule_NewObject(%struct._object* noundef) #1

; Function Attrs: noinline nounwind optnone uwtable
define internal void @_Py_DECREF(%struct._object* noundef %0) #0 {
  %2 = alloca %struct._object*, align 8
  store %struct._object* %0, %struct._object** %2, align 8
  %3 = load %struct._object*, %struct._object** %2, align 8
  %4 = getelementptr inbounds %struct._object, %struct._object* %3, i32 0, i32 0
  %5 = load i64, i64* %4, align 8
  %6 = add nsw i64 %5, -1
  store i64 %6, i64* %4, align 8
  %7 = icmp ne i64 %6, 0
  br i1 %7, label %8, label %9

8:                                                ; preds = %1
  br label %11

9:                                                ; preds = %1
  %10 = load %struct._object*, %struct._object** %2, align 8
  call void @_Py_Dealloc(%struct._object* noundef %10)
  br label %11

11:                                               ; preds = %9, %8
  ret void
}

declare %struct._object* @PyModule_GetDict(%struct._object* noundef) #1

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @__Pyx_copy_spec_to_module(%struct._object* noundef %0, %struct._object* noundef %1, i8* noundef %2, i8* noundef %3, i32 noundef %4) #0 {
  %6 = alloca %struct._object*, align 8
  %7 = alloca %struct._object*, align 8
  %8 = alloca i8*, align 8
  %9 = alloca i8*, align 8
  %10 = alloca i32, align 4
  %11 = alloca %struct._object*, align 8
  %12 = alloca i32, align 4
  store %struct._object* %0, %struct._object** %6, align 8
  store %struct._object* %1, %struct._object** %7, align 8
  store i8* %2, i8** %8, align 8
  store i8* %3, i8** %9, align 8
  store i32 %4, i32* %10, align 4
  %13 = load %struct._object*, %struct._object** %6, align 8
  %14 = load i8*, i8** %8, align 8
  %15 = call %struct._object* @PyObject_GetAttrString(%struct._object* noundef %13, i8* noundef %14)
  store %struct._object* %15, %struct._object** %11, align 8
  store i32 0, i32* %12, align 4
  %16 = load %struct._object*, %struct._object** %11, align 8
  %17 = icmp ne %struct._object* %16, null
  %18 = xor i1 %17, true
  %19 = xor i1 %18, true
  %20 = zext i1 %19 to i32
  %21 = sext i32 %20 to i64
  %22 = icmp ne i64 %21, 0
  br i1 %22, label %23, label %36

23:                                               ; preds = %5
  %24 = load i32, i32* %10, align 4
  %25 = icmp ne i32 %24, 0
  br i1 %25, label %29, label %26

26:                                               ; preds = %23
  %27 = load %struct._object*, %struct._object** %11, align 8
  %28 = icmp ne %struct._object* %27, @_Py_NoneStruct
  br i1 %28, label %29, label %34

29:                                               ; preds = %26, %23
  %30 = load %struct._object*, %struct._object** %7, align 8
  %31 = load i8*, i8** %9, align 8
  %32 = load %struct._object*, %struct._object** %11, align 8
  %33 = call i32 @PyDict_SetItemString(%struct._object* noundef %30, i8* noundef %31, %struct._object* noundef %32)
  store i32 %33, i32* %12, align 4
  br label %34

34:                                               ; preds = %29, %26
  %35 = load %struct._object*, %struct._object** %11, align 8
  call void @_Py_DECREF(%struct._object* noundef %35)
  br label %43

36:                                               ; preds = %5
  %37 = load %struct._object*, %struct._object** @PyExc_AttributeError, align 8
  %38 = call i32 @PyErr_ExceptionMatches(%struct._object* noundef %37)
  %39 = icmp ne i32 %38, 0
  br i1 %39, label %40, label %41

40:                                               ; preds = %36
  call void @PyErr_Clear()
  br label %42

41:                                               ; preds = %36
  store i32 -1, i32* %12, align 4
  br label %42

42:                                               ; preds = %41, %40
  br label %43

43:                                               ; preds = %42, %34
  %44 = load i32, i32* %12, align 4
  ret i32 %44
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @_Py_XDECREF(%struct._object* noundef %0) #0 {
  %2 = alloca %struct._object*, align 8
  store %struct._object* %0, %struct._object** %2, align 8
  %3 = load %struct._object*, %struct._object** %2, align 8
  %4 = icmp ne %struct._object* %3, null
  br i1 %4, label %5, label %7

5:                                                ; preds = %1
  %6 = load %struct._object*, %struct._object** %2, align 8
  call void @_Py_DECREF(%struct._object* noundef %6)
  br label %7

7:                                                ; preds = %5, %1
  ret void
}

declare i64 @PyInterpreterState_GetID(%struct._is* noundef) #1

declare %struct._ts* @PyThreadState_Get() #1

declare void @PyErr_SetString(%struct._object* noundef, i8* noundef) #1

declare void @_Py_Dealloc(%struct._object* noundef) #1

declare i32 @PyDict_SetItemString(%struct._object* noundef, i8* noundef, %struct._object* noundef) #1

declare i32 @PyErr_ExceptionMatches(%struct._object* noundef) #1

declare void @PyErr_Clear() #1

; Function Attrs: noinline nounwind optnone uwtable
define internal %struct._object* @__Pyx_PyImport_AddModuleRef(i8* noundef %0) #0 {
  %2 = alloca i8*, align 8
  %3 = alloca %struct._object*, align 8
  store i8* %0, i8** %2, align 8
  %4 = load i8*, i8** %2, align 8
  %5 = call %struct._object* @PyImport_AddModule(i8* noundef %4)
  store %struct._object* %5, %struct._object** %3, align 8
  %6 = load %struct._object*, %struct._object** %3, align 8
  call void @_Py_XINCREF(%struct._object* noundef %6)
  %7 = load %struct._object*, %struct._object** %3, align 8
  ret %struct._object* %7
}

declare i32 @PyObject_SetAttrString(%struct._object* noundef, i8* noundef, %struct._object* noundef) #1

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @__Pyx_check_binary_version(i64 noundef %0, i64 noundef %1, i32 noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i64, align 8
  %6 = alloca i64, align 8
  %7 = alloca i32, align 4
  %8 = alloca i64, align 8
  %9 = alloca [200 x i8], align 16
  store i64 %0, i64* %5, align 8
  store i64 %1, i64* %6, align 8
  store i32 %2, i32* %7, align 4
  store i64 4294901760, i64* %8, align 8
  %10 = load i64, i64* %6, align 8
  %11 = and i64 %10, 4294901760
  %12 = load i64, i64* %5, align 8
  %13 = and i64 %12, 4294901760
  %14 = icmp eq i64 %11, %13
  br i1 %14, label %15, label %16

15:                                               ; preds = %3
  store i32 0, i32* %4, align 4
  br label %56

16:                                               ; preds = %3
  %17 = load i32, i32* %7, align 4
  %18 = icmp ne i32 %17, 0
  br i1 %18, label %19, label %25

19:                                               ; preds = %16
  %20 = load i64, i64* %6, align 8
  %21 = and i64 %20, 4294901760
  %22 = load i64, i64* %5, align 8
  %23 = and i64 %22, 4294901760
  %24 = icmp ugt i64 %21, %23
  br label %25

25:                                               ; preds = %19, %16
  %26 = phi i1 [ false, %16 ], [ %24, %19 ]
  %27 = xor i1 %26, true
  %28 = xor i1 %27, true
  %29 = zext i1 %28 to i32
  %30 = sext i32 %29 to i64
  %31 = icmp ne i64 %30, 0
  br i1 %31, label %32, label %33

32:                                               ; preds = %25
  store i32 1, i32* %4, align 4
  br label %56

33:                                               ; preds = %25
  %34 = getelementptr inbounds [200 x i8], [200 x i8]* %9, i64 0, i64 0
  %35 = load i64, i64* %5, align 8
  %36 = lshr i64 %35, 24
  %37 = trunc i64 %36 to i32
  %38 = load i64, i64* %5, align 8
  %39 = lshr i64 %38, 16
  %40 = and i64 %39, 255
  %41 = trunc i64 %40 to i32
  %42 = load i32, i32* %7, align 4
  %43 = icmp ne i32 %42, 0
  %44 = zext i1 %43 to i64
  %45 = select i1 %43, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.27, i64 0, i64 0), i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.28, i64 0, i64 0)
  %46 = load i64, i64* %6, align 8
  %47 = lshr i64 %46, 24
  %48 = trunc i64 %47 to i32
  %49 = load i64, i64* %6, align 8
  %50 = lshr i64 %49, 16
  %51 = and i64 %50, 255
  %52 = trunc i64 %51 to i32
  %53 = call i32 (i8*, i64, i8*, ...) @PyOS_snprintf(i8* noundef %34, i64 noundef 200, i8* noundef getelementptr inbounds ([78 x i8], [78 x i8]* @.str.26, i64 0, i64 0), i32 noundef %37, i32 noundef %41, i8* noundef getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i64 0, i64 0), i8* noundef %45, i32 noundef %48, i32 noundef %52)
  %54 = getelementptr inbounds [200 x i8], [200 x i8]* %9, i64 0, i64 0
  %55 = call i32 @PyErr_WarnEx(%struct._object* noundef null, i8* noundef %54, i64 noundef 1)
  store i32 %55, i32* %4, align 4
  br label %56

56:                                               ; preds = %33, %32, %15
  %57 = load i32, i32* %4, align 4
  ret i32 %57
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i64 @__Pyx_get_runtime_version() #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i64, align 8
  %3 = alloca i64, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = call i8* @Py_GetVersion()
  store i8* %6, i8** %1, align 8
  store i64 0, i64* %2, align 8
  store i64 16777216, i64* %3, align 8
  store i32 0, i32* %4, align 4
  store i32 0, i32* %5, align 4
  br label %7

7:                                                ; preds = %57, %0
  %8 = load i64, i64* %3, align 8
  %9 = icmp ne i64 %8, 0
  br i1 %9, label %10, label %62

10:                                               ; preds = %7
  br label %11

11:                                               ; preds = %29, %10
  %12 = load i8*, i8** %1, align 8
  %13 = load i32, i32* %5, align 4
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds i8, i8* %12, i64 %14
  %16 = load i8, i8* %15, align 1
  %17 = sext i8 %16 to i32
  %18 = icmp sle i32 48, %17
  br i1 %18, label %19, label %27

19:                                               ; preds = %11
  %20 = load i8*, i8** %1, align 8
  %21 = load i32, i32* %5, align 4
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds i8, i8* %20, i64 %22
  %24 = load i8, i8* %23, align 1
  %25 = sext i8 %24 to i32
  %26 = icmp sle i32 %25, 57
  br label %27

27:                                               ; preds = %19, %11
  %28 = phi i1 [ false, %11 ], [ %26, %19 ]
  br i1 %28, label %29, label %42

29:                                               ; preds = %27
  %30 = load i32, i32* %4, align 4
  %31 = mul i32 %30, 10
  %32 = load i8*, i8** %1, align 8
  %33 = load i32, i32* %5, align 4
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds i8, i8* %32, i64 %34
  %36 = load i8, i8* %35, align 1
  %37 = sext i8 %36 to i32
  %38 = sub nsw i32 %37, 48
  %39 = add i32 %31, %38
  store i32 %39, i32* %4, align 4
  %40 = load i32, i32* %5, align 4
  %41 = add nsw i32 %40, 1
  store i32 %41, i32* %5, align 4
  br label %11, !llvm.loop !6

42:                                               ; preds = %27
  %43 = load i64, i64* %3, align 8
  %44 = load i32, i32* %4, align 4
  %45 = zext i32 %44 to i64
  %46 = mul i64 %43, %45
  %47 = load i64, i64* %2, align 8
  %48 = add i64 %47, %46
  store i64 %48, i64* %2, align 8
  %49 = load i8*, i8** %1, align 8
  %50 = load i32, i32* %5, align 4
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds i8, i8* %49, i64 %51
  %53 = load i8, i8* %52, align 1
  %54 = sext i8 %53 to i32
  %55 = icmp ne i32 %54, 46
  br i1 %55, label %56, label %57

56:                                               ; preds = %42
  br label %62

57:                                               ; preds = %42
  store i32 0, i32* %4, align 4
  %58 = load i64, i64* %3, align 8
  %59 = lshr i64 %58, 8
  store i64 %59, i64* %3, align 8
  %60 = load i32, i32* %5, align 4
  %61 = add nsw i32 %60, 1
  store i32 %61, i32* %5, align 4
  br label %7, !llvm.loop !8

62:                                               ; preds = %56, %7
  %63 = load i64, i64* %2, align 8
  ret i64 %63
}

declare %struct._object* @PyTuple_New(i64 noundef) #1

declare %struct._object* @PyBytes_FromStringAndSize(i8* noundef, i64 noundef) #1

declare %struct._object* @PyUnicode_FromStringAndSize(i8* noundef, i64 noundef) #1

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @__Pyx_InitConstants() #0 {
  %1 = alloca i32, align 4
  %2 = call i32 @__Pyx_CreateStringTabAndInitStrings()
  %3 = icmp slt i32 %2, 0
  br i1 %3, label %4, label %9

4:                                                ; preds = %0
  %5 = load i8*, i8** getelementptr inbounds ([1 x i8*], [1 x i8*]* @__pyx_f, i64 0, i64 0), align 8
  store i8* %5, i8** @__pyx_filename, align 8
  %6 = load i8*, i8** @__pyx_filename, align 8
  store i32 1, i32* @__pyx_lineno, align 4
  %7 = load i32, i32* @__pyx_lineno, align 4
  store i32 2018, i32* @__pyx_clineno, align 4
  %8 = load i32, i32* @__pyx_clineno, align 4
  br label %67

9:                                                ; preds = %0
  %10 = call %struct._object* @PyLong_FromLong(i64 noundef 5)
  %11 = load %struct.__pyx_mstate*, %struct.__pyx_mstate** @__pyx_mstate_global, align 8
  %12 = getelementptr inbounds %struct.__pyx_mstate, %struct.__pyx_mstate* %11, i32 0, i32 15
  store %struct._object* %10, %struct._object** %12, align 8
  %13 = load %struct.__pyx_mstate*, %struct.__pyx_mstate** @__pyx_mstate_global, align 8
  %14 = getelementptr inbounds %struct.__pyx_mstate, %struct.__pyx_mstate* %13, i32 0, i32 15
  %15 = load %struct._object*, %struct._object** %14, align 8
  %16 = icmp ne %struct._object* %15, null
  %17 = xor i1 %16, true
  %18 = xor i1 %17, true
  %19 = xor i1 %18, true
  %20 = zext i1 %19 to i32
  %21 = sext i32 %20 to i64
  %22 = icmp ne i64 %21, 0
  br i1 %22, label %23, label %28

23:                                               ; preds = %9
  %24 = load i8*, i8** getelementptr inbounds ([1 x i8*], [1 x i8*]* @__pyx_f, i64 0, i64 0), align 8
  store i8* %24, i8** @__pyx_filename, align 8
  %25 = load i8*, i8** @__pyx_filename, align 8
  store i32 1, i32* @__pyx_lineno, align 4
  %26 = load i32, i32* @__pyx_lineno, align 4
  store i32 2019, i32* @__pyx_clineno, align 4
  %27 = load i32, i32* @__pyx_clineno, align 4
  br label %67

28:                                               ; preds = %9
  %29 = call %struct._object* @PyLong_FromLong(i64 noundef 10)
  %30 = load %struct.__pyx_mstate*, %struct.__pyx_mstate** @__pyx_mstate_global, align 8
  %31 = getelementptr inbounds %struct.__pyx_mstate, %struct.__pyx_mstate* %30, i32 0, i32 16
  store %struct._object* %29, %struct._object** %31, align 8
  %32 = load %struct.__pyx_mstate*, %struct.__pyx_mstate** @__pyx_mstate_global, align 8
  %33 = getelementptr inbounds %struct.__pyx_mstate, %struct.__pyx_mstate* %32, i32 0, i32 16
  %34 = load %struct._object*, %struct._object** %33, align 8
  %35 = icmp ne %struct._object* %34, null
  %36 = xor i1 %35, true
  %37 = xor i1 %36, true
  %38 = xor i1 %37, true
  %39 = zext i1 %38 to i32
  %40 = sext i32 %39 to i64
  %41 = icmp ne i64 %40, 0
  br i1 %41, label %42, label %47

42:                                               ; preds = %28
  %43 = load i8*, i8** getelementptr inbounds ([1 x i8*], [1 x i8*]* @__pyx_f, i64 0, i64 0), align 8
  store i8* %43, i8** @__pyx_filename, align 8
  %44 = load i8*, i8** @__pyx_filename, align 8
  store i32 1, i32* @__pyx_lineno, align 4
  %45 = load i32, i32* @__pyx_lineno, align 4
  store i32 2020, i32* @__pyx_clineno, align 4
  %46 = load i32, i32* @__pyx_clineno, align 4
  br label %67

47:                                               ; preds = %28
  %48 = call %struct._object* @PyLong_FromLong(i64 noundef 50)
  %49 = load %struct.__pyx_mstate*, %struct.__pyx_mstate** @__pyx_mstate_global, align 8
  %50 = getelementptr inbounds %struct.__pyx_mstate, %struct.__pyx_mstate* %49, i32 0, i32 17
  store %struct._object* %48, %struct._object** %50, align 8
  %51 = load %struct.__pyx_mstate*, %struct.__pyx_mstate** @__pyx_mstate_global, align 8
  %52 = getelementptr inbounds %struct.__pyx_mstate, %struct.__pyx_mstate* %51, i32 0, i32 17
  %53 = load %struct._object*, %struct._object** %52, align 8
  %54 = icmp ne %struct._object* %53, null
  %55 = xor i1 %54, true
  %56 = xor i1 %55, true
  %57 = xor i1 %56, true
  %58 = zext i1 %57 to i32
  %59 = sext i32 %58 to i64
  %60 = icmp ne i64 %59, 0
  br i1 %60, label %61, label %66

61:                                               ; preds = %47
  %62 = load i8*, i8** getelementptr inbounds ([1 x i8*], [1 x i8*]* @__pyx_f, i64 0, i64 0), align 8
  store i8* %62, i8** @__pyx_filename, align 8
  %63 = load i8*, i8** @__pyx_filename, align 8
  store i32 1, i32* @__pyx_lineno, align 4
  %64 = load i32, i32* @__pyx_lineno, align 4
  store i32 2021, i32* @__pyx_clineno, align 4
  %65 = load i32, i32* @__pyx_clineno, align 4
  br label %67

66:                                               ; preds = %47
  store i32 0, i32* %1, align 4
  br label %68

67:                                               ; preds = %61, %42, %23, %4
  store i32 -1, i32* %1, align 4
  br label %68

68:                                               ; preds = %67, %66
  %69 = load i32, i32* %1, align 4
  ret i32 %69
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @__Pyx_InitGlobals() #0 {
  ret i32 0
}

declare i32 @PyObject_SetAttr(%struct._object* noundef, %struct._object* noundef, %struct._object* noundef) #1

declare %struct._object* @PyImport_GetModuleDict() #1

declare %struct._object* @PyDict_GetItemString(%struct._object* noundef, i8* noundef) #1

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @__Pyx_InitCachedBuiltins() #0 {
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @__Pyx_InitCachedConstants() #0 {
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @__Pyx_modinit_global_init_code() #0 {
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @__Pyx_modinit_variable_export_code() #0 {
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @__Pyx_modinit_function_export_code() #0 {
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @__Pyx_modinit_type_init_code() #0 {
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @__Pyx_modinit_type_import_code() #0 {
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @__Pyx_modinit_variable_import_code() #0 {
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @__Pyx_modinit_function_import_code() #0 {
  ret i32 0
}

declare i32 @PyDict_SetItem(%struct._object* noundef, %struct._object* noundef, %struct._object* noundef) #1

; Function Attrs: noinline nounwind optnone uwtable
define internal %struct._object* @__Pyx_GetBuiltinName(%struct._object* noundef %0) #0 {
  %2 = alloca %struct._object*, align 8
  %3 = alloca %struct._object*, align 8
  store %struct._object* %0, %struct._object** %2, align 8
  %4 = load %struct.__pyx_mstate*, %struct.__pyx_mstate** @__pyx_mstate_global, align 8
  %5 = getelementptr inbounds %struct.__pyx_mstate, %struct.__pyx_mstate* %4, i32 0, i32 1
  %6 = load %struct._object*, %struct._object** %5, align 8
  %7 = load %struct._object*, %struct._object** %2, align 8
  %8 = call %struct._object* @__Pyx_PyObject_GetAttrStrNoError(%struct._object* noundef %6, %struct._object* noundef %7)
  store %struct._object* %8, %struct._object** %3, align 8
  %9 = load %struct._object*, %struct._object** %3, align 8
  %10 = icmp ne %struct._object* %9, null
  %11 = xor i1 %10, true
  %12 = xor i1 %11, true
  %13 = xor i1 %12, true
  %14 = zext i1 %13 to i32
  %15 = sext i32 %14 to i64
  %16 = icmp ne i64 %15, 0
  br i1 %16, label %17, label %24

17:                                               ; preds = %1
  %18 = call %struct._object* @PyErr_Occurred()
  %19 = icmp ne %struct._object* %18, null
  br i1 %19, label %24, label %20

20:                                               ; preds = %17
  %21 = load %struct._object*, %struct._object** @PyExc_NameError, align 8
  %22 = load %struct._object*, %struct._object** %2, align 8
  %23 = call %struct._object* (%struct._object*, i8*, ...) @PyErr_Format(%struct._object* noundef %21, i8* noundef getelementptr inbounds ([25 x i8], [25 x i8]* @.str.29, i64 0, i64 0), %struct._object* noundef %22)
  br label %24

24:                                               ; preds = %20, %17, %1
  %25 = load %struct._object*, %struct._object** %3, align 8
  ret %struct._object* %25
}

; Function Attrs: noinline nounwind optnone uwtable
define internal %struct._object* @__Pyx__GetModuleGlobalName(%struct._object* noundef %0, i64* noundef %1, %struct._object** noundef %2) #0 {
  %4 = alloca %struct._object*, align 8
  %5 = alloca %struct._object*, align 8
  %6 = alloca i64*, align 8
  %7 = alloca %struct._object**, align 8
  %8 = alloca %struct._object*, align 8
  store %struct._object* %0, %struct._object** %5, align 8
  store i64* %1, i64** %6, align 8
  store %struct._object** %2, %struct._object*** %7, align 8
  %9 = load %struct.__pyx_mstate*, %struct.__pyx_mstate** @__pyx_mstate_global, align 8
  %10 = getelementptr inbounds %struct.__pyx_mstate, %struct.__pyx_mstate* %9, i32 0, i32 0
  %11 = load %struct._object*, %struct._object** %10, align 8
  %12 = load %struct._object*, %struct._object** %5, align 8
  %13 = load %struct._object*, %struct._object** %5, align 8
  %14 = bitcast %struct._object* %13 to %struct.PyASCIIObject*
  %15 = getelementptr inbounds %struct.PyASCIIObject, %struct.PyASCIIObject* %14, i32 0, i32 2
  %16 = load i64, i64* %15, align 8
  %17 = call %struct._object* @_PyDict_GetItem_KnownHash(%struct._object* noundef %11, %struct._object* noundef %12, i64 noundef %16)
  store %struct._object* %17, %struct._object** %8, align 8
  %18 = load %struct.__pyx_mstate*, %struct.__pyx_mstate** @__pyx_mstate_global, align 8
  %19 = getelementptr inbounds %struct.__pyx_mstate, %struct.__pyx_mstate* %18, i32 0, i32 0
  %20 = load %struct._object*, %struct._object** %19, align 8
  %21 = bitcast %struct._object* %20 to %struct.PyDictObject*
  %22 = getelementptr inbounds %struct.PyDictObject, %struct.PyDictObject* %21, i32 0, i32 2
  %23 = load i64, i64* %22, align 8
  %24 = load i64*, i64** %6, align 8
  store i64 %23, i64* %24, align 8
  %25 = load %struct._object*, %struct._object** %8, align 8
  %26 = load %struct._object**, %struct._object*** %7, align 8
  store %struct._object* %25, %struct._object** %26, align 8
  %27 = load %struct._object*, %struct._object** %8, align 8
  %28 = icmp ne %struct._object* %27, null
  %29 = xor i1 %28, true
  %30 = xor i1 %29, true
  %31 = zext i1 %30 to i32
  %32 = sext i32 %31 to i64
  %33 = icmp ne i64 %32, 0
  br i1 %33, label %34, label %37

34:                                               ; preds = %3
  %35 = load %struct._object*, %struct._object** %8, align 8
  call void @_Py_INCREF(%struct._object* noundef %35)
  %36 = load %struct._object*, %struct._object** %8, align 8
  store %struct._object* %36, %struct._object** %4, align 8
  br label %50

37:                                               ; preds = %3
  %38 = call %struct._object* @PyErr_Occurred()
  %39 = icmp ne %struct._object* %38, null
  %40 = xor i1 %39, true
  %41 = xor i1 %40, true
  %42 = zext i1 %41 to i32
  %43 = sext i32 %42 to i64
  %44 = icmp ne i64 %43, 0
  br i1 %44, label %45, label %46

45:                                               ; preds = %37
  store %struct._object* null, %struct._object** %4, align 8
  br label %50

46:                                               ; preds = %37
  br label %47

47:                                               ; preds = %46
  %48 = load %struct._object*, %struct._object** %5, align 8
  %49 = call %struct._object* @__Pyx_GetBuiltinName(%struct._object* noundef %48)
  store %struct._object* %49, %struct._object** %4, align 8
  br label %50

50:                                               ; preds = %47, %45, %34
  %51 = load %struct._object*, %struct._object** %4, align 8
  ret %struct._object* %51
}

declare %struct._object* @PyNumber_Multiply(%struct._object* noundef, %struct._object* noundef) #1

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @__Pyx_PyInt_BoolEqObjC(%struct._object* noundef %0, %struct._object* noundef %1, i64 noundef %2, i64 noundef %3) #0 {
  %5 = alloca i32, align 4
  %6 = alloca %struct._object*, align 8
  %7 = alloca %struct._object*, align 8
  %8 = alloca i64, align 8
  %9 = alloca i64, align 8
  %10 = alloca i32, align 4
  %11 = alloca i64, align 8
  %12 = alloca i64, align 8
  %13 = alloca i32*, align 8
  %14 = alloca i64, align 8
  %15 = alloca double, align 8
  store %struct._object* %0, %struct._object** %6, align 8
  store %struct._object* %1, %struct._object** %7, align 8
  store i64 %2, i64* %8, align 8
  store i64 %3, i64* %9, align 8
  %16 = load i64, i64* %8, align 8
  %17 = load i64, i64* %9, align 8
  %18 = load %struct._object*, %struct._object** %6, align 8
  %19 = load %struct._object*, %struct._object** %7, align 8
  %20 = icmp eq %struct._object* %18, %19
  br i1 %20, label %21, label %22

21:                                               ; preds = %4
  store i32 1, i32* %5, align 4
  br label %184

22:                                               ; preds = %4
  %23 = load %struct._object*, %struct._object** %6, align 8
  %24 = call i32 @_Py_IS_TYPE(%struct._object* noundef %23, %struct._typeobject* noundef @PyLong_Type)
  %25 = icmp ne i32 %24, 0
  %26 = xor i1 %25, true
  %27 = xor i1 %26, true
  %28 = zext i1 %27 to i32
  %29 = sext i32 %28 to i64
  %30 = icmp ne i64 %29, 0
  br i1 %30, label %31, label %164

31:                                               ; preds = %22
  %32 = load %struct._object*, %struct._object** %6, align 8
  %33 = bitcast %struct._object* %32 to %struct.PyVarObject*
  %34 = getelementptr inbounds %struct.PyVarObject, %struct.PyVarObject* %33, i32 0, i32 1
  %35 = load i64, i64* %34, align 8
  %36 = call i64 @labs(i64 noundef %35) #6
  store i64 %36, i64* %12, align 8
  %37 = load %struct._object*, %struct._object** %6, align 8
  %38 = bitcast %struct._object* %37 to %struct._longobject*
  %39 = getelementptr inbounds %struct._longobject, %struct._longobject* %38, i32 0, i32 1
  %40 = getelementptr inbounds [1 x i32], [1 x i32]* %39, i64 0, i64 0
  store i32* %40, i32** %13, align 8
  %41 = load i64, i64* %8, align 8
  %42 = icmp eq i64 %41, 0
  br i1 %42, label %43, label %52

43:                                               ; preds = %31
  %44 = load %struct._object*, %struct._object** %6, align 8
  %45 = bitcast %struct._object* %44 to %struct.PyVarObject*
  %46 = getelementptr inbounds %struct.PyVarObject, %struct.PyVarObject* %45, i32 0, i32 1
  %47 = load i64, i64* %46, align 8
  %48 = icmp eq i64 %47, 0
  %49 = zext i1 %48 to i32
  %50 = icmp eq i32 %49, 1
  %51 = zext i1 %50 to i32
  store i32 %51, i32* %5, align 4
  br label %184

52:                                               ; preds = %31
  %53 = load i64, i64* %8, align 8
  %54 = icmp slt i64 %53, 0
  br i1 %54, label %55, label %65

55:                                               ; preds = %52
  %56 = load %struct._object*, %struct._object** %6, align 8
  %57 = bitcast %struct._object* %56 to %struct.PyVarObject*
  %58 = getelementptr inbounds %struct.PyVarObject, %struct.PyVarObject* %57, i32 0, i32 1
  %59 = load i64, i64* %58, align 8
  %60 = icmp sge i64 %59, 0
  br i1 %60, label %61, label %62

61:                                               ; preds = %55
  store i32 0, i32* %5, align 4
  br label %184

62:                                               ; preds = %55
  %63 = load i64, i64* %8, align 8
  %64 = sub nsw i64 0, %63
  store i64 %64, i64* %8, align 8
  br label %73

65:                                               ; preds = %52
  %66 = load %struct._object*, %struct._object** %6, align 8
  %67 = bitcast %struct._object* %66 to %struct.PyVarObject*
  %68 = getelementptr inbounds %struct.PyVarObject, %struct.PyVarObject* %67, i32 0, i32 1
  %69 = load i64, i64* %68, align 8
  %70 = icmp slt i64 %69, 0
  br i1 %70, label %71, label %72

71:                                               ; preds = %65
  store i32 0, i32* %5, align 4
  br label %184

72:                                               ; preds = %65
  br label %73

73:                                               ; preds = %72, %62
  br label %74

74:                                               ; preds = %73
  %75 = load i64, i64* %8, align 8
  store i64 %75, i64* %11, align 8
  %76 = load i64, i64* %11, align 8
  %77 = lshr i64 %76, 60
  %78 = icmp ne i64 %77, 0
  br i1 %78, label %79, label %115

79:                                               ; preds = %74
  %80 = load i64, i64* %12, align 8
  %81 = icmp ne i64 %80, 3
  br i1 %81, label %112, label %82

82:                                               ; preds = %79
  %83 = load i32*, i32** %13, align 8
  %84 = getelementptr inbounds i32, i32* %83, i64 0
  %85 = load i32, i32* %84, align 4
  %86 = zext i32 %85 to i64
  %87 = load i64, i64* %11, align 8
  %88 = and i64 %87, 1073741823
  %89 = icmp ne i64 %86, %88
  %90 = zext i1 %89 to i32
  %91 = load i32*, i32** %13, align 8
  %92 = getelementptr inbounds i32, i32* %91, i64 1
  %93 = load i32, i32* %92, align 4
  %94 = zext i32 %93 to i64
  %95 = load i64, i64* %11, align 8
  %96 = lshr i64 %95, 30
  %97 = and i64 %96, 1073741823
  %98 = icmp ne i64 %94, %97
  %99 = zext i1 %98 to i32
  %100 = or i32 %90, %99
  %101 = load i32*, i32** %13, align 8
  %102 = getelementptr inbounds i32, i32* %101, i64 2
  %103 = load i32, i32* %102, align 4
  %104 = zext i32 %103 to i64
  %105 = load i64, i64* %11, align 8
  %106 = lshr i64 %105, 60
  %107 = and i64 %106, 1073741823
  %108 = icmp ne i64 %104, %107
  %109 = zext i1 %108 to i32
  %110 = or i32 %100, %109
  %111 = icmp ne i32 %110, 0
  br label %112

112:                                              ; preds = %82, %79
  %113 = phi i1 [ true, %79 ], [ %111, %82 ]
  %114 = zext i1 %113 to i32
  store i32 %114, i32* %10, align 4
  br label %160

115:                                              ; preds = %74
  %116 = load i64, i64* %11, align 8
  %117 = lshr i64 %116, 30
  %118 = icmp ne i64 %117, 0
  br i1 %118, label %119, label %145

119:                                              ; preds = %115
  %120 = load i64, i64* %12, align 8
  %121 = icmp ne i64 %120, 2
  br i1 %121, label %142, label %122

122:                                              ; preds = %119
  %123 = load i32*, i32** %13, align 8
  %124 = getelementptr inbounds i32, i32* %123, i64 0
  %125 = load i32, i32* %124, align 4
  %126 = zext i32 %125 to i64
  %127 = load i64, i64* %11, align 8
  %128 = and i64 %127, 1073741823
  %129 = icmp ne i64 %126, %128
  %130 = zext i1 %129 to i32
  %131 = load i32*, i32** %13, align 8
  %132 = getelementptr inbounds i32, i32* %131, i64 1
  %133 = load i32, i32* %132, align 4
  %134 = zext i32 %133 to i64
  %135 = load i64, i64* %11, align 8
  %136 = lshr i64 %135, 30
  %137 = and i64 %136, 1073741823
  %138 = icmp ne i64 %134, %137
  %139 = zext i1 %138 to i32
  %140 = or i32 %130, %139
  %141 = icmp ne i32 %140, 0
  br label %142

142:                                              ; preds = %122, %119
  %143 = phi i1 [ true, %119 ], [ %141, %122 ]
  %144 = zext i1 %143 to i32
  store i32 %144, i32* %10, align 4
  br label %159

145:                                              ; preds = %115
  %146 = load i64, i64* %12, align 8
  %147 = icmp ne i64 %146, 1
  br i1 %147, label %156, label %148

148:                                              ; preds = %145
  %149 = load i32*, i32** %13, align 8
  %150 = getelementptr inbounds i32, i32* %149, i64 0
  %151 = load i32, i32* %150, align 4
  %152 = zext i32 %151 to i64
  %153 = load i64, i64* %11, align 8
  %154 = and i64 %153, 1073741823
  %155 = icmp ne i64 %152, %154
  br label %156

156:                                              ; preds = %148, %145
  %157 = phi i1 [ true, %145 ], [ %155, %148 ]
  %158 = zext i1 %157 to i32
  store i32 %158, i32* %10, align 4
  br label %159

159:                                              ; preds = %156, %142
  br label %160

160:                                              ; preds = %159, %112
  %161 = load i32, i32* %10, align 4
  %162 = icmp eq i32 %161, 0
  %163 = zext i1 %162 to i32
  store i32 %163, i32* %5, align 4
  br label %184

164:                                              ; preds = %22
  %165 = load %struct._object*, %struct._object** %6, align 8
  %166 = call i32 @_Py_IS_TYPE(%struct._object* noundef %165, %struct._typeobject* noundef @PyFloat_Type)
  %167 = icmp ne i32 %166, 0
  br i1 %167, label %168, label %179

168:                                              ; preds = %164
  %169 = load i64, i64* %8, align 8
  store i64 %169, i64* %14, align 8
  %170 = load %struct._object*, %struct._object** %6, align 8
  %171 = bitcast %struct._object* %170 to %struct.PyFloatObject*
  %172 = getelementptr inbounds %struct.PyFloatObject, %struct.PyFloatObject* %171, i32 0, i32 1
  %173 = load double, double* %172, align 8
  store double %173, double* %15, align 8
  %174 = load double, double* %15, align 8
  %175 = load i64, i64* %14, align 8
  %176 = sitofp i64 %175 to double
  %177 = fcmp oeq double %174, %176
  %178 = zext i1 %177 to i32
  store i32 %178, i32* %5, align 4
  br label %184

179:                                              ; preds = %164
  %180 = load %struct._object*, %struct._object** %6, align 8
  %181 = load %struct._object*, %struct._object** %7, align 8
  %182 = call %struct._object* @PyObject_RichCompare(%struct._object* noundef %180, %struct._object* noundef %181, i32 noundef 2)
  %183 = call i32 @__Pyx_PyObject_IsTrueAndDecref(%struct._object* noundef %182)
  store i32 %183, i32* %5, align 4
  br label %184

184:                                              ; preds = %179, %168, %160, %71, %61, %43, %21
  %185 = load i32, i32* %5, align 4
  ret i32 %185
}

; Function Attrs: noinline nounwind optnone uwtable
define internal %struct._object* @__Pyx_PyInt_SubtractObjC(%struct._object* noundef %0, %struct._object* noundef %1, i64 noundef %2, i32 noundef %3, i32 noundef %4) #0 {
  %6 = alloca %struct._object*, align 8
  %7 = alloca %struct._object*, align 8
  %8 = alloca %struct._object*, align 8
  %9 = alloca i64, align 8
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i64, align 8
  %13 = alloca i64, align 8
  %14 = alloca i64, align 8
  %15 = alloca i64, align 8
  %16 = alloca i64, align 8
  %17 = alloca i64, align 8
  %18 = alloca i32*, align 8
  %19 = alloca i64, align 8
  %20 = alloca i64, align 8
  %21 = alloca double, align 8
  %22 = alloca double, align 8
  store %struct._object* %0, %struct._object** %7, align 8
  store %struct._object* %1, %struct._object** %8, align 8
  store i64 %2, i64* %9, align 8
  store i32 %3, i32* %10, align 4
  store i32 %4, i32* %11, align 4
  %23 = load i64, i64* %9, align 8
  %24 = load i32, i32* %10, align 4
  %25 = load i32, i32* %11, align 4
  %26 = load %struct._object*, %struct._object** %7, align 8
  %27 = call i32 @_Py_IS_TYPE(%struct._object* noundef %26, %struct._typeobject* noundef @PyLong_Type)
  %28 = icmp ne i32 %27, 0
  %29 = xor i1 %28, true
  %30 = xor i1 %29, true
  %31 = zext i1 %30 to i32
  %32 = sext i32 %31 to i64
  %33 = icmp ne i64 %32, 0
  br i1 %33, label %34, label %164

34:                                               ; preds = %5
  %35 = load i64, i64* %9, align 8
  store i64 %35, i64* %12, align 8
  %36 = load i64, i64* %9, align 8
  store i64 %36, i64* %15, align 8
  %37 = load %struct._object*, %struct._object** %7, align 8
  %38 = bitcast %struct._object* %37 to %struct.PyVarObject*
  %39 = getelementptr inbounds %struct.PyVarObject, %struct.PyVarObject* %38, i32 0, i32 1
  %40 = load i64, i64* %39, align 8
  %41 = icmp eq i64 %40, 0
  %42 = xor i1 %41, true
  %43 = xor i1 %42, true
  %44 = zext i1 %43 to i32
  %45 = sext i32 %44 to i64
  %46 = icmp ne i64 %45, 0
  br i1 %46, label %47, label %51

47:                                               ; preds = %34
  %48 = load i64, i64* %9, align 8
  %49 = sub nsw i64 0, %48
  %50 = call %struct._object* @PyLong_FromLong(i64 noundef %49)
  store %struct._object* %50, %struct._object** %6, align 8
  br label %188

51:                                               ; preds = %34
  %52 = load %struct._object*, %struct._object** %7, align 8
  %53 = bitcast %struct._object* %52 to %struct.PyVarObject*
  %54 = getelementptr inbounds %struct.PyVarObject, %struct.PyVarObject* %53, i32 0, i32 1
  %55 = load i64, i64* %54, align 8
  %56 = icmp eq i64 %55, 0
  br i1 %56, label %69, label %57

57:                                               ; preds = %51
  %58 = load %struct._object*, %struct._object** %7, align 8
  %59 = bitcast %struct._object* %58 to %struct.PyVarObject*
  %60 = getelementptr inbounds %struct.PyVarObject, %struct.PyVarObject* %59, i32 0, i32 1
  %61 = load i64, i64* %60, align 8
  %62 = icmp eq i64 %61, 1
  br i1 %62, label %69, label %63

63:                                               ; preds = %57
  %64 = load %struct._object*, %struct._object** %7, align 8
  %65 = bitcast %struct._object* %64 to %struct.PyVarObject*
  %66 = getelementptr inbounds %struct.PyVarObject, %struct.PyVarObject* %65, i32 0, i32 1
  %67 = load i64, i64* %66, align 8
  %68 = icmp eq i64 %67, -1
  br label %69

69:                                               ; preds = %63, %57, %51
  %70 = phi i1 [ true, %57 ], [ true, %51 ], [ %68, %63 ]
  %71 = xor i1 %70, true
  %72 = xor i1 %71, true
  %73 = zext i1 %72 to i32
  %74 = sext i32 %73 to i64
  %75 = icmp ne i64 %74, 0
  br i1 %75, label %76, label %107

76:                                               ; preds = %69
  %77 = load %struct._object*, %struct._object** %7, align 8
  %78 = bitcast %struct._object* %77 to %struct.PyVarObject*
  %79 = getelementptr inbounds %struct.PyVarObject, %struct.PyVarObject* %78, i32 0, i32 1
  %80 = load i64, i64* %79, align 8
  %81 = icmp eq i64 %80, 0
  br i1 %81, label %82, label %83

82:                                               ; preds = %76
  br label %104

83:                                               ; preds = %76
  %84 = load %struct._object*, %struct._object** %7, align 8
  %85 = bitcast %struct._object* %84 to %struct.PyVarObject*
  %86 = getelementptr inbounds %struct.PyVarObject, %struct.PyVarObject* %85, i32 0, i32 1
  %87 = load i64, i64* %86, align 8
  %88 = icmp slt i64 %87, 0
  br i1 %88, label %89, label %96

89:                                               ; preds = %83
  %90 = load %struct._object*, %struct._object** %7, align 8
  %91 = bitcast %struct._object* %90 to %struct._longobject*
  %92 = getelementptr inbounds %struct._longobject, %struct._longobject* %91, i32 0, i32 1
  %93 = getelementptr inbounds [1 x i32], [1 x i32]* %92, i64 0, i64 0
  %94 = load i32, i32* %93, align 8
  %95 = sub nsw i32 0, %94
  br label %102

96:                                               ; preds = %83
  %97 = load %struct._object*, %struct._object** %7, align 8
  %98 = bitcast %struct._object* %97 to %struct._longobject*
  %99 = getelementptr inbounds %struct._longobject, %struct._longobject* %98, i32 0, i32 1
  %100 = getelementptr inbounds [1 x i32], [1 x i32]* %99, i64 0, i64 0
  %101 = load i32, i32* %100, align 8
  br label %102

102:                                              ; preds = %96, %89
  %103 = phi i32 [ %95, %89 ], [ %101, %96 ]
  br label %104

104:                                              ; preds = %102, %82
  %105 = phi i32 [ 0, %82 ], [ %103, %102 ]
  %106 = sext i32 %105 to i64
  store i64 %106, i64* %13, align 8
  br label %152

107:                                              ; preds = %69
  %108 = load %struct._object*, %struct._object** %7, align 8
  %109 = bitcast %struct._object* %108 to %struct._longobject*
  %110 = getelementptr inbounds %struct._longobject, %struct._longobject* %109, i32 0, i32 1
  %111 = getelementptr inbounds [1 x i32], [1 x i32]* %110, i64 0, i64 0
  store i32* %111, i32** %18, align 8
  %112 = load %struct._object*, %struct._object** %7, align 8
  %113 = bitcast %struct._object* %112 to %struct.PyVarObject*
  %114 = getelementptr inbounds %struct.PyVarObject, %struct.PyVarObject* %113, i32 0, i32 1
  %115 = load i64, i64* %114, align 8
  store i64 %115, i64* %19, align 8
  %116 = load i64, i64* %19, align 8
  switch i64 %116, label %144 [
    i64 -2, label %117
    i64 2, label %129
    i64 -3, label %140
    i64 3, label %141
    i64 -4, label %142
    i64 4, label %143
  ]

117:                                              ; preds = %107
  %118 = load i32*, i32** %18, align 8
  %119 = getelementptr inbounds i32, i32* %118, i64 1
  %120 = load i32, i32* %119, align 4
  %121 = zext i32 %120 to i64
  %122 = shl i64 %121, 30
  %123 = load i32*, i32** %18, align 8
  %124 = getelementptr inbounds i32, i32* %123, i64 0
  %125 = load i32, i32* %124, align 4
  %126 = zext i32 %125 to i64
  %127 = or i64 %122, %126
  %128 = sub nsw i64 0, %127
  store i64 %128, i64* %13, align 8
  br label %151

129:                                              ; preds = %107
  %130 = load i32*, i32** %18, align 8
  %131 = getelementptr inbounds i32, i32* %130, i64 1
  %132 = load i32, i32* %131, align 4
  %133 = zext i32 %132 to i64
  %134 = shl i64 %133, 30
  %135 = load i32*, i32** %18, align 8
  %136 = getelementptr inbounds i32, i32* %135, i64 0
  %137 = load i32, i32* %136, align 4
  %138 = zext i32 %137 to i64
  %139 = or i64 %134, %138
  store i64 %139, i64* %13, align 8
  br label %151

140:                                              ; preds = %107
  br label %141

141:                                              ; preds = %107, %140
  br label %142

142:                                              ; preds = %107, %141
  br label %143

143:                                              ; preds = %107, %142
  br label %144

144:                                              ; preds = %107, %143
  %145 = load %struct.PyNumberMethods*, %struct.PyNumberMethods** getelementptr inbounds (%struct._typeobject, %struct._typeobject* @PyLong_Type, i32 0, i32 10), align 8
  %146 = getelementptr inbounds %struct.PyNumberMethods, %struct.PyNumberMethods* %145, i32 0, i32 1
  %147 = load %struct._object* (%struct._object*, %struct._object*)*, %struct._object* (%struct._object*, %struct._object*)** %146, align 8
  %148 = load %struct._object*, %struct._object** %7, align 8
  %149 = load %struct._object*, %struct._object** %8, align 8
  %150 = call %struct._object* %147(%struct._object* noundef %148, %struct._object* noundef %149)
  store %struct._object* %150, %struct._object** %6, align 8
  br label %188

151:                                              ; preds = %129, %117
  br label %152

152:                                              ; preds = %151, %104
  %153 = load i64, i64* %13, align 8
  %154 = load i64, i64* %12, align 8
  %155 = sub nsw i64 %153, %154
  store i64 %155, i64* %14, align 8
  %156 = load i64, i64* %14, align 8
  %157 = call %struct._object* @PyLong_FromLong(i64 noundef %156)
  store %struct._object* %157, %struct._object** %6, align 8
  br label %188

158:                                              ; No predecessors!
  %159 = load i64, i64* %16, align 8
  %160 = load i64, i64* %15, align 8
  %161 = sub nsw i64 %159, %160
  store i64 %161, i64* %17, align 8
  %162 = load i64, i64* %17, align 8
  %163 = call %struct._object* @PyLong_FromLongLong(i64 noundef %162)
  store %struct._object* %163, %struct._object** %6, align 8
  br label %188

164:                                              ; preds = %5
  %165 = load %struct._object*, %struct._object** %7, align 8
  %166 = call i32 @_Py_IS_TYPE(%struct._object* noundef %165, %struct._typeobject* noundef @PyFloat_Type)
  %167 = icmp ne i32 %166, 0
  br i1 %167, label %168, label %180

168:                                              ; preds = %164
  %169 = load i64, i64* %9, align 8
  store i64 %169, i64* %20, align 8
  %170 = load %struct._object*, %struct._object** %7, align 8
  %171 = bitcast %struct._object* %170 to %struct.PyFloatObject*
  %172 = getelementptr inbounds %struct.PyFloatObject, %struct.PyFloatObject* %171, i32 0, i32 1
  %173 = load double, double* %172, align 8
  store double %173, double* %21, align 8
  %174 = load double, double* %21, align 8
  %175 = load i64, i64* %20, align 8
  %176 = sitofp i64 %175 to double
  %177 = fsub double %174, %176
  store double %177, double* %22, align 8
  %178 = load double, double* %22, align 8
  %179 = call %struct._object* @PyFloat_FromDouble(double noundef %178)
  store %struct._object* %179, %struct._object** %6, align 8
  br label %188

180:                                              ; preds = %164
  %181 = load i32, i32* %10, align 4
  %182 = icmp ne i32 %181, 0
  %183 = zext i1 %182 to i64
  %184 = select i1 %182, %struct._object* (%struct._object*, %struct._object*)* @PyNumber_InPlaceSubtract, %struct._object* (%struct._object*, %struct._object*)* @PyNumber_Subtract
  %185 = load %struct._object*, %struct._object** %7, align 8
  %186 = load %struct._object*, %struct._object** %8, align 8
  %187 = call %struct._object* %184(%struct._object* noundef %185, %struct._object* noundef %186)
  store %struct._object* %187, %struct._object** %6, align 8
  br label %188

188:                                              ; preds = %180, %168, %158, %152, %144, %47
  %189 = load %struct._object*, %struct._object** %6, align 8
  ret %struct._object* %189
}

; Function Attrs: noinline nounwind optnone uwtable
define internal %struct._object* @__Pyx_PyInt_AddObjC(%struct._object* noundef %0, %struct._object* noundef %1, i64 noundef %2, i32 noundef %3, i32 noundef %4) #0 {
  %6 = alloca %struct._object*, align 8
  %7 = alloca %struct._object*, align 8
  %8 = alloca %struct._object*, align 8
  %9 = alloca i64, align 8
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i64, align 8
  %13 = alloca i64, align 8
  %14 = alloca i64, align 8
  %15 = alloca i64, align 8
  %16 = alloca i64, align 8
  %17 = alloca i64, align 8
  %18 = alloca i32*, align 8
  %19 = alloca i64, align 8
  %20 = alloca i64, align 8
  %21 = alloca double, align 8
  %22 = alloca double, align 8
  store %struct._object* %0, %struct._object** %7, align 8
  store %struct._object* %1, %struct._object** %8, align 8
  store i64 %2, i64* %9, align 8
  store i32 %3, i32* %10, align 4
  store i32 %4, i32* %11, align 4
  %23 = load i64, i64* %9, align 8
  %24 = load i32, i32* %10, align 4
  %25 = load i32, i32* %11, align 4
  %26 = load %struct._object*, %struct._object** %7, align 8
  %27 = call i32 @_Py_IS_TYPE(%struct._object* noundef %26, %struct._typeobject* noundef @PyLong_Type)
  %28 = icmp ne i32 %27, 0
  %29 = xor i1 %28, true
  %30 = xor i1 %29, true
  %31 = zext i1 %30 to i32
  %32 = sext i32 %31 to i64
  %33 = icmp ne i64 %32, 0
  br i1 %33, label %34, label %163

34:                                               ; preds = %5
  %35 = load i64, i64* %9, align 8
  store i64 %35, i64* %12, align 8
  %36 = load i64, i64* %9, align 8
  store i64 %36, i64* %15, align 8
  %37 = load %struct._object*, %struct._object** %7, align 8
  %38 = bitcast %struct._object* %37 to %struct.PyVarObject*
  %39 = getelementptr inbounds %struct.PyVarObject, %struct.PyVarObject* %38, i32 0, i32 1
  %40 = load i64, i64* %39, align 8
  %41 = icmp eq i64 %40, 0
  %42 = xor i1 %41, true
  %43 = xor i1 %42, true
  %44 = zext i1 %43 to i32
  %45 = sext i32 %44 to i64
  %46 = icmp ne i64 %45, 0
  br i1 %46, label %47, label %50

47:                                               ; preds = %34
  %48 = load %struct._object*, %struct._object** %8, align 8
  call void @_Py_INCREF(%struct._object* noundef %48)
  %49 = load %struct._object*, %struct._object** %8, align 8
  store %struct._object* %49, %struct._object** %6, align 8
  br label %187

50:                                               ; preds = %34
  %51 = load %struct._object*, %struct._object** %7, align 8
  %52 = bitcast %struct._object* %51 to %struct.PyVarObject*
  %53 = getelementptr inbounds %struct.PyVarObject, %struct.PyVarObject* %52, i32 0, i32 1
  %54 = load i64, i64* %53, align 8
  %55 = icmp eq i64 %54, 0
  br i1 %55, label %68, label %56

56:                                               ; preds = %50
  %57 = load %struct._object*, %struct._object** %7, align 8
  %58 = bitcast %struct._object* %57 to %struct.PyVarObject*
  %59 = getelementptr inbounds %struct.PyVarObject, %struct.PyVarObject* %58, i32 0, i32 1
  %60 = load i64, i64* %59, align 8
  %61 = icmp eq i64 %60, 1
  br i1 %61, label %68, label %62

62:                                               ; preds = %56
  %63 = load %struct._object*, %struct._object** %7, align 8
  %64 = bitcast %struct._object* %63 to %struct.PyVarObject*
  %65 = getelementptr inbounds %struct.PyVarObject, %struct.PyVarObject* %64, i32 0, i32 1
  %66 = load i64, i64* %65, align 8
  %67 = icmp eq i64 %66, -1
  br label %68

68:                                               ; preds = %62, %56, %50
  %69 = phi i1 [ true, %56 ], [ true, %50 ], [ %67, %62 ]
  %70 = xor i1 %69, true
  %71 = xor i1 %70, true
  %72 = zext i1 %71 to i32
  %73 = sext i32 %72 to i64
  %74 = icmp ne i64 %73, 0
  br i1 %74, label %75, label %106

75:                                               ; preds = %68
  %76 = load %struct._object*, %struct._object** %7, align 8
  %77 = bitcast %struct._object* %76 to %struct.PyVarObject*
  %78 = getelementptr inbounds %struct.PyVarObject, %struct.PyVarObject* %77, i32 0, i32 1
  %79 = load i64, i64* %78, align 8
  %80 = icmp eq i64 %79, 0
  br i1 %80, label %81, label %82

81:                                               ; preds = %75
  br label %103

82:                                               ; preds = %75
  %83 = load %struct._object*, %struct._object** %7, align 8
  %84 = bitcast %struct._object* %83 to %struct.PyVarObject*
  %85 = getelementptr inbounds %struct.PyVarObject, %struct.PyVarObject* %84, i32 0, i32 1
  %86 = load i64, i64* %85, align 8
  %87 = icmp slt i64 %86, 0
  br i1 %87, label %88, label %95

88:                                               ; preds = %82
  %89 = load %struct._object*, %struct._object** %7, align 8
  %90 = bitcast %struct._object* %89 to %struct._longobject*
  %91 = getelementptr inbounds %struct._longobject, %struct._longobject* %90, i32 0, i32 1
  %92 = getelementptr inbounds [1 x i32], [1 x i32]* %91, i64 0, i64 0
  %93 = load i32, i32* %92, align 8
  %94 = sub nsw i32 0, %93
  br label %101

95:                                               ; preds = %82
  %96 = load %struct._object*, %struct._object** %7, align 8
  %97 = bitcast %struct._object* %96 to %struct._longobject*
  %98 = getelementptr inbounds %struct._longobject, %struct._longobject* %97, i32 0, i32 1
  %99 = getelementptr inbounds [1 x i32], [1 x i32]* %98, i64 0, i64 0
  %100 = load i32, i32* %99, align 8
  br label %101

101:                                              ; preds = %95, %88
  %102 = phi i32 [ %94, %88 ], [ %100, %95 ]
  br label %103

103:                                              ; preds = %101, %81
  %104 = phi i32 [ 0, %81 ], [ %102, %101 ]
  %105 = sext i32 %104 to i64
  store i64 %105, i64* %13, align 8
  br label %151

106:                                              ; preds = %68
  %107 = load %struct._object*, %struct._object** %7, align 8
  %108 = bitcast %struct._object* %107 to %struct._longobject*
  %109 = getelementptr inbounds %struct._longobject, %struct._longobject* %108, i32 0, i32 1
  %110 = getelementptr inbounds [1 x i32], [1 x i32]* %109, i64 0, i64 0
  store i32* %110, i32** %18, align 8
  %111 = load %struct._object*, %struct._object** %7, align 8
  %112 = bitcast %struct._object* %111 to %struct.PyVarObject*
  %113 = getelementptr inbounds %struct.PyVarObject, %struct.PyVarObject* %112, i32 0, i32 1
  %114 = load i64, i64* %113, align 8
  store i64 %114, i64* %19, align 8
  %115 = load i64, i64* %19, align 8
  switch i64 %115, label %143 [
    i64 -2, label %116
    i64 2, label %128
    i64 -3, label %139
    i64 3, label %140
    i64 -4, label %141
    i64 4, label %142
  ]

116:                                              ; preds = %106
  %117 = load i32*, i32** %18, align 8
  %118 = getelementptr inbounds i32, i32* %117, i64 1
  %119 = load i32, i32* %118, align 4
  %120 = zext i32 %119 to i64
  %121 = shl i64 %120, 30
  %122 = load i32*, i32** %18, align 8
  %123 = getelementptr inbounds i32, i32* %122, i64 0
  %124 = load i32, i32* %123, align 4
  %125 = zext i32 %124 to i64
  %126 = or i64 %121, %125
  %127 = sub nsw i64 0, %126
  store i64 %127, i64* %13, align 8
  br label %150

128:                                              ; preds = %106
  %129 = load i32*, i32** %18, align 8
  %130 = getelementptr inbounds i32, i32* %129, i64 1
  %131 = load i32, i32* %130, align 4
  %132 = zext i32 %131 to i64
  %133 = shl i64 %132, 30
  %134 = load i32*, i32** %18, align 8
  %135 = getelementptr inbounds i32, i32* %134, i64 0
  %136 = load i32, i32* %135, align 4
  %137 = zext i32 %136 to i64
  %138 = or i64 %133, %137
  store i64 %138, i64* %13, align 8
  br label %150

139:                                              ; preds = %106
  br label %140

140:                                              ; preds = %106, %139
  br label %141

141:                                              ; preds = %106, %140
  br label %142

142:                                              ; preds = %106, %141
  br label %143

143:                                              ; preds = %106, %142
  %144 = load %struct.PyNumberMethods*, %struct.PyNumberMethods** getelementptr inbounds (%struct._typeobject, %struct._typeobject* @PyLong_Type, i32 0, i32 10), align 8
  %145 = getelementptr inbounds %struct.PyNumberMethods, %struct.PyNumberMethods* %144, i32 0, i32 0
  %146 = load %struct._object* (%struct._object*, %struct._object*)*, %struct._object* (%struct._object*, %struct._object*)** %145, align 8
  %147 = load %struct._object*, %struct._object** %7, align 8
  %148 = load %struct._object*, %struct._object** %8, align 8
  %149 = call %struct._object* %146(%struct._object* noundef %147, %struct._object* noundef %148)
  store %struct._object* %149, %struct._object** %6, align 8
  br label %187

150:                                              ; preds = %128, %116
  br label %151

151:                                              ; preds = %150, %103
  %152 = load i64, i64* %13, align 8
  %153 = load i64, i64* %12, align 8
  %154 = add nsw i64 %152, %153
  store i64 %154, i64* %14, align 8
  %155 = load i64, i64* %14, align 8
  %156 = call %struct._object* @PyLong_FromLong(i64 noundef %155)
  store %struct._object* %156, %struct._object** %6, align 8
  br label %187

157:                                              ; No predecessors!
  %158 = load i64, i64* %16, align 8
  %159 = load i64, i64* %15, align 8
  %160 = add nsw i64 %158, %159
  store i64 %160, i64* %17, align 8
  %161 = load i64, i64* %17, align 8
  %162 = call %struct._object* @PyLong_FromLongLong(i64 noundef %161)
  store %struct._object* %162, %struct._object** %6, align 8
  br label %187

163:                                              ; preds = %5
  %164 = load %struct._object*, %struct._object** %7, align 8
  %165 = call i32 @_Py_IS_TYPE(%struct._object* noundef %164, %struct._typeobject* noundef @PyFloat_Type)
  %166 = icmp ne i32 %165, 0
  br i1 %166, label %167, label %179

167:                                              ; preds = %163
  %168 = load i64, i64* %9, align 8
  store i64 %168, i64* %20, align 8
  %169 = load %struct._object*, %struct._object** %7, align 8
  %170 = bitcast %struct._object* %169 to %struct.PyFloatObject*
  %171 = getelementptr inbounds %struct.PyFloatObject, %struct.PyFloatObject* %170, i32 0, i32 1
  %172 = load double, double* %171, align 8
  store double %172, double* %21, align 8
  %173 = load double, double* %21, align 8
  %174 = load i64, i64* %20, align 8
  %175 = sitofp i64 %174 to double
  %176 = fadd double %173, %175
  store double %176, double* %22, align 8
  %177 = load double, double* %22, align 8
  %178 = call %struct._object* @PyFloat_FromDouble(double noundef %177)
  store %struct._object* %178, %struct._object** %6, align 8
  br label %187

179:                                              ; preds = %163
  %180 = load i32, i32* %10, align 4
  %181 = icmp ne i32 %180, 0
  %182 = zext i1 %181 to i64
  %183 = select i1 %181, %struct._object* (%struct._object*, %struct._object*)* @PyNumber_InPlaceAdd, %struct._object* (%struct._object*, %struct._object*)* @PyNumber_Add
  %184 = load %struct._object*, %struct._object** %7, align 8
  %185 = load %struct._object*, %struct._object** %8, align 8
  %186 = call %struct._object* %183(%struct._object* noundef %184, %struct._object* noundef %185)
  store %struct._object* %186, %struct._object** %6, align 8
  br label %187

187:                                              ; preds = %179, %167, %157, %151, %143, %47
  %188 = load %struct._object*, %struct._object** %6, align 8
  ret %struct._object* %188
}

declare %struct._object* @PyDict_New() #1

; Function Attrs: noinline nounwind optnone uwtable
define internal void @__Pyx_AddTraceback(i8* noundef %0, i32 noundef %1, i32 noundef %2, i8* noundef %3) #0 {
  %5 = alloca i8*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i8*, align 8
  %9 = alloca %struct.PyCodeObject*, align 8
  %10 = alloca %struct._frame*, align 8
  %11 = alloca %struct._ts*, align 8
  %12 = alloca %struct._object*, align 8
  %13 = alloca %struct._object*, align 8
  %14 = alloca %struct._object*, align 8
  store i8* %0, i8** %5, align 8
  store i32 %1, i32* %6, align 4
  store i32 %2, i32* %7, align 4
  store i8* %3, i8** %8, align 8
  store %struct.PyCodeObject* null, %struct.PyCodeObject** %9, align 8
  store %struct._frame* null, %struct._frame** %10, align 8
  %15 = call %struct._ts* @_PyThreadState_UncheckedGet()
  store %struct._ts* %15, %struct._ts** %11, align 8
  %16 = load i32, i32* %6, align 4
  %17 = icmp ne i32 %16, 0
  br i1 %17, label %18, label %22

18:                                               ; preds = %4
  %19 = load %struct._ts*, %struct._ts** %11, align 8
  %20 = load i32, i32* %6, align 4
  %21 = call i32 @__Pyx_CLineForTraceback(%struct._ts* noundef %19, i32 noundef %20)
  store i32 %21, i32* %6, align 4
  br label %22

22:                                               ; preds = %18, %4
  %23 = load i32, i32* %6, align 4
  %24 = icmp ne i32 %23, 0
  br i1 %24, label %25, label %28

25:                                               ; preds = %22
  %26 = load i32, i32* %6, align 4
  %27 = sub nsw i32 0, %26
  br label %30

28:                                               ; preds = %22
  %29 = load i32, i32* %7, align 4
  br label %30

30:                                               ; preds = %28, %25
  %31 = phi i32 [ %27, %25 ], [ %29, %28 ]
  %32 = call %struct.PyCodeObject* @__pyx_find_code_object(i32 noundef %31)
  store %struct.PyCodeObject* %32, %struct.PyCodeObject** %9, align 8
  %33 = load %struct.PyCodeObject*, %struct.PyCodeObject** %9, align 8
  %34 = icmp ne %struct.PyCodeObject* %33, null
  br i1 %34, label %63, label %35

35:                                               ; preds = %30
  %36 = load %struct._ts*, %struct._ts** %11, align 8
  call void @__Pyx_ErrFetchInState(%struct._ts* noundef %36, %struct._object** noundef %12, %struct._object** noundef %13, %struct._object** noundef %14)
  %37 = load i8*, i8** %5, align 8
  %38 = load i32, i32* %6, align 4
  %39 = load i32, i32* %7, align 4
  %40 = load i8*, i8** %8, align 8
  %41 = call %struct.PyCodeObject* @__Pyx_CreateCodeObjectForTraceback(i8* noundef %37, i32 noundef %38, i32 noundef %39, i8* noundef %40)
  store %struct.PyCodeObject* %41, %struct.PyCodeObject** %9, align 8
  %42 = load %struct.PyCodeObject*, %struct.PyCodeObject** %9, align 8
  %43 = icmp ne %struct.PyCodeObject* %42, null
  br i1 %43, label %48, label %44

44:                                               ; preds = %35
  %45 = load %struct._object*, %struct._object** %12, align 8
  call void @_Py_XDECREF(%struct._object* noundef %45)
  %46 = load %struct._object*, %struct._object** %13, align 8
  call void @_Py_XDECREF(%struct._object* noundef %46)
  %47 = load %struct._object*, %struct._object** %14, align 8
  call void @_Py_XDECREF(%struct._object* noundef %47)
  br label %79

48:                                               ; preds = %35
  %49 = load %struct._ts*, %struct._ts** %11, align 8
  %50 = load %struct._object*, %struct._object** %12, align 8
  %51 = load %struct._object*, %struct._object** %13, align 8
  %52 = load %struct._object*, %struct._object** %14, align 8
  call void @__Pyx_ErrRestoreInState(%struct._ts* noundef %49, %struct._object* noundef %50, %struct._object* noundef %51, %struct._object* noundef %52)
  %53 = load i32, i32* %6, align 4
  %54 = icmp ne i32 %53, 0
  br i1 %54, label %55, label %58

55:                                               ; preds = %48
  %56 = load i32, i32* %6, align 4
  %57 = sub nsw i32 0, %56
  br label %60

58:                                               ; preds = %48
  %59 = load i32, i32* %7, align 4
  br label %60

60:                                               ; preds = %58, %55
  %61 = phi i32 [ %57, %55 ], [ %59, %58 ]
  %62 = load %struct.PyCodeObject*, %struct.PyCodeObject** %9, align 8
  call void @__pyx_insert_code_object(i32 noundef %61, %struct.PyCodeObject* noundef %62)
  br label %63

63:                                               ; preds = %60, %30
  %64 = load %struct._ts*, %struct._ts** %11, align 8
  %65 = load %struct.PyCodeObject*, %struct.PyCodeObject** %9, align 8
  %66 = load %struct.__pyx_mstate*, %struct.__pyx_mstate** @__pyx_mstate_global, align 8
  %67 = getelementptr inbounds %struct.__pyx_mstate, %struct.__pyx_mstate* %66, i32 0, i32 0
  %68 = load %struct._object*, %struct._object** %67, align 8
  %69 = call %struct._frame* @PyFrame_New(%struct._ts* noundef %64, %struct.PyCodeObject* noundef %65, %struct._object* noundef %68, %struct._object* noundef null)
  store %struct._frame* %69, %struct._frame** %10, align 8
  %70 = load %struct._frame*, %struct._frame** %10, align 8
  %71 = icmp ne %struct._frame* %70, null
  br i1 %71, label %73, label %72

72:                                               ; preds = %63
  br label %79

73:                                               ; preds = %63
  %74 = load i32, i32* %7, align 4
  %75 = load %struct._frame*, %struct._frame** %10, align 8
  %76 = getelementptr inbounds %struct._frame, %struct._frame* %75, i32 0, i32 13
  store i32 %74, i32* %76, align 4
  %77 = load %struct._frame*, %struct._frame** %10, align 8
  %78 = call i32 @PyTraceBack_Here(%struct._frame* noundef %77)
  br label %79

79:                                               ; preds = %73, %72, %44
  %80 = load %struct.PyCodeObject*, %struct.PyCodeObject** %9, align 8
  %81 = bitcast %struct.PyCodeObject* %80 to %struct._object*
  call void @_Py_XDECREF(%struct._object* noundef %81)
  %82 = load %struct._frame*, %struct._frame** %10, align 8
  %83 = bitcast %struct._frame* %82 to %struct._object*
  call void @_Py_XDECREF(%struct._object* noundef %83)
  ret void
}

declare %struct._object* @PyErr_Occurred() #1

declare %struct._object* @PyImport_AddModule(i8* noundef) #1

; Function Attrs: noinline nounwind optnone uwtable
define internal void @_Py_XINCREF(%struct._object* noundef %0) #0 {
  %2 = alloca %struct._object*, align 8
  store %struct._object* %0, %struct._object** %2, align 8
  %3 = load %struct._object*, %struct._object** %2, align 8
  %4 = icmp ne %struct._object* %3, null
  br i1 %4, label %5, label %7

5:                                                ; preds = %1
  %6 = load %struct._object*, %struct._object** %2, align 8
  call void @_Py_INCREF(%struct._object* noundef %6)
  br label %7

7:                                                ; preds = %5, %1
  ret void
}

declare i32 @PyOS_snprintf(i8* noundef, i64 noundef, i8* noundef, ...) #1

declare i32 @PyErr_WarnEx(%struct._object* noundef, i8* noundef, i64 noundef) #1

declare i8* @Py_GetVersion() #1

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @__Pyx_CreateStringTabAndInitStrings() #0 {
  %1 = alloca [10 x %struct.__Pyx_StringTabEntry], align 16
  %2 = getelementptr inbounds [10 x %struct.__Pyx_StringTabEntry], [10 x %struct.__Pyx_StringTabEntry]* %1, i64 0, i64 0
  %3 = getelementptr inbounds %struct.__Pyx_StringTabEntry, %struct.__Pyx_StringTabEntry* %2, i32 0, i32 0
  %4 = load %struct.__pyx_mstate*, %struct.__pyx_mstate** @__pyx_mstate_global, align 8
  %5 = getelementptr inbounds %struct.__pyx_mstate, %struct.__pyx_mstate* %4, i32 0, i32 6
  store %struct._object** %5, %struct._object*** %3, align 8
  %6 = getelementptr inbounds %struct.__Pyx_StringTabEntry, %struct.__Pyx_StringTabEntry* %2, i32 0, i32 1
  store i8* getelementptr inbounds ([2 x i8], [2 x i8]* @__pyx_k_, i64 0, i64 0), i8** %6, align 8
  %7 = getelementptr inbounds %struct.__Pyx_StringTabEntry, %struct.__Pyx_StringTabEntry* %2, i32 0, i32 2
  store i64 2, i64* %7, align 8
  %8 = getelementptr inbounds %struct.__Pyx_StringTabEntry, %struct.__Pyx_StringTabEntry* %2, i32 0, i32 3
  store i8* null, i8** %8, align 8
  %9 = getelementptr inbounds %struct.__Pyx_StringTabEntry, %struct.__Pyx_StringTabEntry* %2, i32 0, i32 4
  store i8 0, i8* %9, align 8
  %10 = getelementptr inbounds %struct.__Pyx_StringTabEntry, %struct.__Pyx_StringTabEntry* %2, i32 0, i32 5
  store i8 1, i8* %10, align 1
  %11 = getelementptr inbounds %struct.__Pyx_StringTabEntry, %struct.__Pyx_StringTabEntry* %2, i32 0, i32 6
  store i8 1, i8* %11, align 2
  %12 = getelementptr inbounds %struct.__Pyx_StringTabEntry, %struct.__Pyx_StringTabEntry* %2, i64 1
  %13 = getelementptr inbounds %struct.__Pyx_StringTabEntry, %struct.__Pyx_StringTabEntry* %12, i32 0, i32 0
  %14 = load %struct.__pyx_mstate*, %struct.__pyx_mstate** @__pyx_mstate_global, align 8
  %15 = getelementptr inbounds %struct.__pyx_mstate, %struct.__pyx_mstate* %14, i32 0, i32 7
  store %struct._object** %15, %struct._object*** %13, align 8
  %16 = getelementptr inbounds %struct.__Pyx_StringTabEntry, %struct.__Pyx_StringTabEntry* %12, i32 0, i32 1
  store i8* getelementptr inbounds ([19 x i8], [19 x i8]* @__pyx_k_cline_in_traceback, i64 0, i64 0), i8** %16, align 8
  %17 = getelementptr inbounds %struct.__Pyx_StringTabEntry, %struct.__Pyx_StringTabEntry* %12, i32 0, i32 2
  store i64 19, i64* %17, align 8
  %18 = getelementptr inbounds %struct.__Pyx_StringTabEntry, %struct.__Pyx_StringTabEntry* %12, i32 0, i32 3
  store i8* null, i8** %18, align 8
  %19 = getelementptr inbounds %struct.__Pyx_StringTabEntry, %struct.__Pyx_StringTabEntry* %12, i32 0, i32 4
  store i8 0, i8* %19, align 8
  %20 = getelementptr inbounds %struct.__Pyx_StringTabEntry, %struct.__Pyx_StringTabEntry* %12, i32 0, i32 5
  store i8 1, i8* %20, align 1
  %21 = getelementptr inbounds %struct.__Pyx_StringTabEntry, %struct.__Pyx_StringTabEntry* %12, i32 0, i32 6
  store i8 1, i8* %21, align 2
  %22 = getelementptr inbounds %struct.__Pyx_StringTabEntry, %struct.__Pyx_StringTabEntry* %12, i64 1
  %23 = getelementptr inbounds %struct.__Pyx_StringTabEntry, %struct.__Pyx_StringTabEntry* %22, i32 0, i32 0
  %24 = load %struct.__pyx_mstate*, %struct.__pyx_mstate** @__pyx_mstate_global, align 8
  %25 = getelementptr inbounds %struct.__pyx_mstate, %struct.__pyx_mstate* %24, i32 0, i32 8
  store %struct._object** %25, %struct._object*** %23, align 8
  %26 = getelementptr inbounds %struct.__Pyx_StringTabEntry, %struct.__Pyx_StringTabEntry* %22, i32 0, i32 1
  store i8* getelementptr inbounds ([9 x i8], [9 x i8]* @__pyx_k_main, i64 0, i64 0), i8** %26, align 8
  %27 = getelementptr inbounds %struct.__Pyx_StringTabEntry, %struct.__Pyx_StringTabEntry* %22, i32 0, i32 2
  store i64 9, i64* %27, align 8
  %28 = getelementptr inbounds %struct.__Pyx_StringTabEntry, %struct.__Pyx_StringTabEntry* %22, i32 0, i32 3
  store i8* null, i8** %28, align 8
  %29 = getelementptr inbounds %struct.__Pyx_StringTabEntry, %struct.__Pyx_StringTabEntry* %22, i32 0, i32 4
  store i8 0, i8* %29, align 8
  %30 = getelementptr inbounds %struct.__Pyx_StringTabEntry, %struct.__Pyx_StringTabEntry* %22, i32 0, i32 5
  store i8 1, i8* %30, align 1
  %31 = getelementptr inbounds %struct.__Pyx_StringTabEntry, %struct.__Pyx_StringTabEntry* %22, i32 0, i32 6
  store i8 1, i8* %31, align 2
  %32 = getelementptr inbounds %struct.__Pyx_StringTabEntry, %struct.__Pyx_StringTabEntry* %22, i64 1
  %33 = getelementptr inbounds %struct.__Pyx_StringTabEntry, %struct.__Pyx_StringTabEntry* %32, i32 0, i32 0
  %34 = load %struct.__pyx_mstate*, %struct.__pyx_mstate** @__pyx_mstate_global, align 8
  %35 = getelementptr inbounds %struct.__pyx_mstate, %struct.__pyx_mstate* %34, i32 0, i32 9
  store %struct._object** %35, %struct._object*** %33, align 8
  %36 = getelementptr inbounds %struct.__Pyx_StringTabEntry, %struct.__Pyx_StringTabEntry* %32, i32 0, i32 1
  store i8* getelementptr inbounds ([9 x i8], [9 x i8]* @__pyx_k_name, i64 0, i64 0), i8** %36, align 8
  %37 = getelementptr inbounds %struct.__Pyx_StringTabEntry, %struct.__Pyx_StringTabEntry* %32, i32 0, i32 2
  store i64 9, i64* %37, align 8
  %38 = getelementptr inbounds %struct.__Pyx_StringTabEntry, %struct.__Pyx_StringTabEntry* %32, i32 0, i32 3
  store i8* null, i8** %38, align 8
  %39 = getelementptr inbounds %struct.__Pyx_StringTabEntry, %struct.__Pyx_StringTabEntry* %32, i32 0, i32 4
  store i8 0, i8* %39, align 8
  %40 = getelementptr inbounds %struct.__Pyx_StringTabEntry, %struct.__Pyx_StringTabEntry* %32, i32 0, i32 5
  store i8 1, i8* %40, align 1
  %41 = getelementptr inbounds %struct.__Pyx_StringTabEntry, %struct.__Pyx_StringTabEntry* %32, i32 0, i32 6
  store i8 1, i8* %41, align 2
  %42 = getelementptr inbounds %struct.__Pyx_StringTabEntry, %struct.__Pyx_StringTabEntry* %32, i64 1
  %43 = getelementptr inbounds %struct.__Pyx_StringTabEntry, %struct.__Pyx_StringTabEntry* %42, i32 0, i32 0
  %44 = load %struct.__pyx_mstate*, %struct.__pyx_mstate** @__pyx_mstate_global, align 8
  %45 = getelementptr inbounds %struct.__pyx_mstate, %struct.__pyx_mstate* %44, i32 0, i32 10
  store %struct._object** %45, %struct._object*** %43, align 8
  %46 = getelementptr inbounds %struct.__Pyx_StringTabEntry, %struct.__Pyx_StringTabEntry* %42, i32 0, i32 1
  store i8* getelementptr inbounds ([7 x i8], [7 x i8]* @__pyx_k_result, i64 0, i64 0), i8** %46, align 8
  %47 = getelementptr inbounds %struct.__Pyx_StringTabEntry, %struct.__Pyx_StringTabEntry* %42, i32 0, i32 2
  store i64 7, i64* %47, align 8
  %48 = getelementptr inbounds %struct.__Pyx_StringTabEntry, %struct.__Pyx_StringTabEntry* %42, i32 0, i32 3
  store i8* null, i8** %48, align 8
  %49 = getelementptr inbounds %struct.__Pyx_StringTabEntry, %struct.__Pyx_StringTabEntry* %42, i32 0, i32 4
  store i8 0, i8* %49, align 8
  %50 = getelementptr inbounds %struct.__Pyx_StringTabEntry, %struct.__Pyx_StringTabEntry* %42, i32 0, i32 5
  store i8 1, i8* %50, align 1
  %51 = getelementptr inbounds %struct.__Pyx_StringTabEntry, %struct.__Pyx_StringTabEntry* %42, i32 0, i32 6
  store i8 1, i8* %51, align 2
  %52 = getelementptr inbounds %struct.__Pyx_StringTabEntry, %struct.__Pyx_StringTabEntry* %42, i64 1
  %53 = getelementptr inbounds %struct.__Pyx_StringTabEntry, %struct.__Pyx_StringTabEntry* %52, i32 0, i32 0
  %54 = load %struct.__pyx_mstate*, %struct.__pyx_mstate** @__pyx_mstate_global, align 8
  %55 = getelementptr inbounds %struct.__pyx_mstate, %struct.__pyx_mstate* %54, i32 0, i32 11
  store %struct._object** %55, %struct._object*** %53, align 8
  %56 = getelementptr inbounds %struct.__Pyx_StringTabEntry, %struct.__Pyx_StringTabEntry* %52, i32 0, i32 1
  store i8* getelementptr inbounds ([9 x i8], [9 x i8]* @__pyx_k_test, i64 0, i64 0), i8** %56, align 8
  %57 = getelementptr inbounds %struct.__Pyx_StringTabEntry, %struct.__Pyx_StringTabEntry* %52, i32 0, i32 2
  store i64 9, i64* %57, align 8
  %58 = getelementptr inbounds %struct.__Pyx_StringTabEntry, %struct.__Pyx_StringTabEntry* %52, i32 0, i32 3
  store i8* null, i8** %58, align 8
  %59 = getelementptr inbounds %struct.__Pyx_StringTabEntry, %struct.__Pyx_StringTabEntry* %52, i32 0, i32 4
  store i8 0, i8* %59, align 8
  %60 = getelementptr inbounds %struct.__Pyx_StringTabEntry, %struct.__Pyx_StringTabEntry* %52, i32 0, i32 5
  store i8 1, i8* %60, align 1
  %61 = getelementptr inbounds %struct.__Pyx_StringTabEntry, %struct.__Pyx_StringTabEntry* %52, i32 0, i32 6
  store i8 1, i8* %61, align 2
  %62 = getelementptr inbounds %struct.__Pyx_StringTabEntry, %struct.__Pyx_StringTabEntry* %52, i64 1
  %63 = getelementptr inbounds %struct.__Pyx_StringTabEntry, %struct.__Pyx_StringTabEntry* %62, i32 0, i32 0
  %64 = load %struct.__pyx_mstate*, %struct.__pyx_mstate** @__pyx_mstate_global, align 8
  %65 = getelementptr inbounds %struct.__pyx_mstate, %struct.__pyx_mstate* %64, i32 0, i32 12
  store %struct._object** %65, %struct._object*** %63, align 8
  %66 = getelementptr inbounds %struct.__Pyx_StringTabEntry, %struct.__Pyx_StringTabEntry* %62, i32 0, i32 1
  store i8* getelementptr inbounds ([2 x i8], [2 x i8]* @__pyx_k_x, i64 0, i64 0), i8** %66, align 8
  %67 = getelementptr inbounds %struct.__Pyx_StringTabEntry, %struct.__Pyx_StringTabEntry* %62, i32 0, i32 2
  store i64 2, i64* %67, align 8
  %68 = getelementptr inbounds %struct.__Pyx_StringTabEntry, %struct.__Pyx_StringTabEntry* %62, i32 0, i32 3
  store i8* null, i8** %68, align 8
  %69 = getelementptr inbounds %struct.__Pyx_StringTabEntry, %struct.__Pyx_StringTabEntry* %62, i32 0, i32 4
  store i8 0, i8* %69, align 8
  %70 = getelementptr inbounds %struct.__Pyx_StringTabEntry, %struct.__Pyx_StringTabEntry* %62, i32 0, i32 5
  store i8 1, i8* %70, align 1
  %71 = getelementptr inbounds %struct.__Pyx_StringTabEntry, %struct.__Pyx_StringTabEntry* %62, i32 0, i32 6
  store i8 1, i8* %71, align 2
  %72 = getelementptr inbounds %struct.__Pyx_StringTabEntry, %struct.__Pyx_StringTabEntry* %62, i64 1
  %73 = getelementptr inbounds %struct.__Pyx_StringTabEntry, %struct.__Pyx_StringTabEntry* %72, i32 0, i32 0
  %74 = load %struct.__pyx_mstate*, %struct.__pyx_mstate** @__pyx_mstate_global, align 8
  %75 = getelementptr inbounds %struct.__pyx_mstate, %struct.__pyx_mstate* %74, i32 0, i32 13
  store %struct._object** %75, %struct._object*** %73, align 8
  %76 = getelementptr inbounds %struct.__Pyx_StringTabEntry, %struct.__Pyx_StringTabEntry* %72, i32 0, i32 1
  store i8* getelementptr inbounds ([2 x i8], [2 x i8]* @__pyx_k_y, i64 0, i64 0), i8** %76, align 8
  %77 = getelementptr inbounds %struct.__Pyx_StringTabEntry, %struct.__Pyx_StringTabEntry* %72, i32 0, i32 2
  store i64 2, i64* %77, align 8
  %78 = getelementptr inbounds %struct.__Pyx_StringTabEntry, %struct.__Pyx_StringTabEntry* %72, i32 0, i32 3
  store i8* null, i8** %78, align 8
  %79 = getelementptr inbounds %struct.__Pyx_StringTabEntry, %struct.__Pyx_StringTabEntry* %72, i32 0, i32 4
  store i8 0, i8* %79, align 8
  %80 = getelementptr inbounds %struct.__Pyx_StringTabEntry, %struct.__Pyx_StringTabEntry* %72, i32 0, i32 5
  store i8 1, i8* %80, align 1
  %81 = getelementptr inbounds %struct.__Pyx_StringTabEntry, %struct.__Pyx_StringTabEntry* %72, i32 0, i32 6
  store i8 1, i8* %81, align 2
  %82 = getelementptr inbounds %struct.__Pyx_StringTabEntry, %struct.__Pyx_StringTabEntry* %72, i64 1
  %83 = getelementptr inbounds %struct.__Pyx_StringTabEntry, %struct.__Pyx_StringTabEntry* %82, i32 0, i32 0
  %84 = load %struct.__pyx_mstate*, %struct.__pyx_mstate** @__pyx_mstate_global, align 8
  %85 = getelementptr inbounds %struct.__pyx_mstate, %struct.__pyx_mstate* %84, i32 0, i32 14
  store %struct._object** %85, %struct._object*** %83, align 8
  %86 = getelementptr inbounds %struct.__Pyx_StringTabEntry, %struct.__Pyx_StringTabEntry* %82, i32 0, i32 1
  store i8* getelementptr inbounds ([2 x i8], [2 x i8]* @__pyx_k_z, i64 0, i64 0), i8** %86, align 8
  %87 = getelementptr inbounds %struct.__Pyx_StringTabEntry, %struct.__Pyx_StringTabEntry* %82, i32 0, i32 2
  store i64 2, i64* %87, align 8
  %88 = getelementptr inbounds %struct.__Pyx_StringTabEntry, %struct.__Pyx_StringTabEntry* %82, i32 0, i32 3
  store i8* null, i8** %88, align 8
  %89 = getelementptr inbounds %struct.__Pyx_StringTabEntry, %struct.__Pyx_StringTabEntry* %82, i32 0, i32 4
  store i8 0, i8* %89, align 8
  %90 = getelementptr inbounds %struct.__Pyx_StringTabEntry, %struct.__Pyx_StringTabEntry* %82, i32 0, i32 5
  store i8 1, i8* %90, align 1
  %91 = getelementptr inbounds %struct.__Pyx_StringTabEntry, %struct.__Pyx_StringTabEntry* %82, i32 0, i32 6
  store i8 1, i8* %91, align 2
  %92 = getelementptr inbounds %struct.__Pyx_StringTabEntry, %struct.__Pyx_StringTabEntry* %82, i64 1
  %93 = bitcast %struct.__Pyx_StringTabEntry* %92 to i8*
  call void @llvm.memset.p0i8.i64(i8* align 8 %93, i8 0, i64 40, i1 false)
  %94 = getelementptr inbounds [10 x %struct.__Pyx_StringTabEntry], [10 x %struct.__Pyx_StringTabEntry]* %1, i64 0, i64 0
  %95 = call i32 @__Pyx_InitStrings(%struct.__Pyx_StringTabEntry* noundef %94)
  ret i32 %95
}

declare %struct._object* @PyLong_FromLong(i64 noundef) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @__Pyx_InitStrings(%struct.__Pyx_StringTabEntry* noundef %0) #0 {
  %2 = alloca %struct.__Pyx_StringTabEntry*, align 8
  store %struct.__Pyx_StringTabEntry* %0, %struct.__Pyx_StringTabEntry** %2, align 8
  br label %3

3:                                                ; preds = %8, %1
  %4 = load %struct.__Pyx_StringTabEntry*, %struct.__Pyx_StringTabEntry** %2, align 8
  %5 = getelementptr inbounds %struct.__Pyx_StringTabEntry, %struct.__Pyx_StringTabEntry* %4, i32 0, i32 0
  %6 = load %struct._object**, %struct._object*** %5, align 8
  %7 = icmp ne %struct._object** %6, null
  br i1 %7, label %8, label %16

8:                                                ; preds = %3
  %9 = load %struct.__Pyx_StringTabEntry*, %struct.__Pyx_StringTabEntry** %2, align 8
  %10 = load %struct.__Pyx_StringTabEntry*, %struct.__Pyx_StringTabEntry** %2, align 8
  %11 = getelementptr inbounds %struct.__Pyx_StringTabEntry, %struct.__Pyx_StringTabEntry* %10, i32 0, i32 0
  %12 = load %struct._object**, %struct._object*** %11, align 8
  %13 = call i32 @__Pyx_InitString(%struct.__Pyx_StringTabEntry* noundef byval(%struct.__Pyx_StringTabEntry) align 8 %9, %struct._object** noundef %12)
  %14 = load %struct.__Pyx_StringTabEntry*, %struct.__Pyx_StringTabEntry** %2, align 8
  %15 = getelementptr inbounds %struct.__Pyx_StringTabEntry, %struct.__Pyx_StringTabEntry* %14, i32 1
  store %struct.__Pyx_StringTabEntry* %15, %struct.__Pyx_StringTabEntry** %2, align 8
  br label %3, !llvm.loop !9

16:                                               ; preds = %3
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @__Pyx_InitString(%struct.__Pyx_StringTabEntry* noundef byval(%struct.__Pyx_StringTabEntry) align 8 %0, %struct._object** noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca %struct._object**, align 8
  store %struct._object** %1, %struct._object*** %4, align 8
  %5 = getelementptr inbounds %struct.__Pyx_StringTabEntry, %struct.__Pyx_StringTabEntry* %0, i32 0, i32 4
  %6 = load i8, i8* %5, align 8
  %7 = sext i8 %6 to i32
  %8 = getelementptr inbounds %struct.__Pyx_StringTabEntry, %struct.__Pyx_StringTabEntry* %0, i32 0, i32 5
  %9 = load i8, i8* %8, align 1
  %10 = sext i8 %9 to i32
  %11 = or i32 %7, %10
  %12 = icmp ne i32 %11, 0
  br i1 %12, label %13, label %46

13:                                               ; preds = %2
  %14 = getelementptr inbounds %struct.__Pyx_StringTabEntry, %struct.__Pyx_StringTabEntry* %0, i32 0, i32 6
  %15 = load i8, i8* %14, align 2
  %16 = icmp ne i8 %15, 0
  br i1 %16, label %17, label %22

17:                                               ; preds = %13
  %18 = getelementptr inbounds %struct.__Pyx_StringTabEntry, %struct.__Pyx_StringTabEntry* %0, i32 0, i32 1
  %19 = load i8*, i8** %18, align 8
  %20 = call %struct._object* @PyUnicode_InternFromString(i8* noundef %19)
  %21 = load %struct._object**, %struct._object*** %4, align 8
  store %struct._object* %20, %struct._object** %21, align 8
  br label %45

22:                                               ; preds = %13
  %23 = getelementptr inbounds %struct.__Pyx_StringTabEntry, %struct.__Pyx_StringTabEntry* %0, i32 0, i32 3
  %24 = load i8*, i8** %23, align 8
  %25 = icmp ne i8* %24, null
  br i1 %25, label %26, label %36

26:                                               ; preds = %22
  %27 = getelementptr inbounds %struct.__Pyx_StringTabEntry, %struct.__Pyx_StringTabEntry* %0, i32 0, i32 1
  %28 = load i8*, i8** %27, align 8
  %29 = getelementptr inbounds %struct.__Pyx_StringTabEntry, %struct.__Pyx_StringTabEntry* %0, i32 0, i32 2
  %30 = load i64, i64* %29, align 8
  %31 = sub nsw i64 %30, 1
  %32 = getelementptr inbounds %struct.__Pyx_StringTabEntry, %struct.__Pyx_StringTabEntry* %0, i32 0, i32 3
  %33 = load i8*, i8** %32, align 8
  %34 = call %struct._object* @PyUnicode_Decode(i8* noundef %28, i64 noundef %31, i8* noundef %33, i8* noundef null)
  %35 = load %struct._object**, %struct._object*** %4, align 8
  store %struct._object* %34, %struct._object** %35, align 8
  br label %44

36:                                               ; preds = %22
  %37 = getelementptr inbounds %struct.__Pyx_StringTabEntry, %struct.__Pyx_StringTabEntry* %0, i32 0, i32 1
  %38 = load i8*, i8** %37, align 8
  %39 = getelementptr inbounds %struct.__Pyx_StringTabEntry, %struct.__Pyx_StringTabEntry* %0, i32 0, i32 2
  %40 = load i64, i64* %39, align 8
  %41 = sub nsw i64 %40, 1
  %42 = call %struct._object* @PyUnicode_FromStringAndSize(i8* noundef %38, i64 noundef %41)
  %43 = load %struct._object**, %struct._object*** %4, align 8
  store %struct._object* %42, %struct._object** %43, align 8
  br label %44

44:                                               ; preds = %36, %26
  br label %45

45:                                               ; preds = %44, %17
  br label %54

46:                                               ; preds = %2
  %47 = getelementptr inbounds %struct.__Pyx_StringTabEntry, %struct.__Pyx_StringTabEntry* %0, i32 0, i32 1
  %48 = load i8*, i8** %47, align 8
  %49 = getelementptr inbounds %struct.__Pyx_StringTabEntry, %struct.__Pyx_StringTabEntry* %0, i32 0, i32 2
  %50 = load i64, i64* %49, align 8
  %51 = sub nsw i64 %50, 1
  %52 = call %struct._object* @PyBytes_FromStringAndSize(i8* noundef %48, i64 noundef %51)
  %53 = load %struct._object**, %struct._object*** %4, align 8
  store %struct._object* %52, %struct._object** %53, align 8
  br label %54

54:                                               ; preds = %46, %45
  %55 = load %struct._object**, %struct._object*** %4, align 8
  %56 = load %struct._object*, %struct._object** %55, align 8
  %57 = icmp ne %struct._object* %56, null
  br i1 %57, label %59, label %58

58:                                               ; preds = %54
  store i32 -1, i32* %3, align 4
  br label %66

59:                                               ; preds = %54
  %60 = load %struct._object**, %struct._object*** %4, align 8
  %61 = load %struct._object*, %struct._object** %60, align 8
  %62 = call i64 @PyObject_Hash(%struct._object* noundef %61)
  %63 = icmp eq i64 %62, -1
  br i1 %63, label %64, label %65

64:                                               ; preds = %59
  store i32 -1, i32* %3, align 4
  br label %66

65:                                               ; preds = %59
  store i32 0, i32* %3, align 4
  br label %66

66:                                               ; preds = %65, %64, %58
  %67 = load i32, i32* %3, align 4
  ret i32 %67
}

declare %struct._object* @PyUnicode_InternFromString(i8* noundef) #1

declare %struct._object* @PyUnicode_Decode(i8* noundef, i64 noundef, i8* noundef, i8* noundef) #1

declare i64 @PyObject_Hash(%struct._object* noundef) #1

; Function Attrs: noinline nounwind optnone uwtable
define internal %struct._object* @__Pyx_PyObject_GetAttrStrNoError(%struct._object* noundef %0, %struct._object* noundef %1) #0 {
  %3 = alloca %struct._object*, align 8
  %4 = alloca %struct._object*, align 8
  %5 = alloca %struct._object*, align 8
  %6 = alloca %struct._object*, align 8
  %7 = alloca %struct._typeobject*, align 8
  store %struct._object* %0, %struct._object** %4, align 8
  store %struct._object* %1, %struct._object** %5, align 8
  %8 = load %struct._object*, %struct._object** %4, align 8
  %9 = getelementptr inbounds %struct._object, %struct._object* %8, i32 0, i32 1
  %10 = load %struct._typeobject*, %struct._typeobject** %9, align 8
  store %struct._typeobject* %10, %struct._typeobject** %7, align 8
  %11 = load %struct._typeobject*, %struct._typeobject** %7, align 8
  %12 = getelementptr inbounds %struct._typeobject, %struct._typeobject* %11, i32 0, i32 16
  %13 = load %struct._object* (%struct._object*, %struct._object*)*, %struct._object* (%struct._object*, %struct._object*)** %12, align 8
  %14 = icmp eq %struct._object* (%struct._object*, %struct._object*)* %13, @PyObject_GenericGetAttr
  %15 = xor i1 %14, true
  %16 = xor i1 %15, true
  %17 = zext i1 %16 to i32
  %18 = sext i32 %17 to i64
  %19 = icmp ne i64 %18, 0
  br i1 %19, label %20, label %24

20:                                               ; preds = %2
  %21 = load %struct._object*, %struct._object** %4, align 8
  %22 = load %struct._object*, %struct._object** %5, align 8
  %23 = call %struct._object* @_PyObject_GenericGetAttrWithDict(%struct._object* noundef %21, %struct._object* noundef %22, %struct._object* noundef null, i32 noundef 1)
  store %struct._object* %23, %struct._object** %3, align 8
  br label %39

24:                                               ; preds = %2
  %25 = load %struct._object*, %struct._object** %4, align 8
  %26 = load %struct._object*, %struct._object** %5, align 8
  %27 = call %struct._object* @__Pyx_PyObject_GetAttrStr(%struct._object* noundef %25, %struct._object* noundef %26)
  store %struct._object* %27, %struct._object** %6, align 8
  %28 = load %struct._object*, %struct._object** %6, align 8
  %29 = icmp ne %struct._object* %28, null
  %30 = xor i1 %29, true
  %31 = xor i1 %30, true
  %32 = xor i1 %31, true
  %33 = zext i1 %32 to i32
  %34 = sext i32 %33 to i64
  %35 = icmp ne i64 %34, 0
  br i1 %35, label %36, label %37

36:                                               ; preds = %24
  call void @__Pyx_PyObject_GetAttrStr_ClearAttributeError()
  br label %37

37:                                               ; preds = %36, %24
  %38 = load %struct._object*, %struct._object** %6, align 8
  store %struct._object* %38, %struct._object** %3, align 8
  br label %39

39:                                               ; preds = %37, %20
  %40 = load %struct._object*, %struct._object** %3, align 8
  ret %struct._object* %40
}

declare %struct._object* @PyErr_Format(%struct._object* noundef, i8* noundef, ...) #1

declare %struct._object* @PyObject_GenericGetAttr(%struct._object* noundef, %struct._object* noundef) #1

declare %struct._object* @_PyObject_GenericGetAttrWithDict(%struct._object* noundef, %struct._object* noundef, %struct._object* noundef, i32 noundef) #1

; Function Attrs: noinline nounwind optnone uwtable
define internal %struct._object* @__Pyx_PyObject_GetAttrStr(%struct._object* noundef %0, %struct._object* noundef %1) #0 {
  %3 = alloca %struct._object*, align 8
  %4 = alloca %struct._object*, align 8
  %5 = alloca %struct._object*, align 8
  %6 = alloca %struct._typeobject*, align 8
  store %struct._object* %0, %struct._object** %4, align 8
  store %struct._object* %1, %struct._object** %5, align 8
  %7 = load %struct._object*, %struct._object** %4, align 8
  %8 = getelementptr inbounds %struct._object, %struct._object* %7, i32 0, i32 1
  %9 = load %struct._typeobject*, %struct._typeobject** %8, align 8
  store %struct._typeobject* %9, %struct._typeobject** %6, align 8
  %10 = load %struct._typeobject*, %struct._typeobject** %6, align 8
  %11 = getelementptr inbounds %struct._typeobject, %struct._typeobject* %10, i32 0, i32 16
  %12 = load %struct._object* (%struct._object*, %struct._object*)*, %struct._object* (%struct._object*, %struct._object*)** %11, align 8
  %13 = icmp ne %struct._object* (%struct._object*, %struct._object*)* %12, null
  %14 = xor i1 %13, true
  %15 = xor i1 %14, true
  %16 = zext i1 %15 to i32
  %17 = sext i32 %16 to i64
  %18 = icmp ne i64 %17, 0
  br i1 %18, label %19, label %26

19:                                               ; preds = %2
  %20 = load %struct._typeobject*, %struct._typeobject** %6, align 8
  %21 = getelementptr inbounds %struct._typeobject, %struct._typeobject* %20, i32 0, i32 16
  %22 = load %struct._object* (%struct._object*, %struct._object*)*, %struct._object* (%struct._object*, %struct._object*)** %21, align 8
  %23 = load %struct._object*, %struct._object** %4, align 8
  %24 = load %struct._object*, %struct._object** %5, align 8
  %25 = call %struct._object* %22(%struct._object* noundef %23, %struct._object* noundef %24)
  store %struct._object* %25, %struct._object** %3, align 8
  br label %30

26:                                               ; preds = %2
  %27 = load %struct._object*, %struct._object** %4, align 8
  %28 = load %struct._object*, %struct._object** %5, align 8
  %29 = call %struct._object* @PyObject_GetAttr(%struct._object* noundef %27, %struct._object* noundef %28)
  store %struct._object* %29, %struct._object** %3, align 8
  br label %30

30:                                               ; preds = %26, %19
  %31 = load %struct._object*, %struct._object** %3, align 8
  ret %struct._object* %31
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @__Pyx_PyObject_GetAttrStr_ClearAttributeError() #0 {
  %1 = alloca %struct._ts*, align 8
  %2 = call %struct._ts* @_PyThreadState_UncheckedGet()
  store %struct._ts* %2, %struct._ts** %1, align 8
  %3 = load %struct._ts*, %struct._ts** %1, align 8
  %4 = load %struct._object*, %struct._object** @PyExc_AttributeError, align 8
  %5 = call i32 @__Pyx_PyErr_ExceptionMatchesInState(%struct._ts* noundef %3, %struct._object* noundef %4)
  %6 = icmp ne i32 %5, 0
  %7 = xor i1 %6, true
  %8 = xor i1 %7, true
  %9 = zext i1 %8 to i32
  %10 = sext i32 %9 to i64
  %11 = icmp ne i64 %10, 0
  br i1 %11, label %12, label %14

12:                                               ; preds = %0
  %13 = load %struct._ts*, %struct._ts** %1, align 8
  call void @__Pyx_ErrRestoreInState(%struct._ts* noundef %13, %struct._object* noundef null, %struct._object* noundef null, %struct._object* noundef null)
  br label %14

14:                                               ; preds = %12, %0
  ret void
}

declare %struct._object* @PyObject_GetAttr(%struct._object* noundef, %struct._object* noundef) #1

declare %struct._ts* @_PyThreadState_UncheckedGet() #1

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @__Pyx_PyErr_ExceptionMatchesInState(%struct._ts* noundef %0, %struct._object* noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca %struct._ts*, align 8
  %5 = alloca %struct._object*, align 8
  %6 = alloca i32, align 4
  %7 = alloca %struct._object*, align 8
  store %struct._ts* %0, %struct._ts** %4, align 8
  store %struct._object* %1, %struct._object** %5, align 8
  %8 = load %struct._ts*, %struct._ts** %4, align 8
  %9 = getelementptr inbounds %struct._ts, %struct._ts* %8, i32 0, i32 13
  %10 = load %struct._object*, %struct._object** %9, align 8
  store %struct._object* %10, %struct._object** %7, align 8
  %11 = load %struct._object*, %struct._object** %7, align 8
  %12 = load %struct._object*, %struct._object** %5, align 8
  %13 = icmp eq %struct._object* %11, %12
  br i1 %13, label %14, label %15

14:                                               ; preds = %2
  store i32 1, i32* %3, align 4
  br label %46

15:                                               ; preds = %2
  %16 = load %struct._object*, %struct._object** %7, align 8
  %17 = icmp ne %struct._object* %16, null
  %18 = xor i1 %17, true
  %19 = xor i1 %18, true
  %20 = xor i1 %19, true
  %21 = zext i1 %20 to i32
  %22 = sext i32 %21 to i64
  %23 = icmp ne i64 %22, 0
  br i1 %23, label %24, label %25

24:                                               ; preds = %15
  store i32 0, i32* %3, align 4
  br label %46

25:                                               ; preds = %15
  %26 = load %struct._object*, %struct._object** %5, align 8
  %27 = getelementptr inbounds %struct._object, %struct._object* %26, i32 0, i32 1
  %28 = load %struct._typeobject*, %struct._typeobject** %27, align 8
  %29 = call i32 @PyType_HasFeature(%struct._typeobject* noundef %28, i64 noundef 67108864)
  %30 = icmp ne i32 %29, 0
  %31 = xor i1 %30, true
  %32 = xor i1 %31, true
  %33 = zext i1 %32 to i32
  %34 = sext i32 %33 to i64
  %35 = icmp ne i64 %34, 0
  br i1 %35, label %36, label %40

36:                                               ; preds = %25
  %37 = load %struct._object*, %struct._object** %7, align 8
  %38 = load %struct._object*, %struct._object** %5, align 8
  %39 = call i32 @__Pyx_PyErr_ExceptionMatchesTuple(%struct._object* noundef %37, %struct._object* noundef %38)
  store i32 %39, i32* %6, align 4
  br label %44

40:                                               ; preds = %25
  %41 = load %struct._object*, %struct._object** %7, align 8
  %42 = load %struct._object*, %struct._object** %5, align 8
  %43 = call i32 @__Pyx_PyErr_GivenExceptionMatches(%struct._object* noundef %41, %struct._object* noundef %42)
  store i32 %43, i32* %6, align 4
  br label %44

44:                                               ; preds = %40, %36
  %45 = load i32, i32* %6, align 4
  store i32 %45, i32* %3, align 4
  br label %46

46:                                               ; preds = %44, %24, %14
  %47 = load i32, i32* %3, align 4
  ret i32 %47
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @__Pyx_ErrRestoreInState(%struct._ts* noundef %0, %struct._object* noundef %1, %struct._object* noundef %2, %struct._object* noundef %3) #0 {
  %5 = alloca %struct._ts*, align 8
  %6 = alloca %struct._object*, align 8
  %7 = alloca %struct._object*, align 8
  %8 = alloca %struct._object*, align 8
  %9 = alloca %struct._object*, align 8
  %10 = alloca %struct._object*, align 8
  %11 = alloca %struct._object*, align 8
  store %struct._ts* %0, %struct._ts** %5, align 8
  store %struct._object* %1, %struct._object** %6, align 8
  store %struct._object* %2, %struct._object** %7, align 8
  store %struct._object* %3, %struct._object** %8, align 8
  %12 = load %struct._ts*, %struct._ts** %5, align 8
  %13 = getelementptr inbounds %struct._ts, %struct._ts* %12, i32 0, i32 13
  %14 = load %struct._object*, %struct._object** %13, align 8
  store %struct._object* %14, %struct._object** %9, align 8
  %15 = load %struct._ts*, %struct._ts** %5, align 8
  %16 = getelementptr inbounds %struct._ts, %struct._ts* %15, i32 0, i32 14
  %17 = load %struct._object*, %struct._object** %16, align 8
  store %struct._object* %17, %struct._object** %10, align 8
  %18 = load %struct._ts*, %struct._ts** %5, align 8
  %19 = getelementptr inbounds %struct._ts, %struct._ts* %18, i32 0, i32 15
  %20 = load %struct._object*, %struct._object** %19, align 8
  store %struct._object* %20, %struct._object** %11, align 8
  %21 = load %struct._object*, %struct._object** %6, align 8
  %22 = load %struct._ts*, %struct._ts** %5, align 8
  %23 = getelementptr inbounds %struct._ts, %struct._ts* %22, i32 0, i32 13
  store %struct._object* %21, %struct._object** %23, align 8
  %24 = load %struct._object*, %struct._object** %7, align 8
  %25 = load %struct._ts*, %struct._ts** %5, align 8
  %26 = getelementptr inbounds %struct._ts, %struct._ts* %25, i32 0, i32 14
  store %struct._object* %24, %struct._object** %26, align 8
  %27 = load %struct._object*, %struct._object** %8, align 8
  %28 = load %struct._ts*, %struct._ts** %5, align 8
  %29 = getelementptr inbounds %struct._ts, %struct._ts* %28, i32 0, i32 15
  store %struct._object* %27, %struct._object** %29, align 8
  %30 = load %struct._object*, %struct._object** %9, align 8
  call void @_Py_XDECREF(%struct._object* noundef %30)
  %31 = load %struct._object*, %struct._object** %10, align 8
  call void @_Py_XDECREF(%struct._object* noundef %31)
  %32 = load %struct._object*, %struct._object** %11, align 8
  call void @_Py_XDECREF(%struct._object* noundef %32)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @PyType_HasFeature(%struct._typeobject* noundef %0, i64 noundef %1) #0 {
  %3 = alloca %struct._typeobject*, align 8
  %4 = alloca i64, align 8
  %5 = alloca i64, align 8
  store %struct._typeobject* %0, %struct._typeobject** %3, align 8
  store i64 %1, i64* %4, align 8
  %6 = load %struct._typeobject*, %struct._typeobject** %3, align 8
  %7 = getelementptr inbounds %struct._typeobject, %struct._typeobject* %6, i32 0, i32 19
  %8 = load i64, i64* %7, align 8
  store i64 %8, i64* %5, align 8
  %9 = load i64, i64* %5, align 8
  %10 = load i64, i64* %4, align 8
  %11 = and i64 %9, %10
  %12 = icmp ne i64 %11, 0
  %13 = zext i1 %12 to i32
  ret i32 %13
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @__Pyx_PyErr_ExceptionMatchesTuple(%struct._object* noundef %0, %struct._object* noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca %struct._object*, align 8
  %5 = alloca %struct._object*, align 8
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  store %struct._object* %0, %struct._object** %4, align 8
  store %struct._object* %1, %struct._object** %5, align 8
  %8 = load %struct._object*, %struct._object** %5, align 8
  %9 = getelementptr inbounds %struct._object, %struct._object* %8, i32 0, i32 1
  %10 = load %struct._typeobject*, %struct._typeobject** %9, align 8
  %11 = call i32 @PyType_HasFeature(%struct._typeobject* noundef %10, i64 noundef 67108864)
  %12 = icmp ne i32 %11, 0
  br i1 %12, label %13, label %14

13:                                               ; preds = %2
  br label %15

14:                                               ; preds = %2
  call void @__assert_fail(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.30, i64 0, i64 0), i8* noundef getelementptr inbounds ([14 x i8], [14 x i8]* @.str.31, i64 0, i64 0), i32 noundef 2549, i8* noundef getelementptr inbounds ([62 x i8], [62 x i8]* @__PRETTY_FUNCTION__.__Pyx_PyErr_ExceptionMatchesTuple, i64 0, i64 0)) #7
  unreachable

15:                                               ; preds = %13
  %16 = load %struct._object*, %struct._object** %5, align 8
  %17 = bitcast %struct._object* %16 to %struct.PyTupleObject*
  %18 = bitcast %struct.PyTupleObject* %17 to %struct.PyVarObject*
  %19 = getelementptr inbounds %struct.PyVarObject, %struct.PyVarObject* %18, i32 0, i32 1
  %20 = load i64, i64* %19, align 8
  store i64 %20, i64* %7, align 8
  store i64 0, i64* %6, align 8
  br label %21

21:                                               ; preds = %44, %15
  %22 = load i64, i64* %6, align 8
  %23 = load i64, i64* %7, align 8
  %24 = icmp slt i64 %22, %23
  br i1 %24, label %25, label %47

25:                                               ; preds = %21
  %26 = load %struct._object*, %struct._object** %4, align 8
  %27 = load %struct._object*, %struct._object** %5, align 8
  %28 = getelementptr inbounds %struct._object, %struct._object* %27, i32 0, i32 1
  %29 = load %struct._typeobject*, %struct._typeobject** %28, align 8
  %30 = call i32 @PyType_HasFeature(%struct._typeobject* noundef %29, i64 noundef 67108864)
  %31 = icmp ne i32 %30, 0
  br i1 %31, label %32, label %33

32:                                               ; preds = %25
  br label %34

33:                                               ; preds = %25
  call void @__assert_fail(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.30, i64 0, i64 0), i8* noundef getelementptr inbounds ([14 x i8], [14 x i8]* @.str.31, i64 0, i64 0), i32 noundef 2552, i8* noundef getelementptr inbounds ([62 x i8], [62 x i8]* @__PRETTY_FUNCTION__.__Pyx_PyErr_ExceptionMatchesTuple, i64 0, i64 0)) #7
  unreachable

34:                                               ; preds = %32
  %35 = load %struct._object*, %struct._object** %5, align 8
  %36 = bitcast %struct._object* %35 to %struct.PyTupleObject*
  %37 = getelementptr inbounds %struct.PyTupleObject, %struct.PyTupleObject* %36, i32 0, i32 1
  %38 = load i64, i64* %6, align 8
  %39 = getelementptr inbounds [1 x %struct._object*], [1 x %struct._object*]* %37, i64 0, i64 %38
  %40 = load %struct._object*, %struct._object** %39, align 8
  %41 = icmp eq %struct._object* %26, %40
  br i1 %41, label %42, label %43

42:                                               ; preds = %34
  store i32 1, i32* %3, align 4
  br label %76

43:                                               ; preds = %34
  br label %44

44:                                               ; preds = %43
  %45 = load i64, i64* %6, align 8
  %46 = add nsw i64 %45, 1
  store i64 %46, i64* %6, align 8
  br label %21, !llvm.loop !10

47:                                               ; preds = %21
  store i64 0, i64* %6, align 8
  br label %48

48:                                               ; preds = %72, %47
  %49 = load i64, i64* %6, align 8
  %50 = load i64, i64* %7, align 8
  %51 = icmp slt i64 %49, %50
  br i1 %51, label %52, label %75

52:                                               ; preds = %48
  %53 = load %struct._object*, %struct._object** %4, align 8
  %54 = load %struct._object*, %struct._object** %5, align 8
  %55 = getelementptr inbounds %struct._object, %struct._object* %54, i32 0, i32 1
  %56 = load %struct._typeobject*, %struct._typeobject** %55, align 8
  %57 = call i32 @PyType_HasFeature(%struct._typeobject* noundef %56, i64 noundef 67108864)
  %58 = icmp ne i32 %57, 0
  br i1 %58, label %59, label %60

59:                                               ; preds = %52
  br label %61

60:                                               ; preds = %52
  call void @__assert_fail(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.30, i64 0, i64 0), i8* noundef getelementptr inbounds ([14 x i8], [14 x i8]* @.str.31, i64 0, i64 0), i32 noundef 2556, i8* noundef getelementptr inbounds ([62 x i8], [62 x i8]* @__PRETTY_FUNCTION__.__Pyx_PyErr_ExceptionMatchesTuple, i64 0, i64 0)) #7
  unreachable

61:                                               ; preds = %59
  %62 = load %struct._object*, %struct._object** %5, align 8
  %63 = bitcast %struct._object* %62 to %struct.PyTupleObject*
  %64 = getelementptr inbounds %struct.PyTupleObject, %struct.PyTupleObject* %63, i32 0, i32 1
  %65 = load i64, i64* %6, align 8
  %66 = getelementptr inbounds [1 x %struct._object*], [1 x %struct._object*]* %64, i64 0, i64 %65
  %67 = load %struct._object*, %struct._object** %66, align 8
  %68 = call i32 @__Pyx_PyErr_GivenExceptionMatches(%struct._object* noundef %53, %struct._object* noundef %67)
  %69 = icmp ne i32 %68, 0
  br i1 %69, label %70, label %71

70:                                               ; preds = %61
  store i32 1, i32* %3, align 4
  br label %76

71:                                               ; preds = %61
  br label %72

72:                                               ; preds = %71
  %73 = load i64, i64* %6, align 8
  %74 = add nsw i64 %73, 1
  store i64 %74, i64* %6, align 8
  br label %48, !llvm.loop !11

75:                                               ; preds = %48
  store i32 0, i32* %3, align 4
  br label %76

76:                                               ; preds = %75, %70, %42
  %77 = load i32, i32* %3, align 4
  ret i32 %77
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @__Pyx_PyErr_GivenExceptionMatches(%struct._object* noundef %0, %struct._object* noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca %struct._object*, align 8
  %5 = alloca %struct._object*, align 8
  store %struct._object* %0, %struct._object** %4, align 8
  store %struct._object* %1, %struct._object** %5, align 8
  %6 = load %struct._object*, %struct._object** %4, align 8
  %7 = load %struct._object*, %struct._object** %5, align 8
  %8 = icmp eq %struct._object* %6, %7
  %9 = xor i1 %8, true
  %10 = xor i1 %9, true
  %11 = zext i1 %10 to i32
  %12 = sext i32 %11 to i64
  %13 = icmp ne i64 %12, 0
  br i1 %13, label %14, label %15

14:                                               ; preds = %2
  store i32 1, i32* %3, align 4
  br label %73

15:                                               ; preds = %2
  %16 = load %struct._object*, %struct._object** %4, align 8
  %17 = call i32 @_PyType_Check(%struct._object* noundef %16)
  %18 = icmp ne i32 %17, 0
  br i1 %18, label %19, label %24

19:                                               ; preds = %15
  %20 = load %struct._object*, %struct._object** %4, align 8
  %21 = bitcast %struct._object* %20 to %struct._typeobject*
  %22 = call i32 @PyType_HasFeature(%struct._typeobject* noundef %21, i64 noundef 1073741824)
  %23 = icmp ne i32 %22, 0
  br label %24

24:                                               ; preds = %19, %15
  %25 = phi i1 [ false, %15 ], [ %23, %19 ]
  %26 = xor i1 %25, true
  %27 = xor i1 %26, true
  %28 = zext i1 %27 to i32
  %29 = sext i32 %28 to i64
  %30 = icmp ne i64 %29, 0
  br i1 %30, label %31, label %69

31:                                               ; preds = %24
  %32 = load %struct._object*, %struct._object** %5, align 8
  %33 = call i32 @_PyType_Check(%struct._object* noundef %32)
  %34 = icmp ne i32 %33, 0
  br i1 %34, label %35, label %40

35:                                               ; preds = %31
  %36 = load %struct._object*, %struct._object** %5, align 8
  %37 = bitcast %struct._object* %36 to %struct._typeobject*
  %38 = call i32 @PyType_HasFeature(%struct._typeobject* noundef %37, i64 noundef 1073741824)
  %39 = icmp ne i32 %38, 0
  br label %40

40:                                               ; preds = %35, %31
  %41 = phi i1 [ false, %31 ], [ %39, %35 ]
  %42 = xor i1 %41, true
  %43 = xor i1 %42, true
  %44 = zext i1 %43 to i32
  %45 = sext i32 %44 to i64
  %46 = icmp ne i64 %45, 0
  br i1 %46, label %47, label %51

47:                                               ; preds = %40
  %48 = load %struct._object*, %struct._object** %4, align 8
  %49 = load %struct._object*, %struct._object** %5, align 8
  %50 = call i32 @__Pyx_inner_PyErr_GivenExceptionMatches2(%struct._object* noundef %48, %struct._object* noundef null, %struct._object* noundef %49)
  store i32 %50, i32* %3, align 4
  br label %73

51:                                               ; preds = %40
  %52 = load %struct._object*, %struct._object** %5, align 8
  %53 = getelementptr inbounds %struct._object, %struct._object* %52, i32 0, i32 1
  %54 = load %struct._typeobject*, %struct._typeobject** %53, align 8
  %55 = call i32 @PyType_HasFeature(%struct._typeobject* noundef %54, i64 noundef 67108864)
  %56 = icmp ne i32 %55, 0
  %57 = xor i1 %56, true
  %58 = xor i1 %57, true
  %59 = zext i1 %58 to i32
  %60 = sext i32 %59 to i64
  %61 = icmp ne i64 %60, 0
  br i1 %61, label %62, label %66

62:                                               ; preds = %51
  %63 = load %struct._object*, %struct._object** %4, align 8
  %64 = load %struct._object*, %struct._object** %5, align 8
  %65 = call i32 @__Pyx_PyErr_GivenExceptionMatchesTuple(%struct._object* noundef %63, %struct._object* noundef %64)
  store i32 %65, i32* %3, align 4
  br label %73

66:                                               ; preds = %51
  br label %67

67:                                               ; preds = %66
  br label %68

68:                                               ; preds = %67
  br label %69

69:                                               ; preds = %68, %24
  %70 = load %struct._object*, %struct._object** %4, align 8
  %71 = load %struct._object*, %struct._object** %5, align 8
  %72 = call i32 @PyErr_GivenExceptionMatches(%struct._object* noundef %70, %struct._object* noundef %71)
  store i32 %72, i32* %3, align 4
  br label %73

73:                                               ; preds = %69, %62, %47, %14
  %74 = load i32, i32* %3, align 4
  ret i32 %74
}

; Function Attrs: noreturn nounwind
declare void @__assert_fail(i8* noundef, i8* noundef, i32 noundef, i8* noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @_PyType_Check(%struct._object* noundef %0) #0 {
  %2 = alloca %struct._object*, align 8
  store %struct._object* %0, %struct._object** %2, align 8
  %3 = load %struct._object*, %struct._object** %2, align 8
  %4 = getelementptr inbounds %struct._object, %struct._object* %3, i32 0, i32 1
  %5 = load %struct._typeobject*, %struct._typeobject** %4, align 8
  %6 = call i32 @PyType_HasFeature(%struct._typeobject* noundef %5, i64 noundef 2147483648)
  ret i32 %6
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @__Pyx_inner_PyErr_GivenExceptionMatches2(%struct._object* noundef %0, %struct._object* noundef %1, %struct._object* noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca %struct._object*, align 8
  %6 = alloca %struct._object*, align 8
  %7 = alloca %struct._object*, align 8
  store %struct._object* %0, %struct._object** %5, align 8
  store %struct._object* %1, %struct._object** %6, align 8
  store %struct._object* %2, %struct._object** %7, align 8
  %8 = load %struct._object*, %struct._object** %6, align 8
  %9 = icmp ne %struct._object* %8, null
  br i1 %9, label %10, label %18

10:                                               ; preds = %3
  %11 = load %struct._object*, %struct._object** %5, align 8
  %12 = bitcast %struct._object* %11 to %struct._typeobject*
  %13 = load %struct._object*, %struct._object** %6, align 8
  %14 = bitcast %struct._object* %13 to %struct._typeobject*
  %15 = load %struct._object*, %struct._object** %7, align 8
  %16 = bitcast %struct._object* %15 to %struct._typeobject*
  %17 = call i32 @__Pyx_IsAnySubtype2(%struct._typeobject* noundef %12, %struct._typeobject* noundef %14, %struct._typeobject* noundef %16)
  store i32 %17, i32* %4, align 4
  br label %24

18:                                               ; preds = %3
  %19 = load %struct._object*, %struct._object** %5, align 8
  %20 = bitcast %struct._object* %19 to %struct._typeobject*
  %21 = load %struct._object*, %struct._object** %7, align 8
  %22 = bitcast %struct._object* %21 to %struct._typeobject*
  %23 = call i32 @__Pyx_IsSubtype(%struct._typeobject* noundef %20, %struct._typeobject* noundef %22)
  store i32 %23, i32* %4, align 4
  br label %24

24:                                               ; preds = %18, %10
  %25 = load i32, i32* %4, align 4
  ret i32 %25
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @__Pyx_PyErr_GivenExceptionMatchesTuple(%struct._object* noundef %0, %struct._object* noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca %struct._object*, align 8
  %5 = alloca %struct._object*, align 8
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  %8 = alloca %struct._object*, align 8
  store %struct._object* %0, %struct._object** %4, align 8
  store %struct._object* %1, %struct._object** %5, align 8
  %9 = load %struct._object*, %struct._object** %4, align 8
  %10 = call i32 @_PyType_Check(%struct._object* noundef %9)
  %11 = icmp ne i32 %10, 0
  br i1 %11, label %12, label %18

12:                                               ; preds = %2
  %13 = load %struct._object*, %struct._object** %4, align 8
  %14 = bitcast %struct._object* %13 to %struct._typeobject*
  %15 = call i32 @PyType_HasFeature(%struct._typeobject* noundef %14, i64 noundef 1073741824)
  %16 = icmp ne i32 %15, 0
  br i1 %16, label %17, label %18

17:                                               ; preds = %12
  br label %19

18:                                               ; preds = %12, %2
  call void @__assert_fail(i8* noundef getelementptr inbounds ([33 x i8], [33 x i8]* @.str.33, i64 0, i64 0), i8* noundef getelementptr inbounds ([14 x i8], [14 x i8]* @.str.31, i64 0, i64 0), i32 noundef 4150, i8* noundef getelementptr inbounds ([67 x i8], [67 x i8]* @__PRETTY_FUNCTION__.__Pyx_PyErr_GivenExceptionMatchesTuple, i64 0, i64 0)) #7
  unreachable

19:                                               ; preds = %17
  %20 = load %struct._object*, %struct._object** %5, align 8
  %21 = getelementptr inbounds %struct._object, %struct._object* %20, i32 0, i32 1
  %22 = load %struct._typeobject*, %struct._typeobject** %21, align 8
  %23 = call i32 @PyType_HasFeature(%struct._typeobject* noundef %22, i64 noundef 67108864)
  %24 = icmp ne i32 %23, 0
  br i1 %24, label %25, label %26

25:                                               ; preds = %19
  br label %27

26:                                               ; preds = %19
  call void @__assert_fail(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.30, i64 0, i64 0), i8* noundef getelementptr inbounds ([14 x i8], [14 x i8]* @.str.31, i64 0, i64 0), i32 noundef 4151, i8* noundef getelementptr inbounds ([67 x i8], [67 x i8]* @__PRETTY_FUNCTION__.__Pyx_PyErr_GivenExceptionMatchesTuple, i64 0, i64 0)) #7
  unreachable

27:                                               ; preds = %25
  %28 = load %struct._object*, %struct._object** %5, align 8
  %29 = bitcast %struct._object* %28 to %struct.PyTupleObject*
  %30 = bitcast %struct.PyTupleObject* %29 to %struct.PyVarObject*
  %31 = getelementptr inbounds %struct.PyVarObject, %struct.PyVarObject* %30, i32 0, i32 1
  %32 = load i64, i64* %31, align 8
  store i64 %32, i64* %7, align 8
  store i64 0, i64* %6, align 8
  br label %33

33:                                               ; preds = %56, %27
  %34 = load i64, i64* %6, align 8
  %35 = load i64, i64* %7, align 8
  %36 = icmp slt i64 %34, %35
  br i1 %36, label %37, label %59

37:                                               ; preds = %33
  %38 = load %struct._object*, %struct._object** %4, align 8
  %39 = load %struct._object*, %struct._object** %5, align 8
  %40 = getelementptr inbounds %struct._object, %struct._object* %39, i32 0, i32 1
  %41 = load %struct._typeobject*, %struct._typeobject** %40, align 8
  %42 = call i32 @PyType_HasFeature(%struct._typeobject* noundef %41, i64 noundef 67108864)
  %43 = icmp ne i32 %42, 0
  br i1 %43, label %44, label %45

44:                                               ; preds = %37
  br label %46

45:                                               ; preds = %37
  call void @__assert_fail(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.30, i64 0, i64 0), i8* noundef getelementptr inbounds ([14 x i8], [14 x i8]* @.str.31, i64 0, i64 0), i32 noundef 4154, i8* noundef getelementptr inbounds ([67 x i8], [67 x i8]* @__PRETTY_FUNCTION__.__Pyx_PyErr_GivenExceptionMatchesTuple, i64 0, i64 0)) #7
  unreachable

46:                                               ; preds = %44
  %47 = load %struct._object*, %struct._object** %5, align 8
  %48 = bitcast %struct._object* %47 to %struct.PyTupleObject*
  %49 = getelementptr inbounds %struct.PyTupleObject, %struct.PyTupleObject* %48, i32 0, i32 1
  %50 = load i64, i64* %6, align 8
  %51 = getelementptr inbounds [1 x %struct._object*], [1 x %struct._object*]* %49, i64 0, i64 %50
  %52 = load %struct._object*, %struct._object** %51, align 8
  %53 = icmp eq %struct._object* %38, %52
  br i1 %53, label %54, label %55

54:                                               ; preds = %46
  store i32 1, i32* %3, align 4
  br label %107

55:                                               ; preds = %46
  br label %56

56:                                               ; preds = %55
  %57 = load i64, i64* %6, align 8
  %58 = add nsw i64 %57, 1
  store i64 %58, i64* %6, align 8
  br label %33, !llvm.loop !12

59:                                               ; preds = %33
  store i64 0, i64* %6, align 8
  br label %60

60:                                               ; preds = %103, %59
  %61 = load i64, i64* %6, align 8
  %62 = load i64, i64* %7, align 8
  %63 = icmp slt i64 %61, %62
  br i1 %63, label %64, label %106

64:                                               ; preds = %60
  %65 = load %struct._object*, %struct._object** %5, align 8
  %66 = getelementptr inbounds %struct._object, %struct._object* %65, i32 0, i32 1
  %67 = load %struct._typeobject*, %struct._typeobject** %66, align 8
  %68 = call i32 @PyType_HasFeature(%struct._typeobject* noundef %67, i64 noundef 67108864)
  %69 = icmp ne i32 %68, 0
  br i1 %69, label %70, label %71

70:                                               ; preds = %64
  br label %72

71:                                               ; preds = %64
  call void @__assert_fail(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.30, i64 0, i64 0), i8* noundef getelementptr inbounds ([14 x i8], [14 x i8]* @.str.31, i64 0, i64 0), i32 noundef 4158, i8* noundef getelementptr inbounds ([67 x i8], [67 x i8]* @__PRETTY_FUNCTION__.__Pyx_PyErr_GivenExceptionMatchesTuple, i64 0, i64 0)) #7
  unreachable

72:                                               ; preds = %70
  %73 = load %struct._object*, %struct._object** %5, align 8
  %74 = bitcast %struct._object* %73 to %struct.PyTupleObject*
  %75 = getelementptr inbounds %struct.PyTupleObject, %struct.PyTupleObject* %74, i32 0, i32 1
  %76 = load i64, i64* %6, align 8
  %77 = getelementptr inbounds [1 x %struct._object*], [1 x %struct._object*]* %75, i64 0, i64 %76
  %78 = load %struct._object*, %struct._object** %77, align 8
  store %struct._object* %78, %struct._object** %8, align 8
  %79 = load %struct._object*, %struct._object** %8, align 8
  %80 = call i32 @_PyType_Check(%struct._object* noundef %79)
  %81 = icmp ne i32 %80, 0
  br i1 %81, label %82, label %87

82:                                               ; preds = %72
  %83 = load %struct._object*, %struct._object** %8, align 8
  %84 = bitcast %struct._object* %83 to %struct._typeobject*
  %85 = call i32 @PyType_HasFeature(%struct._typeobject* noundef %84, i64 noundef 1073741824)
  %86 = icmp ne i32 %85, 0
  br label %87

87:                                               ; preds = %82, %72
  %88 = phi i1 [ false, %72 ], [ %86, %82 ]
  %89 = xor i1 %88, true
  %90 = xor i1 %89, true
  %91 = zext i1 %90 to i32
  %92 = sext i32 %91 to i64
  %93 = icmp ne i64 %92, 0
  br i1 %93, label %94, label %101

94:                                               ; preds = %87
  %95 = load %struct._object*, %struct._object** %4, align 8
  %96 = load %struct._object*, %struct._object** %8, align 8
  %97 = call i32 @__Pyx_inner_PyErr_GivenExceptionMatches2(%struct._object* noundef %95, %struct._object* noundef null, %struct._object* noundef %96)
  %98 = icmp ne i32 %97, 0
  br i1 %98, label %99, label %100

99:                                               ; preds = %94
  store i32 1, i32* %3, align 4
  br label %107

100:                                              ; preds = %94
  br label %102

101:                                              ; preds = %87
  br label %102

102:                                              ; preds = %101, %100
  br label %103

103:                                              ; preds = %102
  %104 = load i64, i64* %6, align 8
  %105 = add nsw i64 %104, 1
  store i64 %105, i64* %6, align 8
  br label %60, !llvm.loop !13

106:                                              ; preds = %60
  store i32 0, i32* %3, align 4
  br label %107

107:                                              ; preds = %106, %99, %54
  %108 = load i32, i32* %3, align 4
  ret i32 %108
}

declare i32 @PyErr_GivenExceptionMatches(%struct._object* noundef, %struct._object* noundef) #1

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @__Pyx_IsAnySubtype2(%struct._typeobject* noundef %0, %struct._typeobject* noundef %1, %struct._typeobject* noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca %struct._typeobject*, align 8
  %6 = alloca %struct._typeobject*, align 8
  %7 = alloca %struct._typeobject*, align 8
  %8 = alloca %struct._object*, align 8
  %9 = alloca i64, align 8
  %10 = alloca i64, align 8
  %11 = alloca %struct._object*, align 8
  store %struct._typeobject* %0, %struct._typeobject** %5, align 8
  store %struct._typeobject* %1, %struct._typeobject** %6, align 8
  store %struct._typeobject* %2, %struct._typeobject** %7, align 8
  %12 = load %struct._typeobject*, %struct._typeobject** %5, align 8
  %13 = load %struct._typeobject*, %struct._typeobject** %6, align 8
  %14 = icmp eq %struct._typeobject* %12, %13
  br i1 %14, label %19, label %15

15:                                               ; preds = %3
  %16 = load %struct._typeobject*, %struct._typeobject** %5, align 8
  %17 = load %struct._typeobject*, %struct._typeobject** %7, align 8
  %18 = icmp eq %struct._typeobject* %16, %17
  br i1 %18, label %19, label %20

19:                                               ; preds = %15, %3
  store i32 1, i32* %4, align 4
  br label %92

20:                                               ; preds = %15
  %21 = load %struct._typeobject*, %struct._typeobject** %5, align 8
  %22 = getelementptr inbounds %struct._typeobject, %struct._typeobject* %21, i32 0, i32 41
  %23 = load %struct._object*, %struct._object** %22, align 8
  store %struct._object* %23, %struct._object** %8, align 8
  %24 = load %struct._object*, %struct._object** %8, align 8
  %25 = icmp ne %struct._object* %24, null
  %26 = xor i1 %25, true
  %27 = xor i1 %26, true
  %28 = zext i1 %27 to i32
  %29 = sext i32 %28 to i64
  %30 = icmp ne i64 %29, 0
  br i1 %30, label %31, label %79

31:                                               ; preds = %20
  %32 = load %struct._object*, %struct._object** %8, align 8
  %33 = getelementptr inbounds %struct._object, %struct._object* %32, i32 0, i32 1
  %34 = load %struct._typeobject*, %struct._typeobject** %33, align 8
  %35 = call i32 @PyType_HasFeature(%struct._typeobject* noundef %34, i64 noundef 67108864)
  %36 = icmp ne i32 %35, 0
  br i1 %36, label %37, label %38

37:                                               ; preds = %31
  br label %39

38:                                               ; preds = %31
  call void @__assert_fail(i8* noundef getelementptr inbounds ([19 x i8], [19 x i8]* @.str.32, i64 0, i64 0), i8* noundef getelementptr inbounds ([14 x i8], [14 x i8]* @.str.31, i64 0, i64 0), i32 noundef 4107, i8* noundef getelementptr inbounds ([72 x i8], [72 x i8]* @__PRETTY_FUNCTION__.__Pyx_IsAnySubtype2, i64 0, i64 0)) #7
  unreachable

39:                                               ; preds = %37
  %40 = load %struct._object*, %struct._object** %8, align 8
  %41 = bitcast %struct._object* %40 to %struct.PyTupleObject*
  %42 = bitcast %struct.PyTupleObject* %41 to %struct.PyVarObject*
  %43 = getelementptr inbounds %struct.PyVarObject, %struct.PyVarObject* %42, i32 0, i32 1
  %44 = load i64, i64* %43, align 8
  store i64 %44, i64* %10, align 8
  store i64 0, i64* %9, align 8
  br label %45

45:                                               ; preds = %75, %39
  %46 = load i64, i64* %9, align 8
  %47 = load i64, i64* %10, align 8
  %48 = icmp slt i64 %46, %47
  br i1 %48, label %49, label %78

49:                                               ; preds = %45
  %50 = load %struct._object*, %struct._object** %8, align 8
  %51 = getelementptr inbounds %struct._object, %struct._object* %50, i32 0, i32 1
  %52 = load %struct._typeobject*, %struct._typeobject** %51, align 8
  %53 = call i32 @PyType_HasFeature(%struct._typeobject* noundef %52, i64 noundef 67108864)
  %54 = icmp ne i32 %53, 0
  br i1 %54, label %55, label %56

55:                                               ; preds = %49
  br label %57

56:                                               ; preds = %49
  call void @__assert_fail(i8* noundef getelementptr inbounds ([19 x i8], [19 x i8]* @.str.32, i64 0, i64 0), i8* noundef getelementptr inbounds ([14 x i8], [14 x i8]* @.str.31, i64 0, i64 0), i32 noundef 4109, i8* noundef getelementptr inbounds ([72 x i8], [72 x i8]* @__PRETTY_FUNCTION__.__Pyx_IsAnySubtype2, i64 0, i64 0)) #7
  unreachable

57:                                               ; preds = %55
  %58 = load %struct._object*, %struct._object** %8, align 8
  %59 = bitcast %struct._object* %58 to %struct.PyTupleObject*
  %60 = getelementptr inbounds %struct.PyTupleObject, %struct.PyTupleObject* %59, i32 0, i32 1
  %61 = load i64, i64* %9, align 8
  %62 = getelementptr inbounds [1 x %struct._object*], [1 x %struct._object*]* %60, i64 0, i64 %61
  %63 = load %struct._object*, %struct._object** %62, align 8
  store %struct._object* %63, %struct._object** %11, align 8
  %64 = load %struct._object*, %struct._object** %11, align 8
  %65 = load %struct._typeobject*, %struct._typeobject** %6, align 8
  %66 = bitcast %struct._typeobject* %65 to %struct._object*
  %67 = icmp eq %struct._object* %64, %66
  br i1 %67, label %73, label %68

68:                                               ; preds = %57
  %69 = load %struct._object*, %struct._object** %11, align 8
  %70 = load %struct._typeobject*, %struct._typeobject** %7, align 8
  %71 = bitcast %struct._typeobject* %70 to %struct._object*
  %72 = icmp eq %struct._object* %69, %71
  br i1 %72, label %73, label %74

73:                                               ; preds = %68, %57
  store i32 1, i32* %4, align 4
  br label %92

74:                                               ; preds = %68
  br label %75

75:                                               ; preds = %74
  %76 = load i64, i64* %9, align 8
  %77 = add nsw i64 %76, 1
  store i64 %77, i64* %9, align 8
  br label %45, !llvm.loop !14

78:                                               ; preds = %45
  store i32 0, i32* %4, align 4
  br label %92

79:                                               ; preds = %20
  %80 = load %struct._typeobject*, %struct._typeobject** %5, align 8
  %81 = load %struct._typeobject*, %struct._typeobject** %6, align 8
  %82 = call i32 @__Pyx_InBases(%struct._typeobject* noundef %80, %struct._typeobject* noundef %81)
  %83 = icmp ne i32 %82, 0
  br i1 %83, label %89, label %84

84:                                               ; preds = %79
  %85 = load %struct._typeobject*, %struct._typeobject** %5, align 8
  %86 = load %struct._typeobject*, %struct._typeobject** %7, align 8
  %87 = call i32 @__Pyx_InBases(%struct._typeobject* noundef %85, %struct._typeobject* noundef %86)
  %88 = icmp ne i32 %87, 0
  br label %89

89:                                               ; preds = %84, %79
  %90 = phi i1 [ true, %79 ], [ %88, %84 ]
  %91 = zext i1 %90 to i32
  store i32 %91, i32* %4, align 4
  br label %92

92:                                               ; preds = %89, %78, %73, %19
  %93 = load i32, i32* %4, align 4
  ret i32 %93
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @__Pyx_IsSubtype(%struct._typeobject* noundef %0, %struct._typeobject* noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca %struct._typeobject*, align 8
  %5 = alloca %struct._typeobject*, align 8
  %6 = alloca %struct._object*, align 8
  %7 = alloca i64, align 8
  %8 = alloca i64, align 8
  store %struct._typeobject* %0, %struct._typeobject** %4, align 8
  store %struct._typeobject* %1, %struct._typeobject** %5, align 8
  %9 = load %struct._typeobject*, %struct._typeobject** %4, align 8
  %10 = load %struct._typeobject*, %struct._typeobject** %5, align 8
  %11 = icmp eq %struct._typeobject* %9, %10
  br i1 %11, label %12, label %13

12:                                               ; preds = %2
  store i32 1, i32* %3, align 4
  br label %70

13:                                               ; preds = %2
  %14 = load %struct._typeobject*, %struct._typeobject** %4, align 8
  %15 = getelementptr inbounds %struct._typeobject, %struct._typeobject* %14, i32 0, i32 41
  %16 = load %struct._object*, %struct._object** %15, align 8
  store %struct._object* %16, %struct._object** %6, align 8
  %17 = load %struct._object*, %struct._object** %6, align 8
  %18 = icmp ne %struct._object* %17, null
  %19 = xor i1 %18, true
  %20 = xor i1 %19, true
  %21 = zext i1 %20 to i32
  %22 = sext i32 %21 to i64
  %23 = icmp ne i64 %22, 0
  br i1 %23, label %24, label %66

24:                                               ; preds = %13
  %25 = load %struct._object*, %struct._object** %6, align 8
  %26 = getelementptr inbounds %struct._object, %struct._object* %25, i32 0, i32 1
  %27 = load %struct._typeobject*, %struct._typeobject** %26, align 8
  %28 = call i32 @PyType_HasFeature(%struct._typeobject* noundef %27, i64 noundef 67108864)
  %29 = icmp ne i32 %28, 0
  br i1 %29, label %30, label %31

30:                                               ; preds = %24
  br label %32

31:                                               ; preds = %24
  call void @__assert_fail(i8* noundef getelementptr inbounds ([19 x i8], [19 x i8]* @.str.32, i64 0, i64 0), i8* noundef getelementptr inbounds ([14 x i8], [14 x i8]* @.str.31, i64 0, i64 0), i32 noundef 4092, i8* noundef getelementptr inbounds ([52 x i8], [52 x i8]* @__PRETTY_FUNCTION__.__Pyx_IsSubtype, i64 0, i64 0)) #7
  unreachable

32:                                               ; preds = %30
  %33 = load %struct._object*, %struct._object** %6, align 8
  %34 = bitcast %struct._object* %33 to %struct.PyTupleObject*
  %35 = bitcast %struct.PyTupleObject* %34 to %struct.PyVarObject*
  %36 = getelementptr inbounds %struct.PyVarObject, %struct.PyVarObject* %35, i32 0, i32 1
  %37 = load i64, i64* %36, align 8
  store i64 %37, i64* %8, align 8
  store i64 0, i64* %7, align 8
  br label %38

38:                                               ; preds = %62, %32
  %39 = load i64, i64* %7, align 8
  %40 = load i64, i64* %8, align 8
  %41 = icmp slt i64 %39, %40
  br i1 %41, label %42, label %65

42:                                               ; preds = %38
  %43 = load %struct._object*, %struct._object** %6, align 8
  %44 = getelementptr inbounds %struct._object, %struct._object* %43, i32 0, i32 1
  %45 = load %struct._typeobject*, %struct._typeobject** %44, align 8
  %46 = call i32 @PyType_HasFeature(%struct._typeobject* noundef %45, i64 noundef 67108864)
  %47 = icmp ne i32 %46, 0
  br i1 %47, label %48, label %49

48:                                               ; preds = %42
  br label %50

49:                                               ; preds = %42
  call void @__assert_fail(i8* noundef getelementptr inbounds ([19 x i8], [19 x i8]* @.str.32, i64 0, i64 0), i8* noundef getelementptr inbounds ([14 x i8], [14 x i8]* @.str.31, i64 0, i64 0), i32 noundef 4094, i8* noundef getelementptr inbounds ([52 x i8], [52 x i8]* @__PRETTY_FUNCTION__.__Pyx_IsSubtype, i64 0, i64 0)) #7
  unreachable

50:                                               ; preds = %48
  %51 = load %struct._object*, %struct._object** %6, align 8
  %52 = bitcast %struct._object* %51 to %struct.PyTupleObject*
  %53 = getelementptr inbounds %struct.PyTupleObject, %struct.PyTupleObject* %52, i32 0, i32 1
  %54 = load i64, i64* %7, align 8
  %55 = getelementptr inbounds [1 x %struct._object*], [1 x %struct._object*]* %53, i64 0, i64 %54
  %56 = load %struct._object*, %struct._object** %55, align 8
  %57 = load %struct._typeobject*, %struct._typeobject** %5, align 8
  %58 = bitcast %struct._typeobject* %57 to %struct._object*
  %59 = icmp eq %struct._object* %56, %58
  br i1 %59, label %60, label %61

60:                                               ; preds = %50
  store i32 1, i32* %3, align 4
  br label %70

61:                                               ; preds = %50
  br label %62

62:                                               ; preds = %61
  %63 = load i64, i64* %7, align 8
  %64 = add nsw i64 %63, 1
  store i64 %64, i64* %7, align 8
  br label %38, !llvm.loop !15

65:                                               ; preds = %38
  store i32 0, i32* %3, align 4
  br label %70

66:                                               ; preds = %13
  %67 = load %struct._typeobject*, %struct._typeobject** %4, align 8
  %68 = load %struct._typeobject*, %struct._typeobject** %5, align 8
  %69 = call i32 @__Pyx_InBases(%struct._typeobject* noundef %67, %struct._typeobject* noundef %68)
  store i32 %69, i32* %3, align 4
  br label %70

70:                                               ; preds = %66, %65, %60, %12
  %71 = load i32, i32* %3, align 4
  ret i32 %71
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @__Pyx_InBases(%struct._typeobject* noundef %0, %struct._typeobject* noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca %struct._typeobject*, align 8
  %5 = alloca %struct._typeobject*, align 8
  store %struct._typeobject* %0, %struct._typeobject** %4, align 8
  store %struct._typeobject* %1, %struct._typeobject** %5, align 8
  br label %6

6:                                                ; preds = %17, %2
  %7 = load %struct._typeobject*, %struct._typeobject** %4, align 8
  %8 = icmp ne %struct._typeobject* %7, null
  br i1 %8, label %9, label %18

9:                                                ; preds = %6
  %10 = load %struct._typeobject*, %struct._typeobject** %4, align 8
  %11 = getelementptr inbounds %struct._typeobject, %struct._typeobject* %10, i32 0, i32 30
  %12 = load %struct._typeobject*, %struct._typeobject** %11, align 8
  store %struct._typeobject* %12, %struct._typeobject** %4, align 8
  %13 = load %struct._typeobject*, %struct._typeobject** %4, align 8
  %14 = load %struct._typeobject*, %struct._typeobject** %5, align 8
  %15 = icmp eq %struct._typeobject* %13, %14
  br i1 %15, label %16, label %17

16:                                               ; preds = %9
  store i32 1, i32* %3, align 4
  br label %22

17:                                               ; preds = %9
  br label %6, !llvm.loop !16

18:                                               ; preds = %6
  %19 = load %struct._typeobject*, %struct._typeobject** %5, align 8
  %20 = icmp eq %struct._typeobject* %19, @PyBaseObject_Type
  %21 = zext i1 %20 to i32
  store i32 %21, i32* %3, align 4
  br label %22

22:                                               ; preds = %18, %16
  %23 = load i32, i32* %3, align 4
  ret i32 %23
}

declare %struct._object* @_PyDict_GetItem_KnownHash(%struct._object* noundef, %struct._object* noundef, i64 noundef) #1

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @_Py_IS_TYPE(%struct._object* noundef %0, %struct._typeobject* noundef %1) #0 {
  %3 = alloca %struct._object*, align 8
  %4 = alloca %struct._typeobject*, align 8
  store %struct._object* %0, %struct._object** %3, align 8
  store %struct._typeobject* %1, %struct._typeobject** %4, align 8
  %5 = load %struct._object*, %struct._object** %3, align 8
  %6 = getelementptr inbounds %struct._object, %struct._object* %5, i32 0, i32 1
  %7 = load %struct._typeobject*, %struct._typeobject** %6, align 8
  %8 = load %struct._typeobject*, %struct._typeobject** %4, align 8
  %9 = icmp eq %struct._typeobject* %7, %8
  %10 = zext i1 %9 to i32
  ret i32 %10
}

; Function Attrs: nounwind readnone willreturn
declare i64 @labs(i64 noundef) #4

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @__Pyx_PyObject_IsTrueAndDecref(%struct._object* noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca %struct._object*, align 8
  %4 = alloca i32, align 4
  store %struct._object* %0, %struct._object** %3, align 8
  %5 = load %struct._object*, %struct._object** %3, align 8
  %6 = icmp ne %struct._object* %5, null
  %7 = xor i1 %6, true
  %8 = xor i1 %7, true
  %9 = xor i1 %8, true
  %10 = zext i1 %9 to i32
  %11 = sext i32 %10 to i64
  %12 = icmp ne i64 %11, 0
  br i1 %12, label %13, label %14

13:                                               ; preds = %1
  store i32 -1, i32* %2, align 4
  br label %19

14:                                               ; preds = %1
  %15 = load %struct._object*, %struct._object** %3, align 8
  %16 = call i32 @__Pyx_PyObject_IsTrue(%struct._object* noundef %15)
  store i32 %16, i32* %4, align 4
  %17 = load %struct._object*, %struct._object** %3, align 8
  call void @_Py_DECREF(%struct._object* noundef %17)
  %18 = load i32, i32* %4, align 4
  store i32 %18, i32* %2, align 4
  br label %19

19:                                               ; preds = %14, %13
  %20 = load i32, i32* %2, align 4
  ret i32 %20
}

declare %struct._object* @PyObject_RichCompare(%struct._object* noundef, %struct._object* noundef, i32 noundef) #1

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @__Pyx_PyObject_IsTrue(%struct._object* noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca %struct._object*, align 8
  %4 = alloca i32, align 4
  store %struct._object* %0, %struct._object** %3, align 8
  %5 = load %struct._object*, %struct._object** %3, align 8
  %6 = icmp eq %struct._object* %5, getelementptr inbounds (%struct._longobject, %struct._longobject* @_Py_TrueStruct, i32 0, i32 0, i32 0)
  %7 = zext i1 %6 to i32
  store i32 %7, i32* %4, align 4
  %8 = load i32, i32* %4, align 4
  %9 = load %struct._object*, %struct._object** %3, align 8
  %10 = icmp eq %struct._object* %9, getelementptr inbounds (%struct._longobject, %struct._longobject* @_Py_FalseStruct, i32 0, i32 0, i32 0)
  %11 = zext i1 %10 to i32
  %12 = or i32 %8, %11
  %13 = load %struct._object*, %struct._object** %3, align 8
  %14 = icmp eq %struct._object* %13, @_Py_NoneStruct
  %15 = zext i1 %14 to i32
  %16 = or i32 %12, %15
  %17 = icmp ne i32 %16, 0
  br i1 %17, label %18, label %20

18:                                               ; preds = %1
  %19 = load i32, i32* %4, align 4
  store i32 %19, i32* %2, align 4
  br label %23

20:                                               ; preds = %1
  %21 = load %struct._object*, %struct._object** %3, align 8
  %22 = call i32 @PyObject_IsTrue(%struct._object* noundef %21)
  store i32 %22, i32* %2, align 4
  br label %23

23:                                               ; preds = %20, %18
  %24 = load i32, i32* %2, align 4
  ret i32 %24
}

declare i32 @PyObject_IsTrue(%struct._object* noundef) #1

declare %struct._object* @PyLong_FromLongLong(i64 noundef) #1

declare %struct._object* @PyFloat_FromDouble(double noundef) #1

declare %struct._object* @PyNumber_InPlaceSubtract(%struct._object* noundef, %struct._object* noundef) #1

declare %struct._object* @PyNumber_Subtract(%struct._object* noundef, %struct._object* noundef) #1

declare %struct._object* @PyNumber_InPlaceAdd(%struct._object* noundef, %struct._object* noundef) #1

declare %struct._object* @PyNumber_Add(%struct._object* noundef, %struct._object* noundef) #1

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @__Pyx_CLineForTraceback(%struct._ts* noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca %struct._ts*, align 8
  %5 = alloca i32, align 4
  %6 = alloca %struct._object*, align 8
  %7 = alloca %struct._object*, align 8
  %8 = alloca %struct._object*, align 8
  %9 = alloca %struct._object*, align 8
  %10 = alloca %struct._object**, align 8
  %11 = alloca %struct._object*, align 8
  store %struct._ts* %0, %struct._ts** %4, align 8
  store i32 %1, i32* %5, align 4
  %12 = load %struct._ts*, %struct._ts** %4, align 8
  %13 = load %struct.__pyx_mstate*, %struct.__pyx_mstate** @__pyx_mstate_global, align 8
  %14 = getelementptr inbounds %struct.__pyx_mstate, %struct.__pyx_mstate* %13, i32 0, i32 2
  %15 = load %struct._object*, %struct._object** %14, align 8
  %16 = icmp ne %struct._object* %15, null
  %17 = xor i1 %16, true
  %18 = xor i1 %17, true
  %19 = xor i1 %18, true
  %20 = zext i1 %19 to i32
  %21 = sext i32 %20 to i64
  %22 = icmp ne i64 %21, 0
  br i1 %22, label %23, label %25

23:                                               ; preds = %2
  %24 = load i32, i32* %5, align 4
  store i32 %24, i32* %3, align 4
  br label %114

25:                                               ; preds = %2
  %26 = load %struct._ts*, %struct._ts** %4, align 8
  call void @__Pyx_ErrFetchInState(%struct._ts* noundef %26, %struct._object** noundef %7, %struct._object** noundef %8, %struct._object** noundef %9)
  %27 = load %struct.__pyx_mstate*, %struct.__pyx_mstate** @__pyx_mstate_global, align 8
  %28 = getelementptr inbounds %struct.__pyx_mstate, %struct.__pyx_mstate* %27, i32 0, i32 2
  %29 = load %struct._object*, %struct._object** %28, align 8
  %30 = call %struct._object** @_PyObject_GetDictPtr(%struct._object* noundef %29)
  store %struct._object** %30, %struct._object*** %10, align 8
  %31 = load %struct._object**, %struct._object*** %10, align 8
  %32 = icmp ne %struct._object** %31, null
  %33 = xor i1 %32, true
  %34 = xor i1 %33, true
  %35 = zext i1 %34 to i32
  %36 = sext i32 %35 to i64
  %37 = icmp ne i64 %36, 0
  br i1 %37, label %38, label %66

38:                                               ; preds = %25
  %39 = load %struct._object**, %struct._object*** %10, align 8
  %40 = load %struct._object*, %struct._object** %39, align 8
  %41 = bitcast %struct._object* %40 to %struct.PyDictObject*
  %42 = getelementptr inbounds %struct.PyDictObject, %struct.PyDictObject* %41, i32 0, i32 2
  %43 = load i64, i64* %42, align 8
  %44 = load i64, i64* @__Pyx_CLineForTraceback.__pyx_dict_version, align 8
  %45 = icmp eq i64 %43, %44
  %46 = xor i1 %45, true
  %47 = xor i1 %46, true
  %48 = zext i1 %47 to i32
  %49 = sext i32 %48 to i64
  %50 = icmp ne i64 %49, 0
  br i1 %50, label %51, label %53

51:                                               ; preds = %38
  %52 = load %struct._object*, %struct._object** @__Pyx_CLineForTraceback.__pyx_dict_cached_value, align 8
  store %struct._object* %52, %struct._object** %6, align 8
  br label %65

53:                                               ; preds = %38
  %54 = load %struct._object**, %struct._object*** %10, align 8
  %55 = load %struct._object*, %struct._object** %54, align 8
  %56 = load %struct.__pyx_mstate*, %struct.__pyx_mstate** @__pyx_mstate_global, align 8
  %57 = getelementptr inbounds %struct.__pyx_mstate, %struct.__pyx_mstate* %56, i32 0, i32 7
  %58 = load %struct._object*, %struct._object** %57, align 8
  %59 = call %struct._object* @__Pyx_PyDict_GetItemStr(%struct._object* noundef %55, %struct._object* noundef %58)
  store %struct._object* %59, %struct._object** @__Pyx_CLineForTraceback.__pyx_dict_cached_value, align 8
  store %struct._object* %59, %struct._object** %6, align 8
  %60 = load %struct._object**, %struct._object*** %10, align 8
  %61 = load %struct._object*, %struct._object** %60, align 8
  %62 = bitcast %struct._object* %61 to %struct.PyDictObject*
  %63 = getelementptr inbounds %struct.PyDictObject, %struct.PyDictObject* %62, i32 0, i32 2
  %64 = load i64, i64* %63, align 8
  store i64 %64, i64* @__Pyx_CLineForTraceback.__pyx_dict_version, align 8
  br label %65

65:                                               ; preds = %53, %51
  br label %85

66:                                               ; preds = %25
  %67 = load %struct.__pyx_mstate*, %struct.__pyx_mstate** @__pyx_mstate_global, align 8
  %68 = getelementptr inbounds %struct.__pyx_mstate, %struct.__pyx_mstate* %67, i32 0, i32 2
  %69 = load %struct._object*, %struct._object** %68, align 8
  %70 = load %struct.__pyx_mstate*, %struct.__pyx_mstate** @__pyx_mstate_global, align 8
  %71 = getelementptr inbounds %struct.__pyx_mstate, %struct.__pyx_mstate* %70, i32 0, i32 7
  %72 = load %struct._object*, %struct._object** %71, align 8
  %73 = call %struct._object* @__Pyx_PyObject_GetAttrStrNoError(%struct._object* noundef %69, %struct._object* noundef %72)
  store %struct._object* %73, %struct._object** %11, align 8
  %74 = load %struct._object*, %struct._object** %11, align 8
  %75 = icmp ne %struct._object* %74, null
  br i1 %75, label %76, label %83

76:                                               ; preds = %66
  %77 = load %struct._object*, %struct._object** %11, align 8
  %78 = call i32 @PyObject_Not(%struct._object* noundef %77)
  %79 = icmp ne i32 %78, 0
  %80 = zext i1 %79 to i64
  %81 = select i1 %79, %struct._object* getelementptr inbounds (%struct._longobject, %struct._longobject* @_Py_FalseStruct, i32 0, i32 0, i32 0), %struct._object* getelementptr inbounds (%struct._longobject, %struct._longobject* @_Py_TrueStruct, i32 0, i32 0, i32 0)
  store %struct._object* %81, %struct._object** %6, align 8
  %82 = load %struct._object*, %struct._object** %11, align 8
  call void @_Py_DECREF(%struct._object* noundef %82)
  br label %84

83:                                               ; preds = %66
  call void @PyErr_Clear()
  store %struct._object* null, %struct._object** %6, align 8
  br label %84

84:                                               ; preds = %83, %76
  br label %85

85:                                               ; preds = %84, %65
  %86 = load %struct._object*, %struct._object** %6, align 8
  %87 = icmp ne %struct._object* %86, null
  br i1 %87, label %96, label %88

88:                                               ; preds = %85
  store i32 0, i32* %5, align 4
  %89 = load %struct.__pyx_mstate*, %struct.__pyx_mstate** @__pyx_mstate_global, align 8
  %90 = getelementptr inbounds %struct.__pyx_mstate, %struct.__pyx_mstate* %89, i32 0, i32 2
  %91 = load %struct._object*, %struct._object** %90, align 8
  %92 = load %struct.__pyx_mstate*, %struct.__pyx_mstate** @__pyx_mstate_global, align 8
  %93 = getelementptr inbounds %struct.__pyx_mstate, %struct.__pyx_mstate* %92, i32 0, i32 7
  %94 = load %struct._object*, %struct._object** %93, align 8
  %95 = call i32 @PyObject_SetAttr(%struct._object* noundef %91, %struct._object* noundef %94, %struct._object* noundef getelementptr inbounds (%struct._longobject, %struct._longobject* @_Py_FalseStruct, i32 0, i32 0, i32 0))
  br label %108

96:                                               ; preds = %85
  %97 = load %struct._object*, %struct._object** %6, align 8
  %98 = icmp eq %struct._object* %97, getelementptr inbounds (%struct._longobject, %struct._longobject* @_Py_FalseStruct, i32 0, i32 0, i32 0)
  br i1 %98, label %106, label %99

99:                                               ; preds = %96
  %100 = load %struct._object*, %struct._object** %6, align 8
  %101 = icmp ne %struct._object* %100, getelementptr inbounds (%struct._longobject, %struct._longobject* @_Py_TrueStruct, i32 0, i32 0, i32 0)
  br i1 %101, label %102, label %107

102:                                              ; preds = %99
  %103 = load %struct._object*, %struct._object** %6, align 8
  %104 = call i32 @PyObject_Not(%struct._object* noundef %103)
  %105 = icmp ne i32 %104, 0
  br i1 %105, label %106, label %107

106:                                              ; preds = %102, %96
  store i32 0, i32* %5, align 4
  br label %107

107:                                              ; preds = %106, %102, %99
  br label %108

108:                                              ; preds = %107, %88
  %109 = load %struct._ts*, %struct._ts** %4, align 8
  %110 = load %struct._object*, %struct._object** %7, align 8
  %111 = load %struct._object*, %struct._object** %8, align 8
  %112 = load %struct._object*, %struct._object** %9, align 8
  call void @__Pyx_ErrRestoreInState(%struct._ts* noundef %109, %struct._object* noundef %110, %struct._object* noundef %111, %struct._object* noundef %112)
  %113 = load i32, i32* %5, align 4
  store i32 %113, i32* %3, align 4
  br label %114

114:                                              ; preds = %108, %23
  %115 = load i32, i32* %3, align 4
  ret i32 %115
}

; Function Attrs: noinline nounwind optnone uwtable
define internal %struct.PyCodeObject* @__pyx_find_code_object(i32 noundef %0) #0 {
  %2 = alloca %struct.PyCodeObject*, align 8
  %3 = alloca i32, align 4
  %4 = alloca %struct.PyCodeObject*, align 8
  %5 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  %6 = load i32, i32* %3, align 4
  %7 = icmp ne i32 %6, 0
  %8 = xor i1 %7, true
  %9 = xor i1 %8, true
  %10 = xor i1 %9, true
  %11 = zext i1 %10 to i32
  %12 = sext i32 %11 to i64
  %13 = icmp ne i64 %12, 0
  br i1 %13, label %23, label %14

14:                                               ; preds = %1
  %15 = load %struct.__Pyx_CodeObjectCacheEntry*, %struct.__Pyx_CodeObjectCacheEntry** getelementptr inbounds (%struct.__Pyx_CodeObjectCache, %struct.__Pyx_CodeObjectCache* @__pyx_code_cache, i32 0, i32 2), align 8
  %16 = icmp ne %struct.__Pyx_CodeObjectCacheEntry* %15, null
  %17 = xor i1 %16, true
  %18 = xor i1 %17, true
  %19 = xor i1 %18, true
  %20 = zext i1 %19 to i32
  %21 = sext i32 %20 to i64
  %22 = icmp ne i64 %21, 0
  br i1 %22, label %23, label %24

23:                                               ; preds = %14, %1
  store %struct.PyCodeObject* null, %struct.PyCodeObject** %2, align 8
  br label %62

24:                                               ; preds = %14
  %25 = load %struct.__Pyx_CodeObjectCacheEntry*, %struct.__Pyx_CodeObjectCacheEntry** getelementptr inbounds (%struct.__Pyx_CodeObjectCache, %struct.__Pyx_CodeObjectCache* @__pyx_code_cache, i32 0, i32 2), align 8
  %26 = load i32, i32* getelementptr inbounds (%struct.__Pyx_CodeObjectCache, %struct.__Pyx_CodeObjectCache* @__pyx_code_cache, i32 0, i32 0), align 8
  %27 = load i32, i32* %3, align 4
  %28 = call i32 @__pyx_bisect_code_objects(%struct.__Pyx_CodeObjectCacheEntry* noundef %25, i32 noundef %26, i32 noundef %27)
  store i32 %28, i32* %5, align 4
  %29 = load i32, i32* %5, align 4
  %30 = load i32, i32* getelementptr inbounds (%struct.__Pyx_CodeObjectCache, %struct.__Pyx_CodeObjectCache* @__pyx_code_cache, i32 0, i32 0), align 8
  %31 = icmp sge i32 %29, %30
  %32 = xor i1 %31, true
  %33 = xor i1 %32, true
  %34 = zext i1 %33 to i32
  %35 = sext i32 %34 to i64
  %36 = icmp ne i64 %35, 0
  br i1 %36, label %51, label %37

37:                                               ; preds = %24
  %38 = load %struct.__Pyx_CodeObjectCacheEntry*, %struct.__Pyx_CodeObjectCacheEntry** getelementptr inbounds (%struct.__Pyx_CodeObjectCache, %struct.__Pyx_CodeObjectCache* @__pyx_code_cache, i32 0, i32 2), align 8
  %39 = load i32, i32* %5, align 4
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds %struct.__Pyx_CodeObjectCacheEntry, %struct.__Pyx_CodeObjectCacheEntry* %38, i64 %40
  %42 = getelementptr inbounds %struct.__Pyx_CodeObjectCacheEntry, %struct.__Pyx_CodeObjectCacheEntry* %41, i32 0, i32 1
  %43 = load i32, i32* %42, align 8
  %44 = load i32, i32* %3, align 4
  %45 = icmp ne i32 %43, %44
  %46 = xor i1 %45, true
  %47 = xor i1 %46, true
  %48 = zext i1 %47 to i32
  %49 = sext i32 %48 to i64
  %50 = icmp ne i64 %49, 0
  br i1 %50, label %51, label %52

51:                                               ; preds = %37, %24
  store %struct.PyCodeObject* null, %struct.PyCodeObject** %2, align 8
  br label %62

52:                                               ; preds = %37
  %53 = load %struct.__Pyx_CodeObjectCacheEntry*, %struct.__Pyx_CodeObjectCacheEntry** getelementptr inbounds (%struct.__Pyx_CodeObjectCache, %struct.__Pyx_CodeObjectCache* @__pyx_code_cache, i32 0, i32 2), align 8
  %54 = load i32, i32* %5, align 4
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds %struct.__Pyx_CodeObjectCacheEntry, %struct.__Pyx_CodeObjectCacheEntry* %53, i64 %55
  %57 = getelementptr inbounds %struct.__Pyx_CodeObjectCacheEntry, %struct.__Pyx_CodeObjectCacheEntry* %56, i32 0, i32 0
  %58 = load %struct.PyCodeObject*, %struct.PyCodeObject** %57, align 8
  store %struct.PyCodeObject* %58, %struct.PyCodeObject** %4, align 8
  %59 = load %struct.PyCodeObject*, %struct.PyCodeObject** %4, align 8
  %60 = bitcast %struct.PyCodeObject* %59 to %struct._object*
  call void @_Py_INCREF(%struct._object* noundef %60)
  %61 = load %struct.PyCodeObject*, %struct.PyCodeObject** %4, align 8
  store %struct.PyCodeObject* %61, %struct.PyCodeObject** %2, align 8
  br label %62

62:                                               ; preds = %52, %51, %23
  %63 = load %struct.PyCodeObject*, %struct.PyCodeObject** %2, align 8
  ret %struct.PyCodeObject* %63
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @__Pyx_ErrFetchInState(%struct._ts* noundef %0, %struct._object** noundef %1, %struct._object** noundef %2, %struct._object** noundef %3) #0 {
  %5 = alloca %struct._ts*, align 8
  %6 = alloca %struct._object**, align 8
  %7 = alloca %struct._object**, align 8
  %8 = alloca %struct._object**, align 8
  store %struct._ts* %0, %struct._ts** %5, align 8
  store %struct._object** %1, %struct._object*** %6, align 8
  store %struct._object** %2, %struct._object*** %7, align 8
  store %struct._object** %3, %struct._object*** %8, align 8
  %9 = load %struct._ts*, %struct._ts** %5, align 8
  %10 = getelementptr inbounds %struct._ts, %struct._ts* %9, i32 0, i32 13
  %11 = load %struct._object*, %struct._object** %10, align 8
  %12 = load %struct._object**, %struct._object*** %6, align 8
  store %struct._object* %11, %struct._object** %12, align 8
  %13 = load %struct._ts*, %struct._ts** %5, align 8
  %14 = getelementptr inbounds %struct._ts, %struct._ts* %13, i32 0, i32 14
  %15 = load %struct._object*, %struct._object** %14, align 8
  %16 = load %struct._object**, %struct._object*** %7, align 8
  store %struct._object* %15, %struct._object** %16, align 8
  %17 = load %struct._ts*, %struct._ts** %5, align 8
  %18 = getelementptr inbounds %struct._ts, %struct._ts* %17, i32 0, i32 15
  %19 = load %struct._object*, %struct._object** %18, align 8
  %20 = load %struct._object**, %struct._object*** %8, align 8
  store %struct._object* %19, %struct._object** %20, align 8
  %21 = load %struct._ts*, %struct._ts** %5, align 8
  %22 = getelementptr inbounds %struct._ts, %struct._ts* %21, i32 0, i32 13
  store %struct._object* null, %struct._object** %22, align 8
  %23 = load %struct._ts*, %struct._ts** %5, align 8
  %24 = getelementptr inbounds %struct._ts, %struct._ts* %23, i32 0, i32 14
  store %struct._object* null, %struct._object** %24, align 8
  %25 = load %struct._ts*, %struct._ts** %5, align 8
  %26 = getelementptr inbounds %struct._ts, %struct._ts* %25, i32 0, i32 15
  store %struct._object* null, %struct._object** %26, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal %struct.PyCodeObject* @__Pyx_CreateCodeObjectForTraceback(i8* noundef %0, i32 noundef %1, i32 noundef %2, i8* noundef %3) #0 {
  %5 = alloca %struct.PyCodeObject*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i8*, align 8
  %10 = alloca %struct.PyCodeObject*, align 8
  %11 = alloca %struct._object*, align 8
  store i8* %0, i8** %6, align 8
  store i32 %1, i32* %7, align 4
  store i32 %2, i32* %8, align 4
  store i8* %3, i8** %9, align 8
  store %struct.PyCodeObject* null, %struct.PyCodeObject** %10, align 8
  store %struct._object* null, %struct._object** %11, align 8
  %12 = load i32, i32* %7, align 4
  %13 = icmp ne i32 %12, 0
  br i1 %13, label %14, label %29

14:                                               ; preds = %4
  %15 = load i8*, i8** %6, align 8
  %16 = load i8*, i8** @__pyx_cfilenm, align 8
  %17 = load i32, i32* %7, align 4
  %18 = call %struct._object* (i8*, ...) @PyUnicode_FromFormat(i8* noundef getelementptr inbounds ([11 x i8], [11 x i8]* @.str.34, i64 0, i64 0), i8* noundef %15, i8* noundef %16, i32 noundef %17)
  store %struct._object* %18, %struct._object** %11, align 8
  %19 = load %struct._object*, %struct._object** %11, align 8
  %20 = icmp ne %struct._object* %19, null
  br i1 %20, label %22, label %21

21:                                               ; preds = %14
  br label %37

22:                                               ; preds = %14
  %23 = load %struct._object*, %struct._object** %11, align 8
  %24 = call i8* @PyUnicode_AsUTF8(%struct._object* noundef %23)
  store i8* %24, i8** %6, align 8
  %25 = load i8*, i8** %6, align 8
  %26 = icmp ne i8* %25, null
  br i1 %26, label %28, label %27

27:                                               ; preds = %22
  br label %37

28:                                               ; preds = %22
  br label %30

29:                                               ; preds = %4
  br label %30

30:                                               ; preds = %29, %28
  %31 = load i8*, i8** %9, align 8
  %32 = load i8*, i8** %6, align 8
  %33 = load i32, i32* %8, align 4
  %34 = call %struct.PyCodeObject* @PyCode_NewEmpty(i8* noundef %31, i8* noundef %32, i32 noundef %33)
  store %struct.PyCodeObject* %34, %struct.PyCodeObject** %10, align 8
  %35 = load %struct._object*, %struct._object** %11, align 8
  call void @_Py_XDECREF(%struct._object* noundef %35)
  %36 = load %struct.PyCodeObject*, %struct.PyCodeObject** %10, align 8
  store %struct.PyCodeObject* %36, %struct.PyCodeObject** %5, align 8
  br label %39

37:                                               ; preds = %27, %21
  %38 = load %struct._object*, %struct._object** %11, align 8
  call void @_Py_XDECREF(%struct._object* noundef %38)
  store %struct.PyCodeObject* null, %struct.PyCodeObject** %5, align 8
  br label %39

39:                                               ; preds = %37, %30
  %40 = load %struct.PyCodeObject*, %struct.PyCodeObject** %5, align 8
  ret %struct.PyCodeObject* %40
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @__pyx_insert_code_object(i32 noundef %0, %struct.PyCodeObject* noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca %struct.PyCodeObject*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca %struct.__Pyx_CodeObjectCacheEntry*, align 8
  %8 = alloca %struct.PyCodeObject*, align 8
  %9 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  store %struct.PyCodeObject* %1, %struct.PyCodeObject** %4, align 8
  %10 = load %struct.__Pyx_CodeObjectCacheEntry*, %struct.__Pyx_CodeObjectCacheEntry** getelementptr inbounds (%struct.__Pyx_CodeObjectCache, %struct.__Pyx_CodeObjectCache* @__pyx_code_cache, i32 0, i32 2), align 8
  store %struct.__Pyx_CodeObjectCacheEntry* %10, %struct.__Pyx_CodeObjectCacheEntry** %7, align 8
  %11 = load i32, i32* %3, align 4
  %12 = icmp ne i32 %11, 0
  %13 = xor i1 %12, true
  %14 = xor i1 %13, true
  %15 = xor i1 %14, true
  %16 = zext i1 %15 to i32
  %17 = sext i32 %16 to i64
  %18 = icmp ne i64 %17, 0
  br i1 %18, label %19, label %20

19:                                               ; preds = %2
  br label %153

20:                                               ; preds = %2
  %21 = load %struct.__Pyx_CodeObjectCacheEntry*, %struct.__Pyx_CodeObjectCacheEntry** %7, align 8
  %22 = icmp ne %struct.__Pyx_CodeObjectCacheEntry* %21, null
  %23 = xor i1 %22, true
  %24 = xor i1 %23, true
  %25 = xor i1 %24, true
  %26 = zext i1 %25 to i32
  %27 = sext i32 %26 to i64
  %28 = icmp ne i64 %27, 0
  br i1 %28, label %29, label %52

29:                                               ; preds = %20
  %30 = call i8* @PyMem_Malloc(i64 noundef 1024)
  %31 = bitcast i8* %30 to %struct.__Pyx_CodeObjectCacheEntry*
  store %struct.__Pyx_CodeObjectCacheEntry* %31, %struct.__Pyx_CodeObjectCacheEntry** %7, align 8
  %32 = load %struct.__Pyx_CodeObjectCacheEntry*, %struct.__Pyx_CodeObjectCacheEntry** %7, align 8
  %33 = icmp ne %struct.__Pyx_CodeObjectCacheEntry* %32, null
  %34 = xor i1 %33, true
  %35 = xor i1 %34, true
  %36 = zext i1 %35 to i32
  %37 = sext i32 %36 to i64
  %38 = icmp ne i64 %37, 0
  br i1 %38, label %39, label %51

39:                                               ; preds = %29
  %40 = load %struct.__Pyx_CodeObjectCacheEntry*, %struct.__Pyx_CodeObjectCacheEntry** %7, align 8
  store %struct.__Pyx_CodeObjectCacheEntry* %40, %struct.__Pyx_CodeObjectCacheEntry** getelementptr inbounds (%struct.__Pyx_CodeObjectCache, %struct.__Pyx_CodeObjectCache* @__pyx_code_cache, i32 0, i32 2), align 8
  store i32 64, i32* getelementptr inbounds (%struct.__Pyx_CodeObjectCache, %struct.__Pyx_CodeObjectCache* @__pyx_code_cache, i32 0, i32 1), align 4
  store i32 1, i32* getelementptr inbounds (%struct.__Pyx_CodeObjectCache, %struct.__Pyx_CodeObjectCache* @__pyx_code_cache, i32 0, i32 0), align 8
  %41 = load i32, i32* %3, align 4
  %42 = load %struct.__Pyx_CodeObjectCacheEntry*, %struct.__Pyx_CodeObjectCacheEntry** %7, align 8
  %43 = getelementptr inbounds %struct.__Pyx_CodeObjectCacheEntry, %struct.__Pyx_CodeObjectCacheEntry* %42, i64 0
  %44 = getelementptr inbounds %struct.__Pyx_CodeObjectCacheEntry, %struct.__Pyx_CodeObjectCacheEntry* %43, i32 0, i32 1
  store i32 %41, i32* %44, align 8
  %45 = load %struct.PyCodeObject*, %struct.PyCodeObject** %4, align 8
  %46 = load %struct.__Pyx_CodeObjectCacheEntry*, %struct.__Pyx_CodeObjectCacheEntry** %7, align 8
  %47 = getelementptr inbounds %struct.__Pyx_CodeObjectCacheEntry, %struct.__Pyx_CodeObjectCacheEntry* %46, i64 0
  %48 = getelementptr inbounds %struct.__Pyx_CodeObjectCacheEntry, %struct.__Pyx_CodeObjectCacheEntry* %47, i32 0, i32 0
  store %struct.PyCodeObject* %45, %struct.PyCodeObject** %48, align 8
  %49 = load %struct.PyCodeObject*, %struct.PyCodeObject** %4, align 8
  %50 = bitcast %struct.PyCodeObject* %49 to %struct._object*
  call void @_Py_INCREF(%struct._object* noundef %50)
  br label %51

51:                                               ; preds = %39, %29
  br label %153

52:                                               ; preds = %20
  %53 = load %struct.__Pyx_CodeObjectCacheEntry*, %struct.__Pyx_CodeObjectCacheEntry** getelementptr inbounds (%struct.__Pyx_CodeObjectCache, %struct.__Pyx_CodeObjectCache* @__pyx_code_cache, i32 0, i32 2), align 8
  %54 = load i32, i32* getelementptr inbounds (%struct.__Pyx_CodeObjectCache, %struct.__Pyx_CodeObjectCache* @__pyx_code_cache, i32 0, i32 0), align 8
  %55 = load i32, i32* %3, align 4
  %56 = call i32 @__pyx_bisect_code_objects(%struct.__Pyx_CodeObjectCacheEntry* noundef %53, i32 noundef %54, i32 noundef %55)
  store i32 %56, i32* %5, align 4
  %57 = load i32, i32* %5, align 4
  %58 = load i32, i32* getelementptr inbounds (%struct.__Pyx_CodeObjectCache, %struct.__Pyx_CodeObjectCache* @__pyx_code_cache, i32 0, i32 0), align 8
  %59 = icmp slt i32 %57, %58
  br i1 %59, label %60, label %89

60:                                               ; preds = %52
  %61 = load %struct.__Pyx_CodeObjectCacheEntry*, %struct.__Pyx_CodeObjectCacheEntry** getelementptr inbounds (%struct.__Pyx_CodeObjectCache, %struct.__Pyx_CodeObjectCache* @__pyx_code_cache, i32 0, i32 2), align 8
  %62 = load i32, i32* %5, align 4
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds %struct.__Pyx_CodeObjectCacheEntry, %struct.__Pyx_CodeObjectCacheEntry* %61, i64 %63
  %65 = getelementptr inbounds %struct.__Pyx_CodeObjectCacheEntry, %struct.__Pyx_CodeObjectCacheEntry* %64, i32 0, i32 1
  %66 = load i32, i32* %65, align 8
  %67 = load i32, i32* %3, align 4
  %68 = icmp eq i32 %66, %67
  %69 = xor i1 %68, true
  %70 = xor i1 %69, true
  %71 = zext i1 %70 to i32
  %72 = sext i32 %71 to i64
  %73 = icmp ne i64 %72, 0
  br i1 %73, label %74, label %89

74:                                               ; preds = %60
  %75 = load %struct.__Pyx_CodeObjectCacheEntry*, %struct.__Pyx_CodeObjectCacheEntry** %7, align 8
  %76 = load i32, i32* %5, align 4
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds %struct.__Pyx_CodeObjectCacheEntry, %struct.__Pyx_CodeObjectCacheEntry* %75, i64 %77
  %79 = getelementptr inbounds %struct.__Pyx_CodeObjectCacheEntry, %struct.__Pyx_CodeObjectCacheEntry* %78, i32 0, i32 0
  %80 = load %struct.PyCodeObject*, %struct.PyCodeObject** %79, align 8
  store %struct.PyCodeObject* %80, %struct.PyCodeObject** %8, align 8
  %81 = load %struct.PyCodeObject*, %struct.PyCodeObject** %4, align 8
  %82 = load %struct.__Pyx_CodeObjectCacheEntry*, %struct.__Pyx_CodeObjectCacheEntry** %7, align 8
  %83 = load i32, i32* %5, align 4
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds %struct.__Pyx_CodeObjectCacheEntry, %struct.__Pyx_CodeObjectCacheEntry* %82, i64 %84
  %86 = getelementptr inbounds %struct.__Pyx_CodeObjectCacheEntry, %struct.__Pyx_CodeObjectCacheEntry* %85, i32 0, i32 0
  store %struct.PyCodeObject* %81, %struct.PyCodeObject** %86, align 8
  %87 = load %struct.PyCodeObject*, %struct.PyCodeObject** %8, align 8
  %88 = bitcast %struct.PyCodeObject* %87 to %struct._object*
  call void @_Py_DECREF(%struct._object* noundef %88)
  br label %153

89:                                               ; preds = %60, %52
  %90 = load i32, i32* getelementptr inbounds (%struct.__Pyx_CodeObjectCache, %struct.__Pyx_CodeObjectCache* @__pyx_code_cache, i32 0, i32 0), align 8
  %91 = load i32, i32* getelementptr inbounds (%struct.__Pyx_CodeObjectCache, %struct.__Pyx_CodeObjectCache* @__pyx_code_cache, i32 0, i32 1), align 4
  %92 = icmp eq i32 %90, %91
  br i1 %92, label %93, label %115

93:                                               ; preds = %89
  %94 = load i32, i32* getelementptr inbounds (%struct.__Pyx_CodeObjectCache, %struct.__Pyx_CodeObjectCache* @__pyx_code_cache, i32 0, i32 1), align 4
  %95 = add nsw i32 %94, 64
  store i32 %95, i32* %9, align 4
  %96 = load %struct.__Pyx_CodeObjectCacheEntry*, %struct.__Pyx_CodeObjectCacheEntry** getelementptr inbounds (%struct.__Pyx_CodeObjectCache, %struct.__Pyx_CodeObjectCache* @__pyx_code_cache, i32 0, i32 2), align 8
  %97 = bitcast %struct.__Pyx_CodeObjectCacheEntry* %96 to i8*
  %98 = load i32, i32* %9, align 4
  %99 = sext i32 %98 to i64
  %100 = mul i64 %99, 16
  %101 = call i8* @PyMem_Realloc(i8* noundef %97, i64 noundef %100)
  %102 = bitcast i8* %101 to %struct.__Pyx_CodeObjectCacheEntry*
  store %struct.__Pyx_CodeObjectCacheEntry* %102, %struct.__Pyx_CodeObjectCacheEntry** %7, align 8
  %103 = load %struct.__Pyx_CodeObjectCacheEntry*, %struct.__Pyx_CodeObjectCacheEntry** %7, align 8
  %104 = icmp ne %struct.__Pyx_CodeObjectCacheEntry* %103, null
  %105 = xor i1 %104, true
  %106 = xor i1 %105, true
  %107 = xor i1 %106, true
  %108 = zext i1 %107 to i32
  %109 = sext i32 %108 to i64
  %110 = icmp ne i64 %109, 0
  br i1 %110, label %111, label %112

111:                                              ; preds = %93
  br label %153

112:                                              ; preds = %93
  %113 = load %struct.__Pyx_CodeObjectCacheEntry*, %struct.__Pyx_CodeObjectCacheEntry** %7, align 8
  store %struct.__Pyx_CodeObjectCacheEntry* %113, %struct.__Pyx_CodeObjectCacheEntry** getelementptr inbounds (%struct.__Pyx_CodeObjectCache, %struct.__Pyx_CodeObjectCache* @__pyx_code_cache, i32 0, i32 2), align 8
  %114 = load i32, i32* %9, align 4
  store i32 %114, i32* getelementptr inbounds (%struct.__Pyx_CodeObjectCache, %struct.__Pyx_CodeObjectCache* @__pyx_code_cache, i32 0, i32 1), align 4
  br label %115

115:                                              ; preds = %112, %89
  %116 = load i32, i32* getelementptr inbounds (%struct.__Pyx_CodeObjectCache, %struct.__Pyx_CodeObjectCache* @__pyx_code_cache, i32 0, i32 0), align 8
  store i32 %116, i32* %6, align 4
  br label %117

117:                                              ; preds = %133, %115
  %118 = load i32, i32* %6, align 4
  %119 = load i32, i32* %5, align 4
  %120 = icmp sgt i32 %118, %119
  br i1 %120, label %121, label %136

121:                                              ; preds = %117
  %122 = load %struct.__Pyx_CodeObjectCacheEntry*, %struct.__Pyx_CodeObjectCacheEntry** %7, align 8
  %123 = load i32, i32* %6, align 4
  %124 = sext i32 %123 to i64
  %125 = getelementptr inbounds %struct.__Pyx_CodeObjectCacheEntry, %struct.__Pyx_CodeObjectCacheEntry* %122, i64 %124
  %126 = load %struct.__Pyx_CodeObjectCacheEntry*, %struct.__Pyx_CodeObjectCacheEntry** %7, align 8
  %127 = load i32, i32* %6, align 4
  %128 = sub nsw i32 %127, 1
  %129 = sext i32 %128 to i64
  %130 = getelementptr inbounds %struct.__Pyx_CodeObjectCacheEntry, %struct.__Pyx_CodeObjectCacheEntry* %126, i64 %129
  %131 = bitcast %struct.__Pyx_CodeObjectCacheEntry* %125 to i8*
  %132 = bitcast %struct.__Pyx_CodeObjectCacheEntry* %130 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %131, i8* align 8 %132, i64 16, i1 false)
  br label %133

133:                                              ; preds = %121
  %134 = load i32, i32* %6, align 4
  %135 = add nsw i32 %134, -1
  store i32 %135, i32* %6, align 4
  br label %117, !llvm.loop !17

136:                                              ; preds = %117
  %137 = load i32, i32* %3, align 4
  %138 = load %struct.__Pyx_CodeObjectCacheEntry*, %struct.__Pyx_CodeObjectCacheEntry** %7, align 8
  %139 = load i32, i32* %5, align 4
  %140 = sext i32 %139 to i64
  %141 = getelementptr inbounds %struct.__Pyx_CodeObjectCacheEntry, %struct.__Pyx_CodeObjectCacheEntry* %138, i64 %140
  %142 = getelementptr inbounds %struct.__Pyx_CodeObjectCacheEntry, %struct.__Pyx_CodeObjectCacheEntry* %141, i32 0, i32 1
  store i32 %137, i32* %142, align 8
  %143 = load %struct.PyCodeObject*, %struct.PyCodeObject** %4, align 8
  %144 = load %struct.__Pyx_CodeObjectCacheEntry*, %struct.__Pyx_CodeObjectCacheEntry** %7, align 8
  %145 = load i32, i32* %5, align 4
  %146 = sext i32 %145 to i64
  %147 = getelementptr inbounds %struct.__Pyx_CodeObjectCacheEntry, %struct.__Pyx_CodeObjectCacheEntry* %144, i64 %146
  %148 = getelementptr inbounds %struct.__Pyx_CodeObjectCacheEntry, %struct.__Pyx_CodeObjectCacheEntry* %147, i32 0, i32 0
  store %struct.PyCodeObject* %143, %struct.PyCodeObject** %148, align 8
  %149 = load i32, i32* getelementptr inbounds (%struct.__Pyx_CodeObjectCache, %struct.__Pyx_CodeObjectCache* @__pyx_code_cache, i32 0, i32 0), align 8
  %150 = add nsw i32 %149, 1
  store i32 %150, i32* getelementptr inbounds (%struct.__Pyx_CodeObjectCache, %struct.__Pyx_CodeObjectCache* @__pyx_code_cache, i32 0, i32 0), align 8
  %151 = load %struct.PyCodeObject*, %struct.PyCodeObject** %4, align 8
  %152 = bitcast %struct.PyCodeObject* %151 to %struct._object*
  call void @_Py_INCREF(%struct._object* noundef %152)
  br label %153

153:                                              ; preds = %136, %111, %74, %51, %19
  ret void
}

declare %struct._frame* @PyFrame_New(%struct._ts* noundef, %struct.PyCodeObject* noundef, %struct._object* noundef, %struct._object* noundef) #1

declare i32 @PyTraceBack_Here(%struct._frame* noundef) #1

declare %struct._object** @_PyObject_GetDictPtr(%struct._object* noundef) #1

; Function Attrs: noinline nounwind optnone uwtable
define internal %struct._object* @__Pyx_PyDict_GetItemStr(%struct._object* noundef %0, %struct._object* noundef %1) #0 {
  %3 = alloca %struct._object*, align 8
  %4 = alloca %struct._object*, align 8
  %5 = alloca %struct._object*, align 8
  store %struct._object* %0, %struct._object** %3, align 8
  store %struct._object* %1, %struct._object** %4, align 8
  %6 = load %struct._object*, %struct._object** %3, align 8
  %7 = load %struct._object*, %struct._object** %4, align 8
  %8 = load %struct._object*, %struct._object** %4, align 8
  %9 = bitcast %struct._object* %8 to %struct.PyASCIIObject*
  %10 = getelementptr inbounds %struct.PyASCIIObject, %struct.PyASCIIObject* %9, i32 0, i32 2
  %11 = load i64, i64* %10, align 8
  %12 = call %struct._object* @_PyDict_GetItem_KnownHash(%struct._object* noundef %6, %struct._object* noundef %7, i64 noundef %11)
  store %struct._object* %12, %struct._object** %5, align 8
  %13 = load %struct._object*, %struct._object** %5, align 8
  %14 = icmp eq %struct._object* %13, null
  br i1 %14, label %15, label %16

15:                                               ; preds = %2
  call void @PyErr_Clear()
  br label %16

16:                                               ; preds = %15, %2
  %17 = load %struct._object*, %struct._object** %5, align 8
  ret %struct._object* %17
}

declare i32 @PyObject_Not(%struct._object* noundef) #1

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @__pyx_bisect_code_objects(%struct.__Pyx_CodeObjectCacheEntry* noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca %struct.__Pyx_CodeObjectCacheEntry*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  store %struct.__Pyx_CodeObjectCacheEntry* %0, %struct.__Pyx_CodeObjectCacheEntry** %5, align 8
  store i32 %1, i32* %6, align 4
  store i32 %2, i32* %7, align 4
  store i32 0, i32* %8, align 4
  store i32 0, i32* %9, align 4
  %11 = load i32, i32* %6, align 4
  %12 = sub nsw i32 %11, 1
  store i32 %12, i32* %10, align 4
  %13 = load i32, i32* %10, align 4
  %14 = icmp sge i32 %13, 0
  br i1 %14, label %15, label %26

15:                                               ; preds = %3
  %16 = load i32, i32* %7, align 4
  %17 = load %struct.__Pyx_CodeObjectCacheEntry*, %struct.__Pyx_CodeObjectCacheEntry** %5, align 8
  %18 = load i32, i32* %10, align 4
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds %struct.__Pyx_CodeObjectCacheEntry, %struct.__Pyx_CodeObjectCacheEntry* %17, i64 %19
  %21 = getelementptr inbounds %struct.__Pyx_CodeObjectCacheEntry, %struct.__Pyx_CodeObjectCacheEntry* %20, i32 0, i32 1
  %22 = load i32, i32* %21, align 8
  %23 = icmp sgt i32 %16, %22
  br i1 %23, label %24, label %26

24:                                               ; preds = %15
  %25 = load i32, i32* %6, align 4
  store i32 %25, i32* %4, align 4
  br label %78

26:                                               ; preds = %15, %3
  br label %27

27:                                               ; preds = %63, %26
  %28 = load i32, i32* %8, align 4
  %29 = load i32, i32* %10, align 4
  %30 = icmp slt i32 %28, %29
  br i1 %30, label %31, label %64

31:                                               ; preds = %27
  %32 = load i32, i32* %8, align 4
  %33 = load i32, i32* %10, align 4
  %34 = load i32, i32* %8, align 4
  %35 = sub nsw i32 %33, %34
  %36 = sdiv i32 %35, 2
  %37 = add nsw i32 %32, %36
  store i32 %37, i32* %9, align 4
  %38 = load i32, i32* %7, align 4
  %39 = load %struct.__Pyx_CodeObjectCacheEntry*, %struct.__Pyx_CodeObjectCacheEntry** %5, align 8
  %40 = load i32, i32* %9, align 4
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds %struct.__Pyx_CodeObjectCacheEntry, %struct.__Pyx_CodeObjectCacheEntry* %39, i64 %41
  %43 = getelementptr inbounds %struct.__Pyx_CodeObjectCacheEntry, %struct.__Pyx_CodeObjectCacheEntry* %42, i32 0, i32 1
  %44 = load i32, i32* %43, align 8
  %45 = icmp slt i32 %38, %44
  br i1 %45, label %46, label %48

46:                                               ; preds = %31
  %47 = load i32, i32* %9, align 4
  store i32 %47, i32* %10, align 4
  br label %63

48:                                               ; preds = %31
  %49 = load i32, i32* %7, align 4
  %50 = load %struct.__Pyx_CodeObjectCacheEntry*, %struct.__Pyx_CodeObjectCacheEntry** %5, align 8
  %51 = load i32, i32* %9, align 4
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds %struct.__Pyx_CodeObjectCacheEntry, %struct.__Pyx_CodeObjectCacheEntry* %50, i64 %52
  %54 = getelementptr inbounds %struct.__Pyx_CodeObjectCacheEntry, %struct.__Pyx_CodeObjectCacheEntry* %53, i32 0, i32 1
  %55 = load i32, i32* %54, align 8
  %56 = icmp sgt i32 %49, %55
  br i1 %56, label %57, label %60

57:                                               ; preds = %48
  %58 = load i32, i32* %9, align 4
  %59 = add nsw i32 %58, 1
  store i32 %59, i32* %8, align 4
  br label %62

60:                                               ; preds = %48
  %61 = load i32, i32* %9, align 4
  store i32 %61, i32* %4, align 4
  br label %78

62:                                               ; preds = %57
  br label %63

63:                                               ; preds = %62, %46
  br label %27, !llvm.loop !18

64:                                               ; preds = %27
  %65 = load i32, i32* %7, align 4
  %66 = load %struct.__Pyx_CodeObjectCacheEntry*, %struct.__Pyx_CodeObjectCacheEntry** %5, align 8
  %67 = load i32, i32* %9, align 4
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds %struct.__Pyx_CodeObjectCacheEntry, %struct.__Pyx_CodeObjectCacheEntry* %66, i64 %68
  %70 = getelementptr inbounds %struct.__Pyx_CodeObjectCacheEntry, %struct.__Pyx_CodeObjectCacheEntry* %69, i32 0, i32 1
  %71 = load i32, i32* %70, align 8
  %72 = icmp sle i32 %65, %71
  br i1 %72, label %73, label %75

73:                                               ; preds = %64
  %74 = load i32, i32* %9, align 4
  store i32 %74, i32* %4, align 4
  br label %78

75:                                               ; preds = %64
  %76 = load i32, i32* %9, align 4
  %77 = add nsw i32 %76, 1
  store i32 %77, i32* %4, align 4
  br label %78

78:                                               ; preds = %75, %73, %60, %24
  %79 = load i32, i32* %4, align 4
  ret i32 %79
}

declare %struct._object* @PyUnicode_FromFormat(i8* noundef, ...) #1

declare i8* @PyUnicode_AsUTF8(%struct._object* noundef) #1

declare %struct.PyCodeObject* @PyCode_NewEmpty(i8* noundef, i8* noundef, i32 noundef) #1

declare i8* @PyMem_Malloc(i64 noundef) #1

declare i8* @PyMem_Realloc(i8* noundef, i64 noundef) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #5

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readnone willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly nofree nounwind willreturn }
attributes #6 = { nounwind readnone willreturn }
attributes #7 = { noreturn nounwind }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 1}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
!8 = distinct !{!8, !7}
!9 = distinct !{!9, !7}
!10 = distinct !{!10, !7}
!11 = distinct !{!11, !7}
!12 = distinct !{!12, !7}
!13 = distinct !{!13, !7}
!14 = distinct !{!14, !7}
!15 = distinct !{!15, !7}
!16 = distinct !{!16, !7}
!17 = distinct !{!17, !7}
!18 = distinct !{!18, !7}
