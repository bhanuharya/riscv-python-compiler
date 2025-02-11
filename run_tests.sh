#!/bin/bash

for f in ./tests/*.py; do
    echo $f
    python main.py $f -b64
    clang out.ll readline.c -Wno-override-module
    ./a.out
done

