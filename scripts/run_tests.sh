#!/bin/bash

set -euo pipefail
ROOT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

for f in ./tests/*.py; do
    echo $f
    python main.py $f -b64
    clang out.ll readline.c -Wno-override-module
    ./a.out
done
