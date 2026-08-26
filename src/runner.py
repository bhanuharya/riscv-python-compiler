"""
Build/run harness for the pyrv compiler.

This module separates the *compile* (frontend, opt, llc, link) and *execute*
(QEMU) steps from the compiler itself, and resolves all external tool paths
from environment variables with sensible defaults. It is used by the test
suite and can be used interactively.

Environment variable configuration:

    PYRV_OPT        path to opt (default: opt-14)
    PYRV_LLC        path to llc with RISC-V backend (default: llc-14)
    PYRV_CC         path to the RISC-V cross-clang (default:
                    riscv32-unknown-linux-gnu-clang)
    PYRV_SYSROOT    cross sysroot for --sysroot (default: /opt/riscv/sysroot)
    PYRV_QEMU_USER  qemu-riscv32 user-mode binary (default: qemu-riscv32)
    PYRV_READLINE   path to readline.c helper (default: ./readline.c)
    PYRV_RUNTIME_LIB path to a runtime shared dir containing readline.c
                     (used when readline.c is not in the current dir)
    PYRV_RUNTIME    path to runtime.c (heap allocator) (default: ./runtime.c)
"""

from __future__ import annotations

import os
import shutil
import subprocess
import tempfile
from pathlib import Path

# The optimization pipeline used by default in build_benchmark / tests.
DEFAULT_PASSES = 'simplifycfg,instcombine,sroa,dce'

RISCV_MARCH = 'rv32gc'
RISCV_MABI = 'ilp32d'
LLC_MATTRS = '+m,+a,+f,+d'

_REPO_ROOT = Path(__file__).resolve().parent.parent


def _which(default: str, env: str) -> str:
    """Return env override if set, else the resolved path of `default`.

    A bare name (no directory separator) is resolved through PATH even when
    it comes from an environment override, so `PYRV_QEMU_USER=qemu-riscv32`
    works the same as `PYRV_QEMU_USER=/usr/bin/qemu-riscv32`.
    """
    override = os.environ.get(env)
    name = override if override else default
    if name and os.sep not in name:
        resolved = shutil.which(name)
        if resolved:
            return resolved
    return name if name else default


def opt_path() -> str:
    return _which('opt-14', 'PYRV_OPT')


def llc_path() -> str:
    return _which('llc-14', 'PYRV_LLC')


def cc_path() -> str:
    return _which('riscv32-unknown-linux-gnu-clang', 'PYRV_CC')


def sysroot_path() -> str:
    return os.environ.get('PYRV_SYSROOT', '/opt/riscv/sysroot')


def qemu_user_path() -> str:
    return _which('qemu-riscv32', 'PYRV_QEMU_USER')


def readline_path() -> str:
    """Locate readline.c (the C runtime helper for input())."""
    override = os.environ.get('PYRV_READLINE')
    if override:
        return override
    local = _REPO_ROOT / 'readline.c'
    if local.exists():
        return str(local)
    libdir = os.environ.get('PYRV_RUNTIME_LIB')
    if libdir:
        candidate = Path(libdir) / 'readline.c'
        if candidate.exists():
            return str(candidate)
    return str(local)


def runtime_path() -> str:
    """Locate runtime.c (the C runtime helper: bump allocator)."""
    override = os.environ.get('PYRV_RUNTIME')
    if override:
        return override
    local = _REPO_ROOT / 'runtime.c'
    if local.exists():
        return str(local)
    return str(local)


def _run(cmd: list[str], cwd=None) -> subprocess.CompletedProcess:
    return subprocess.run(
        cmd, cwd=cwd, stdout=subprocess.PIPE, stderr=subprocess.PIPE,
        text=True)


class ToolchainError(Exception):
    """A required external tool is missing or a stage failed."""


def _check_tool(path: str, name: str):
    if not os.path.exists(path) or not os.access(path, os.X_OK):
        raise ToolchainError(f'{name} not found or not executable: {path}')


def compile_program(src: str, out_dir: str, passes: str | None = None,
                    name: str | None = None,
                    bounds_check: bool = False) -> dict[str, str]:
    """
    Compile a .py source through IR -> opt -> llc -> link.

    Returns a dict mapping stage names to output file paths:
        ir, opt_bc, asm, exe
    """
    src = str(src)
    out_dir = Path(out_dir)
    out_dir.mkdir(parents=True, exist_ok=True)
    base = name or Path(src).stem

    ir = out_dir / f'{base}.ll'
    opt_bc = out_dir / f'{base}.opt.bc'
    asm = out_dir / f'{base}.s'
    exe = out_dir / f'{base}.riscv'

    # Frontend (the compiler itself). Run in-process via a small helper
    # script to avoid importing from the harness's own cwd issues.
    frontend = _REPO_ROOT / 'main.py'
    frontend_cmd = [os.sys.executable, str(frontend), src, '-o', str(ir)]
    if bounds_check:
        frontend_cmd.append('--bounds-check')
    proc = _run(frontend_cmd)
    if proc.returncode != 0:
        raise ToolchainError(f'frontend failed:\n{proc.stderr}')

    # Optimize + verify.
    opt = opt_path()
    _check_tool(opt, 'opt')
    if passes:
        proc = _run([opt, str(ir), '-o', str(opt_bc), '-passes=' + passes])
        if proc.returncode != 0:
            raise ToolchainError(f'opt failed:\n{proc.stderr}')
    else:
        opt_bc = ir

    # Always verify the module that will be code-generated.
    proc = _run([opt, str(opt_bc), '-verify', '-S', '-o', os.devnull])
    if proc.returncode != 0:
        raise ToolchainError(f'opt -verify failed:\n{proc.stderr}')

    # Codegen.
    llc = llc_path()
    _check_tool(llc, 'llc')
    proc = _run([llc, '-march=riscv32', '-mattr=' + LLC_MATTRS,
                 str(opt_bc), '-o', str(asm)])
    if proc.returncode != 0:
        raise ToolchainError(f'llc failed:\n{proc.stderr}')

    # Link.
    cc = cc_path()
    _check_tool(cc, 'clang')
    sysroot = sysroot_path()
    proc = _run([cc, f'--sysroot={sysroot}', f'-march={RISCV_MARCH}',
                 f'-mabi={RISCV_MABI}', str(opt_bc), readline_path(),
                 runtime_path(), '-o', str(exe)])
    if proc.returncode != 0:
        raise ToolchainError(f'link failed:\n{proc.stderr}')

    return {
        'ir': str(ir),
        'opt_bc': str(opt_bc),
        'asm': str(asm),
        'exe': str(exe),
    }


def run_qemu(exe: str, stdin: str | None = None, timeout: int = 120,
             max_output: int = 10 * 1024 * 1024) -> tuple[int, str, str]:
    """
    Run a RISC-V executable under QEMU user mode.

    Returns (exit_code, stdout, stderr). The guest exit status is returned
    as-is (0 on success). Output beyond max_output bytes is truncated.
    """
    qemu = qemu_user_path()
    _check_tool(qemu, 'qemu-riscv32')
    sysroot = sysroot_path()
    cmd = [qemu, '-L', sysroot, str(exe)]
    try:
        proc = subprocess.run(
            cmd, input=stdin, stdout=subprocess.PIPE, stderr=subprocess.PIPE,
            timeout=timeout)
        return proc.returncode, proc.stdout[:max_output], proc.stderr[:max_output]
    except subprocess.TimeoutExpired as e:
        return -1, (e.stdout or b'')[:max_output], (e.stderr or b'')[:max_output]


def build_and_run(src: str, passes: str | None = DEFAULT_PASSES,
                  timeout: int = 120, keep: bool = False) -> tuple[int, str]:
    """
    Compile `src` (with the given opt passes) and run it under QEMU.

    Returns (exit_code, stdout text). Raises ToolchainError on build failure.
    """
    tmp = tempfile.mkdtemp(prefix='pyrv-')
    try:
        compile_program(src, tmp, passes=passes)
        code, out, err = run_qemu(
            Path(tmp) / (Path(src).stem + '.riscv'), timeout=timeout)
        if code != 0 and err:
            out = out + '\n[stderr]\n' + err
        return code, out
    finally:
        if not keep:
            shutil.rmtree(tmp, ignore_errors=True)
