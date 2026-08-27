/*
 * pyrv runtime library
 *
 * Provides a simple bump allocator for heap-allocated buffers (list element
 * arrays, concatenated/repeated string buffers, etc.) plus an optional
 * subscript bounds-check helper.
 *
 * Design notes:
 *   - The heap is a single mmap'd region, allocated lazily on first use.
 *   - Allocations are 8-byte aligned and never freed individually; the whole
 *     heap is reclaimed when the process exits. This is sufficient for a
 *     single-shot compiled program that builds strings/lists and runs to
 *     completion.
 *   - Out-of-memory is fatal (returns NULL; the caller is expected to have
 *     sized the heap generously).
 */

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/mman.h>
#include <unistd.h>

#define PYR_HEAP_SIZE (16u * 1024u * 1024u)  /* 16 MB */

static char *pyr_heap = (char *)0;
static char *pyr_bump = (char *)0;
static char *pyr_heap_end = (char *)0;

void pyr_alloc_init(void)
{
    if (pyr_heap != (char *)0) {
        return;
    }
    pyr_heap = (char *)mmap((void *)0, PYR_HEAP_SIZE,
                            PROT_READ | PROT_WRITE,
                            MAP_ANON | MAP_PRIVATE, -1, 0);
    if (pyr_heap == (char *)MAP_FAILED) {
        pyr_heap = (char *)0;
        return;
    }
    pyr_bump = pyr_heap;
    pyr_heap_end = pyr_heap + PYR_HEAP_SIZE;
}

void *pyr_alloc(uint32_t size)
{
    if (pyr_heap == (char *)0) {
        pyr_alloc_init();
        if (pyr_heap == (char *)0) {
            return (void *)0;
        }
    }
    /* 8-byte align the allocation */
    uint32_t aligned = (size + 7u) & ~7u;
    if ((uint32_t)(pyr_heap_end - pyr_bump) < aligned) {
        /* Out of memory. For a research compiler this is fatal. */
        return (void *)0;
    }
    void *result = (void *)pyr_bump;
    pyr_bump += aligned;
    return result;
}

/*
 * Bounds check for subscript access. Called before every list/string
 * element access when the program is compiled with --bounds-check.
 * Negative indices are rejected: unlike CPython, the language does not
 * support them (see docs/language-spec.md).
 * On violation prints a diagnostic to stderr and exits with status 1,
 * mirroring an uncaught Python IndexError.
 */
void pyr_bounds_check(int32_t index, uint32_t count)
{
    if (index < 0 || (uint32_t)index >= count) {
        fprintf(stderr, "IndexError: index %d out of range for size %u\n",
                index, (unsigned)count);
        exit(1);
    }
}
