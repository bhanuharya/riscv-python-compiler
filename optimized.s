	.text
	.attribute	4, 16
	.attribute	5, "rv32i2p0_m2p0_a2p0_f2p0_d2p0"
	.file	"<string>"
	.globl	main                            # -- Begin function main
	.p2align	2
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:                                # %entry
	addi	sp, sp, -48
	.cfi_def_cfa_offset 48
	sw	ra, 44(sp)                      # 4-byte Folded Spill
	.cfi_offset ra, -4
	li	a0, 3
	sw	a0, 40(sp)
	li	a0, 2
	sw	a0, 36(sp)
	li	a0, 1
	sw	a0, 32(sp)
	lui	a0, %hi(0)
	addi	a0, a0, %lo(0)
	li	a1, 1
	call	printf@plt
	lw	a0, 40(sp)
	lw	a1, 36(sp)
	fcvt.d.w	ft0, a0
	fcvt.d.w	ft1, a1
	fdiv.d	ft0, ft0, ft1
	fsd	ft0, 24(sp)
	fsd	ft0, 0(sp)
	lw	a2, 0(sp)
	lw	a3, 4(sp)
	lui	a0, %hi(1)
	addi	a0, a0, %lo(1)
	call	printf@plt
	li	a0, 11
	sw	a0, 20(sp)
	lui	a0, %hi(2)
	addi	a0, a0, %lo(2)
	li	a1, 11
	call	printf@plt
	lui	a0, 262752
	sw	a0, 12(sp)
	sw	zero, 8(sp)
	lui	a0, %hi(3)
	addi	a0, a0, %lo(3)
	lui	a3, 262752
	li	a2, 0
	call	printf@plt
	lw	ra, 44(sp)                      # 4-byte Folded Reload
	addi	sp, sp, 48
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

	.type	1,@object                       # @"1"
1:
	.asciz	"%f\n"
	.size	1, 4

	.type	2,@object                       # @"2"
2:
	.asciz	"%d\n"
	.size	2, 4

	.type	3,@object                       # @"3"
3:
	.asciz	"%f\n"
	.size	3, 4

	.section	".note.GNU-stack","",@progbits
