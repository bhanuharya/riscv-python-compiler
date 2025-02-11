@ECHO OFF

PUSHD bin
python ../main.py ../test.py
clang -c ../scanf.c -o scanf.o
clang out.ll scanf.o
POPD

