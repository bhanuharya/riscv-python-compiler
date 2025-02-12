	.text
	.attribute	4, 16
	.attribute	5, "rv32i2p0"
	.file	"<string>"
	.globl	main                            # -- Begin function main
	.p2align	2
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:                                # %entry
	addi	sp, sp, -32
	.cfi_def_cfa_offset 32
	sw	ra, 28(sp)                      # 4-byte Folded Spill
	.cfi_offset ra, -4
	lui	a0, %hi(0)
	addi	a1, a0, %lo(0)
	li	a0, 11
	sw	a0, 8(sp)
	sw	a1, 12(sp)
	sw	a0, 16(sp)
	sw	a1, 20(sp)
	sw	a0, 0(sp)
	sw	a1, 4(sp)
	lui	a0, %hi(1)
	addi	a0, a0, %lo(1)
	call	printf@plt
	lw	ra, 28(sp)                      # 4-byte Folded Reload
	addi	sp, sp, 32
	ret
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.type	0,@object                       # @"0"
	.section	.rodata,"a",@progbits
0:
	.asciz	"some string"
	.size	0, 12

	.type	1,@object                       # @"1"
1:
	.asciz	"%s\n"
	.size	1, 4

	.section	".note.GNU-stack","",@progbits
