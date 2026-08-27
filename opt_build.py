#!/usr/bin/env python3
"""Compatibility launcher for the structured optimization runner."""
from pathlib import Path
import runpy

runpy.run_path(str(Path(__file__).resolve().parent / "scripts" / "opt_build.py"), run_name="__main__")
