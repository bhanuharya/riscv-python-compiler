	.text
	.attribute	4, 16
	.attribute	5, "rv32i2p1"
	.file	"<string>"
	.globl	main                            # -- Begin function main
	.p2align	2
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:                                # %entry
	addi	sp, sp, -16
	.cfi_def_cfa_offset 16
	sw	ra, 12(sp)                      # 4-byte Folded Spill
	.cfi_offset ra, -4
	li	a0, 20
	li	a1, 1
	sw	a0, 8(sp)
	bnez	a1, .LBB0_2
# %bb.1:                                # %if-true
	li	a0, 100
	sw	a0, 8(sp)
	j	.LBB0_3
.LBB0_2:                                # %or-else
	sw	zero, 8(sp)
.LBB0_3:                                # %after
	li	a0, 9
	lw	a1, 8(sp)
	blt	a0, a1, .LBB0_5
.LBB0_4:                                # %for-true
                                        # =>This Inner Loop Header: Depth=1
	lw	a1, 8(sp)
	addi	a1, a1, 1
	sw	a1, 8(sp)
	lw	a1, 8(sp)
	bge	a0, a1, .LBB0_4
.LBB0_5:                                # %or-else.1
	lw	a1, 8(sp)
	lui	a0, %hi(0)
	addi	a0, a0, %lo(0)
	call	printf
	lw	ra, 12(sp)                      # 4-byte Folded Reload
	addi	sp, sp, 16
	ret
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.type	0,@object                       # @"0"
	.section	.rodata,"a",@progbits
0:
	.asciz	"%d\n"
	.size	0, 4

	.section	".note.GNU-stack","",@progbits
