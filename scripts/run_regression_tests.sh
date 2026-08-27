#!/bin/bash
# Reproducible regression test runner for the pyrv compiler.
#
# Usage:
#   ./run_regression_tests.sh
#
# External tools are resolved from the PYRV_* environment variables (see
# src/runner.py) with sensible defaults. If the RISC-V toolchain/QEMU are
# unavailable, the end-to-end tests are skipped; the frontend, type-checker,
# IR-structure, and reference-evaluator tests always run.
set -euo pipefail

ROOT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

PYTHON=${PYTHON:-python3}
if [ -x .venv/bin/python ]; then
    PYTHON=.venv/bin/python
fi

export PYTHONPATH="$(pwd):${PYTHONPATH:-}"

exec "$PYTHON" -m unittest discover -s unittests -t . -v
