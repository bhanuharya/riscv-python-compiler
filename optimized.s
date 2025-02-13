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
	addi	sp, sp, -96
	.cfi_def_cfa_offset 96
	sw	ra, 92(sp)                      # 4-byte Folded Spill
	sw	s0, 88(sp)                      # 4-byte Folded Spill
	sw	s1, 84(sp)                      # 4-byte Folded Spill
	sw	s2, 80(sp)                      # 4-byte Folded Spill
	sw	s3, 76(sp)                      # 4-byte Folded Spill
	sw	s4, 72(sp)                      # 4-byte Folded Spill
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	.cfi_offset s1, -12
	.cfi_offset s2, -16
	.cfi_offset s3, -20
	.cfi_offset s4, -24
	addi	s0, sp, 96
	.cfi_def_cfa s0, 0
	lui	a0, %hi(0)
	addi	a0, a0, %lo(0)
	lui	a1, %hi(1)
	addi	a1, a1, %lo(1)
	li	a2, 13
	sw	a2, -32(s0)
	sw	a1, -28(s0)
	call	printf@plt
	lui	a0, %hi(2)
	addi	a0, a0, %lo(2)
	lui	a1, %hi(3)
	addi	a1, a1, %lo(3)
	li	a2, 12
	sw	a2, -40(s0)
	sw	a1, -36(s0)
	call	printf@plt
	sw	zero, -88(s0)
	li	a0, 9
	addi	a1, s0, -84
	lw	a2, -88(s0)
	blt	a0, a2, .LBB0_2
.LBB0_1:                                # %range-body
                                        # =>This Inner Loop Header: Depth=1
	slli	a3, a2, 2
	add	a3, a1, a3
	sw	a2, 0(a3)
	addi	a2, a2, 1
	sw	a2, -88(s0)
	lw	a2, -88(s0)
	bge	a0, a2, .LBB0_1
.LBB0_2:                                # %after
	mv	a0, sp
	addi	s2, a0, -16
	mv	sp, s2
	li	a1, 10
	sw	a1, -16(a0)
	addi	a1, s0, -84
	sw	a1, -12(a0)
	mv	a0, sp
	addi	s3, a0, -16
	mv	sp, s3
	sw	zero, -16(a0)
	lui	a0, %hi(4)
	addi	s1, a0, %lo(4)
.LBB0_3:                                # %cond.1
                                        # =>This Inner Loop Header: Depth=1
	lw	s4, 0(s3)
	lw	a0, 0(s2)
	bge	s4, a0, .LBB0_5
# %bb.4:                                # %for-body
                                        #   in Loop: Header=BB0_3 Depth=1
	lw	a0, 4(s2)
	slli	a1, s4, 2
	add	a0, a0, a1
	lw	a0, 0(a0)
	sw	a0, -44(s0)
	fcvt.d.w	ft0, a0
	fsd	ft0, -96(s0)
	lw	a0, -96(s0)
	lw	a1, -92(s0)
	call	complex.factorial@plt
	mv	a2, a0
	mv	a0, s1
	mv	a3, a1
	call	printf@plt
	addi	a0, s4, 1
	sw	a0, 0(s3)
	j	.LBB0_3
.LBB0_5:                                # %orelse-body
	lui	a0, %hi(5)
	addi	a0, a0, %lo(5)
	lui	a1, %hi(6)
	addi	a1, a1, %lo(6)
	mv	a2, sp
	addi	sp, a2, -16
	li	a3, 15
	sw	a3, -16(a2)
	sw	a1, -12(a2)
	call	printf@plt
	mv	s1, sp
	addi	sp, s1, -16
	addi	sp, sp, -32
	lui	a0, 262464
	sw	a0, 4(sp)
	sw	zero, 0(sp)
	lui	a0, 262528
	sw	a0, 12(sp)
	sw	zero, 8(sp)
	lui	a0, 262592
	sw	a0, 20(sp)
	sw	zero, 16(sp)
	lui	a0, 262656
	sw	a0, 28(sp)
	lui	a1, 261888
	lui	a3, 262144
	lui	a5, 262272
	lui	a7, 262400
	sw	zero, 24(sp)
	li	a0, 0
	li	a2, 0
	li	a4, 0
	li	a6, 0
	call	complex.matrix_multiply@plt
	addi	sp, sp, 32
	sw	a0, -96(s0)
	sw	a1, -92(s0)
	fld	ft0, -96(s0)
	fsd	ft0, -16(s1)
	lui	a0, %hi(25)
	addi	a0, a0, %lo(25)
	lui	a1, %hi(26)
	addi	a1, a1, %lo(26)
	mv	a2, sp
	addi	sp, a2, -16
	li	a3, 31
	sw	a3, -16(a2)
	sw	a1, -12(a2)
	call	printf@plt
	lui	a0, 265273
	addi	a1, a0, -2048
	li	a0, 0
	call	complex.compute_e@plt
	lui	a0, %hi(30)
	addi	a0, a0, %lo(30)
	lui	a1, %hi(31)
	addi	a1, a1, %lo(31)
	mv	a2, sp
	addi	sp, a2, -16
	li	a3, 39
	sw	a3, -16(a2)
	sw	a1, -12(a2)
	call	printf@plt
	lui	a0, 265863
	addi	a1, a0, -1536
	li	a0, 0
	call	complex.intensive_computation@plt
	lui	a0, %hi(38)
	addi	a0, a0, %lo(38)
	lui	a1, %hi(39)
	addi	a1, a1, %lo(39)
	mv	a2, sp
	addi	sp, a2, -16
	li	a3, 24
	sw	a3, -16(a2)
	sw	a1, -12(a2)
	call	printf@plt
	addi	sp, sp, -16
	lui	a0, 263568
	sw	a0, 4(sp)
	lui	a0, 629146
	addi	a0, a0, -1638
	lui	a1, 261914
	addi	a1, a1, -1639
	lui	a2, 209715
	addi	a2, a2, 819
	lui	a3, 261939
	addi	a3, a3, 819
	lui	a4, 838861
	addi	a4, a4, -819
	lui	a5, 261965
	addi	a5, a5, -820
	lui	a6, 419430
	addi	a6, a6, 1638
	lui	a7, 261990
	addi	a7, a7, 1638
	sw	zero, 0(sp)
	call	complex.matrix_exponentiation@plt
	addi	sp, sp, 16
	addi	sp, s0, -96
	lw	ra, 92(sp)                      # 4-byte Folded Reload
	lw	s0, 88(sp)                      # 4-byte Folded Reload
	lw	s1, 84(sp)                      # 4-byte Folded Reload
	lw	s2, 80(sp)                      # 4-byte Folded Reload
	lw	s3, 76(sp)                      # 4-byte Folded Reload
	lw	s4, 72(sp)                      # 4-byte Folded Reload
	addi	sp, sp, 96
	ret
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.section	.sdata,"aw",@progbits
	.p2align	3                               # -- Begin function complex.factorial
.LCPI1_0:
	.quad	0x3ff0000000000000              # double 1
	.text
	.globl	complex.factorial
	.p2align	2
	.type	complex.factorial,@function
complex.factorial:                      # @complex.factorial
	.cfi_startproc
# %bb.0:                                # %entry
	addi	sp, sp, -32
	.cfi_def_cfa_offset 32
	sw	ra, 28(sp)                      # 4-byte Folded Spill
	sw	s0, 24(sp)                      # 4-byte Folded Spill
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	addi	s0, sp, 32
	.cfi_def_cfa s0, 0
	sw	a0, -24(s0)
	sw	a1, -20(s0)
	fld	ft1, -24(s0)
	lui	a0, %hi(.LCPI1_0)
	fld	ft0, %lo(.LCPI1_0)(a0)
	fle.d	a0, ft1, ft0
	fsd	ft1, -16(s0)
	beqz	a0, .LBB1_2
# %bb.1:                                # %if-true
	lui	a1, 261888
	li	a0, 0
	j	.LBB1_6
.LBB1_2:                                # %or-else
	mv	a1, sp
	addi	a0, a1, -16
	mv	sp, a0
	lui	a2, 261888
	sw	a2, -12(a1)
	sw	zero, -16(a1)
	mv	a3, sp
	addi	a1, a3, -16
	mv	sp, a1
	sw	a2, -12(a3)
	sw	zero, -16(a3)
.LBB1_3:                                # %cond
                                        # =>This Inner Loop Header: Depth=1
	fld	ft1, 0(a1)
	fld	ft2, -16(s0)
	fle.d	a2, ft1, ft2
	beqz	a2, .LBB1_5
# %bb.4:                                # %for-true
                                        #   in Loop: Header=BB1_3 Depth=1
	fld	ft1, 0(a0)
	fld	ft2, 0(a1)
	fld	ft3, 0(a1)
	fmul.d	ft1, ft1, ft2
	fsd	ft1, 0(a0)
	fadd.d	ft1, ft3, ft0
	fsd	ft1, 0(a1)
	j	.LBB1_3
.LBB1_5:                                # %or-else.1
	fld	ft0, 0(a0)
	fsd	ft0, -24(s0)
	lw	a0, -24(s0)
	lw	a1, -20(s0)
.LBB1_6:                                # %if-true
	addi	sp, s0, -32
	lw	ra, 28(sp)                      # 4-byte Folded Reload
	lw	s0, 24(sp)                      # 4-byte Folded Reload
	addi	sp, sp, 32
	ret
.Lfunc_end1:
	.size	complex.factorial, .Lfunc_end1-complex.factorial
	.cfi_endproc
                                        # -- End function
	.globl	complex.matrix_multiply         # -- Begin function complex.matrix_multiply
	.p2align	2
	.type	complex.matrix_multiply,@function
complex.matrix_multiply:                # @complex.matrix_multiply
	.cfi_startproc
# %bb.0:                                # %entry
	addi	sp, sp, -112
	.cfi_def_cfa_offset 112
	sw	ra, 108(sp)                     # 4-byte Folded Spill
	sw	s0, 104(sp)                     # 4-byte Folded Spill
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	sw	a6, 8(sp)
	sw	a7, 12(sp)
	fld	ft0, 8(sp)
	sw	a4, 8(sp)
	sw	a5, 12(sp)
	fld	ft1, 8(sp)
	sw	a2, 8(sp)
	sw	a3, 12(sp)
	fld	ft2, 8(sp)
	sw	a0, 8(sp)
	sw	a1, 12(sp)
	fld	ft3, 8(sp)
	fld	ft4, 112(sp)
	fld	ft5, 128(sp)
	fsd	ft3, 96(sp)
	fsd	ft2, 88(sp)
	fmul.d	ft6, ft3, ft4
	fmul.d	ft7, ft2, ft5
	fadd.d	ft6, ft6, ft7
	fsd	ft6, 64(sp)
	fld	ft6, 120(sp)
	fld	ft7, 136(sp)
	fsd	ft1, 80(sp)
	fsd	ft0, 72(sp)
	fmul.d	ft3, ft3, ft6
	fmul.d	ft2, ft2, ft7
	fadd.d	ft2, ft3, ft2
	fsd	ft2, 56(sp)
	fmul.d	ft2, ft1, ft4
	fmul.d	ft3, ft0, ft5
	fadd.d	ft2, ft2, ft3
	fsd	ft2, 48(sp)
	fmul.d	ft1, ft1, ft6
	fmul.d	ft0, ft0, ft7
	fadd.d	ft0, ft1, ft0
	fsd	ft0, 40(sp)
	lui	a0, %hi(7)
	addi	a0, a0, %lo(7)
	lui	a1, %hi(8)
	addi	a1, a1, %lo(8)
	li	s0, 9
	sw	s0, 32(sp)
	sw	a1, 36(sp)
	call	printf@plt
	fld	ft0, 96(sp)
	lui	a0, %hi(9)
	addi	a0, a0, %lo(9)
	fsd	ft0, 8(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	call	printf@plt
	fld	ft0, 88(sp)
	lui	a0, %hi(10)
	addi	a0, a0, %lo(10)
	fsd	ft0, 8(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	call	printf@plt
	fld	ft0, 80(sp)
	lui	a0, %hi(11)
	addi	a0, a0, %lo(11)
	fsd	ft0, 8(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	call	printf@plt
	fld	ft0, 72(sp)
	lui	a0, %hi(12)
	addi	a0, a0, %lo(12)
	fsd	ft0, 8(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	call	printf@plt
	lui	a0, %hi(13)
	addi	a0, a0, %lo(13)
	lui	a1, %hi(14)
	addi	a1, a1, %lo(14)
	sw	s0, 24(sp)
	sw	a1, 28(sp)
	call	printf@plt
	fld	ft0, 112(sp)
	lui	a0, %hi(15)
	addi	a0, a0, %lo(15)
	fsd	ft0, 8(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	call	printf@plt
	fld	ft0, 120(sp)
	lui	a0, %hi(16)
	addi	a0, a0, %lo(16)
	fsd	ft0, 8(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	call	printf@plt
	fld	ft0, 128(sp)
	lui	a0, %hi(17)
	addi	a0, a0, %lo(17)
	fsd	ft0, 8(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	call	printf@plt
	fld	ft0, 136(sp)
	lui	a0, %hi(18)
	addi	a0, a0, %lo(18)
	fsd	ft0, 8(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	call	printf@plt
	lui	a0, %hi(19)
	addi	a0, a0, %lo(19)
	lui	a1, %hi(20)
	addi	a1, a1, %lo(20)
	li	a2, 19
	sw	a2, 16(sp)
	sw	a1, 20(sp)
	call	printf@plt
	fld	ft0, 64(sp)
	lui	a0, %hi(21)
	addi	a0, a0, %lo(21)
	fsd	ft0, 8(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	call	printf@plt
	fld	ft0, 56(sp)
	lui	a0, %hi(22)
	addi	a0, a0, %lo(22)
	fsd	ft0, 8(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	call	printf@plt
	fld	ft0, 48(sp)
	lui	a0, %hi(23)
	addi	a0, a0, %lo(23)
	fsd	ft0, 8(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	call	printf@plt
	fld	ft0, 40(sp)
	lui	a0, %hi(24)
	addi	a0, a0, %lo(24)
	fsd	ft0, 8(sp)
	lw	a2, 8(sp)
	lw	a3, 12(sp)
	call	printf@plt
	fld	ft0, 64(sp)
	fld	ft1, 56(sp)
	fld	ft2, 48(sp)
	fld	ft3, 40(sp)
	fadd.d	ft0, ft0, ft1
	fadd.d	ft0, ft0, ft2
	fadd.d	ft0, ft0, ft3
	fsd	ft0, 8(sp)
	lw	a0, 8(sp)
	lw	a1, 12(sp)
	lw	ra, 108(sp)                     # 4-byte Folded Reload
	lw	s0, 104(sp)                     # 4-byte Folded Reload
	addi	sp, sp, 112
	ret
.Lfunc_end2:
	.size	complex.matrix_multiply, .Lfunc_end2-complex.matrix_multiply
	.cfi_endproc
                                        # -- End function
	.section	.sdata,"aw",@progbits
	.p2align	3                               # -- Begin function complex.compute_e
.LCPI3_0:
	.quad	0x3ff0000000000000              # double 1
	.text
	.globl	complex.compute_e
	.p2align	2
	.type	complex.compute_e,@function
complex.compute_e:                      # @complex.compute_e
	.cfi_startproc
# %bb.0:                                # %entry
	addi	sp, sp, -64
	.cfi_def_cfa_offset 64
	sw	ra, 60(sp)                      # 4-byte Folded Spill
	sw	s0, 56(sp)                      # 4-byte Folded Spill
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	addi	s0, sp, 64
	.cfi_def_cfa s0, 0
	sw	a0, -56(s0)
	sw	a1, -52(s0)
	fld	ft0, -56(s0)
	fsd	ft0, -16(s0)
	lui	a0, 261888
	sw	a0, -20(s0)
	sw	zero, -24(s0)
	sw	a0, -28(s0)
	sw	zero, -32(s0)
	sw	a0, -36(s0)
	lui	a1, %hi(.LCPI3_0)
	fld	ft0, %lo(.LCPI3_0)(a1)
	sw	zero, -40(s0)
	sw	a0, -44(s0)
	sw	zero, -48(s0)
.LBB3_1:                                # %cond
                                        # =>This Inner Loop Header: Depth=1
	fld	ft1, -48(s0)
	fld	ft2, -16(s0)
	flt.d	a0, ft1, ft2
	beqz	a0, .LBB3_3
# %bb.2:                                # %for-true
                                        #   in Loop: Header=BB3_1 Depth=1
	fld	ft1, -32(s0)
	fld	ft2, -48(s0)
	fmul.d	ft1, ft1, ft2
	fld	ft3, -24(s0)
	fsd	ft1, -32(s0)
	fdiv.d	ft1, ft0, ft1
	fsd	ft1, -40(s0)
	fadd.d	ft1, ft3, ft1
	fsd	ft1, -24(s0)
	fadd.d	ft1, ft2, ft0
	fsd	ft1, -48(s0)
	j	.LBB3_1
.LBB3_3:                                # %or-else
	lui	a0, %hi(27)
	addi	a0, a0, %lo(27)
	lui	a1, %hi(28)
	addi	a1, a1, %lo(28)
	mv	a2, sp
	addi	sp, a2, -16
	li	a3, 11
	sw	a3, -16(a2)
	sw	a1, -12(a2)
	call	printf@plt
	fld	ft0, -24(s0)
	lui	a0, %hi(29)
	addi	a0, a0, %lo(29)
	fsd	ft0, -56(s0)
	lw	a2, -56(s0)
	lw	a3, -52(s0)
	call	printf@plt
	fld	ft0, -24(s0)
	fsd	ft0, -56(s0)
	lw	a0, -56(s0)
	lw	a1, -52(s0)
	addi	sp, s0, -64
	lw	ra, 60(sp)                      # 4-byte Folded Reload
	lw	s0, 56(sp)                      # 4-byte Folded Reload
	addi	sp, sp, 64
	ret
.Lfunc_end3:
	.size	complex.compute_e, .Lfunc_end3-complex.compute_e
	.cfi_endproc
                                        # -- End function
	.section	.sdata,"aw",@progbits
	.p2align	3                               # -- Begin function complex.intensive_computation
.LCPI4_0:
	.quad	0x3ff00068db8bac71              # double 1.0001
.LCPI4_1:
	.quad	0x3ff000d1b71758e2              # double 1.0002
.LCPI4_2:
	.quad	0x3ff0013a92a30553              # double 1.0003
.LCPI4_3:
	.quad	0xbff001a36e2eb1c4              # double -1.0004
.LCPI4_4:
	.quad	0x3ff0020c49ba5e35              # double 1.0004999999999999
.LCPI4_5:
	.quad	0x3ff0027525460aa6              # double 1.0005999999999999
.LCPI4_6:
	.quad	0x3ff002de00d1b717              # double 1.0006999999999999
.LCPI4_7:
	.quad	0xbff00346dc5d6388              # double -1.0007999999999999
.LCPI4_8:
	.quad	0x3ff0000000000000              # double 1
	.text
	.globl	complex.intensive_computation
	.p2align	2
	.type	complex.intensive_computation,@function
complex.intensive_computation:          # @complex.intensive_computation
	.cfi_startproc
# %bb.0:                                # %entry
	addi	sp, sp, -64
	.cfi_def_cfa_offset 64
	sw	ra, 60(sp)                      # 4-byte Folded Spill
	sw	s0, 56(sp)                      # 4-byte Folded Spill
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	addi	s0, sp, 64
	.cfi_def_cfa s0, 0
	sw	a0, -64(s0)
	sw	a1, -60(s0)
	fld	ft0, -64(s0)
	fsd	ft0, -16(s0)
	lui	a0, 266989
	addi	a0, a0, 874
	sw	a0, -20(s0)
	lui	a0, 211812
	addi	a0, a0, 1442
	sw	a0, -24(s0)
	lui	a1, 267245
	addi	a1, a1, 874
	sw	a1, -28(s0)
	sw	a0, -32(s0)
	lui	a1, 267378
	addi	a1, a1, -369
	sw	a1, -36(s0)
	lui	a1, 683147
	addi	a1, a1, 1081
	sw	a1, -40(s0)
	lui	a1, 267501
	addi	a1, a1, 874
	sw	a1, -44(s0)
	sw	a0, -48(s0)
	lui	a0, %hi(.LCPI4_0)
	fld	ft0, %lo(.LCPI4_0)(a0)
	lui	a0, %hi(.LCPI4_1)
	fld	ft1, %lo(.LCPI4_1)(a0)
	lui	a0, %hi(.LCPI4_2)
	fld	ft2, %lo(.LCPI4_2)(a0)
	lui	a0, %hi(.LCPI4_3)
	fld	ft3, %lo(.LCPI4_3)(a0)
	lui	a0, %hi(.LCPI4_4)
	fld	ft4, %lo(.LCPI4_4)(a0)
	lui	a0, %hi(.LCPI4_5)
	fld	ft5, %lo(.LCPI4_5)(a0)
	lui	a0, %hi(.LCPI4_6)
	fld	ft6, %lo(.LCPI4_6)(a0)
	lui	a0, %hi(.LCPI4_7)
	fld	ft7, %lo(.LCPI4_7)(a0)
	lui	a0, %hi(.LCPI4_8)
	fld	fa0, %lo(.LCPI4_8)(a0)
	lui	a0, 261888
	sw	a0, -52(s0)
	sw	zero, -56(s0)
.LBB4_1:                                # %cond
                                        # =>This Inner Loop Header: Depth=1
	fld	fa1, -56(s0)
	fld	fa2, -16(s0)
	flt.d	a0, fa1, fa2
	beqz	a0, .LBB4_3
# %bb.2:                                # %for-true
                                        #   in Loop: Header=BB4_1 Depth=1
	fld	fa1, -32(s0)
	fld	fa2, -24(s0)
	fld	fa3, -40(s0)
	fdiv.d	fa4, fa1, ft0
	fmul.d	fa4, fa4, ft1
	fadd.d	fa2, fa2, fa4
	fdiv.d	fa4, fa3, ft2
	fadd.d	fa4, fa4, ft3
	fld	fa5, -48(s0)
	fmul.d	fa1, fa1, fa4
	fsd	fa2, -24(s0)
	fsd	fa1, -32(s0)
	fdiv.d	fa1, fa5, ft4
	fmul.d	fa1, fa1, ft5
	fadd.d	fa1, fa3, fa1
	fsd	fa1, -40(s0)
	fdiv.d	fa1, fa2, ft6
	fld	fa2, -56(s0)
	fadd.d	fa1, fa1, ft7
	fmul.d	fa1, fa5, fa1
	fsd	fa1, -48(s0)
	fadd.d	fa1, fa2, fa0
	fsd	fa1, -56(s0)
	j	.LBB4_1
.LBB4_3:                                # %or-else
	lui	a0, %hi(32)
	addi	a0, a0, %lo(32)
	lui	a1, %hi(33)
	addi	a1, a1, %lo(33)
	mv	a2, sp
	addi	sp, a2, -16
	li	a3, 22
	sw	a3, -16(a2)
	sw	a1, -12(a2)
	call	printf@plt
	fld	ft0, -24(s0)
	lui	a0, %hi(34)
	addi	a0, a0, %lo(34)
	fsd	ft0, -64(s0)
	lw	a2, -64(s0)
	lw	a3, -60(s0)
	call	printf@plt
	fld	ft0, -32(s0)
	lui	a0, %hi(35)
	addi	a0, a0, %lo(35)
	fsd	ft0, -64(s0)
	lw	a2, -64(s0)
	lw	a3, -60(s0)
	call	printf@plt
	fld	ft0, -40(s0)
	lui	a0, %hi(36)
	addi	a0, a0, %lo(36)
	fsd	ft0, -64(s0)
	lw	a2, -64(s0)
	lw	a3, -60(s0)
	call	printf@plt
	fld	ft0, -48(s0)
	lui	a0, %hi(37)
	addi	a0, a0, %lo(37)
	fsd	ft0, -64(s0)
	lw	a2, -64(s0)
	lw	a3, -60(s0)
	call	printf@plt
	fld	ft0, -24(s0)
	fld	ft1, -32(s0)
	fld	ft2, -40(s0)
	fld	ft3, -48(s0)
	fadd.d	ft0, ft0, ft1
	fadd.d	ft0, ft0, ft2
	fadd.d	ft0, ft0, ft3
	fsd	ft0, -64(s0)
	lw	a0, -64(s0)
	lw	a1, -60(s0)
	addi	sp, s0, -64
	lw	ra, 60(sp)                      # 4-byte Folded Reload
	lw	s0, 56(sp)                      # 4-byte Folded Reload
	addi	sp, sp, 64
	ret
.Lfunc_end4:
	.size	complex.intensive_computation, .Lfunc_end4-complex.intensive_computation
	.cfi_endproc
                                        # -- End function
	.section	.sdata,"aw",@progbits
	.p2align	3                               # -- Begin function complex.matrix_exponentiation
.LCPI5_0:
	.quad	0x3ff000d1b71758e2              # double 1.0002
.LCPI5_1:
	.quad	0xbff0013a92a30553              # double -1.0003
.LCPI5_2:
	.quad	0x3ff001a36e2eb1c4              # double 1.0004
.LCPI5_3:
	.quad	0x3ff0020c49ba5e35              # double 1.0004999999999999
.LCPI5_4:
	.quad	0x3ff0027525460aa6              # double 1.0005999999999999
.LCPI5_5:
	.quad	0x3ff002de00d1b717              # double 1.0006999999999999
.LCPI5_6:
	.quad	0x3ff00346dc5d6388              # double 1.0007999999999999
.LCPI5_7:
	.quad	0xbff003afb7e90ff9              # double -1.0008999999999999
.LCPI5_8:
	.quad	0x3ff004189374bc6a              # double 1.0009999999999999
.LCPI5_9:
	.quad	0x3ff004816f0068dc              # double 1.0011000000000001
.LCPI5_10:
	.quad	0x3ff004ea4a8c154d              # double 1.0012000000000001
.LCPI5_11:
	.quad	0x3ff005532617c1be              # double 1.0013000000000001
.LCPI5_12:
	.quad	0x3ff0000000000000              # double 1
	.text
	.globl	complex.matrix_exponentiation
	.p2align	2
	.type	complex.matrix_exponentiation,@function
complex.matrix_exponentiation:          # @complex.matrix_exponentiation
	.cfi_startproc
# %bb.0:                                # %entry
	addi	sp, sp, -96
	.cfi_def_cfa_offset 96
	sw	ra, 92(sp)                      # 4-byte Folded Spill
	sw	s0, 88(sp)                      # 4-byte Folded Spill
	.cfi_offset ra, -4
	.cfi_offset s0, -8
	addi	s0, sp, 96
	.cfi_def_cfa s0, 0
	sw	a6, -88(s0)
	sw	a7, -84(s0)
	fld	ft0, -88(s0)
	sw	a4, -88(s0)
	sw	a5, -84(s0)
	fld	ft1, -88(s0)
	sw	a2, -88(s0)
	sw	a3, -84(s0)
	fld	ft2, -88(s0)
	sw	a0, -88(s0)
	sw	a1, -84(s0)
	fld	ft3, -88(s0)
	fsd	ft3, -16(s0)
	fsd	ft2, -24(s0)
	fsd	ft1, -32(s0)
	fsd	ft0, -40(s0)
	lui	a0, 261888
	sw	a0, -44(s0)
	sw	zero, -48(s0)
	sw	zero, -52(s0)
	sw	zero, -56(s0)
	sw	zero, -60(s0)
	sw	zero, -64(s0)
	sw	a0, -68(s0)
	lui	a0, %hi(.LCPI5_0)
	fld	ft0, %lo(.LCPI5_0)(a0)
	lui	a0, %hi(.LCPI5_1)
	fld	ft1, %lo(.LCPI5_1)(a0)
	lui	a0, %hi(.LCPI5_2)
	fld	ft2, %lo(.LCPI5_2)(a0)
	lui	a0, %hi(.LCPI5_3)
	fld	ft3, %lo(.LCPI5_3)(a0)
	lui	a0, %hi(.LCPI5_4)
	fld	ft4, %lo(.LCPI5_4)(a0)
	lui	a0, %hi(.LCPI5_5)
	fld	ft5, %lo(.LCPI5_5)(a0)
	lui	a0, %hi(.LCPI5_6)
	fld	ft6, %lo(.LCPI5_6)(a0)
	lui	a0, %hi(.LCPI5_7)
	fld	ft7, %lo(.LCPI5_7)(a0)
	lui	a0, %hi(.LCPI5_8)
	fld	fa0, %lo(.LCPI5_8)(a0)
	lui	a0, %hi(.LCPI5_9)
	fld	fa1, %lo(.LCPI5_9)(a0)
	lui	a0, %hi(.LCPI5_10)
	fld	fa2, %lo(.LCPI5_10)(a0)
	lui	a0, %hi(.LCPI5_11)
	fld	fa3, %lo(.LCPI5_11)(a0)
	lui	a0, %hi(.LCPI5_12)
	fld	fa4, %lo(.LCPI5_12)(a0)
	sw	zero, -72(s0)
	sw	zero, -76(s0)
	sw	zero, -80(s0)
.LBB5_1:                                # %cond
                                        # =>This Inner Loop Header: Depth=1
	fld	fa5, -80(s0)
	fld	fa6, 0(s0)
	flt.d	a0, fa5, fa6
	beqz	a0, .LBB5_3
# %bb.2:                                # %for-true
                                        #   in Loop: Header=BB5_1 Depth=1
	mv	a0, sp
	addi	sp, a0, -16
	fld	fa5, -48(s0)
	fld	fa6, -16(s0)
	fld	fa7, -56(s0)
	fld	ft8, -32(s0)
	fmul.d	fa5, fa5, fa6
	fmul.d	fa6, fa7, ft8
	fadd.d	fa5, fa5, fa6
	fsd	fa5, -16(a0)
	mv	a1, sp
	addi	sp, a1, -16
	fld	fa5, -48(s0)
	fld	fa6, -24(s0)
	fld	fa7, -56(s0)
	fld	ft8, -40(s0)
	fmul.d	fa5, fa5, fa6
	fmul.d	fa6, fa7, ft8
	fadd.d	fa5, fa5, fa6
	fsd	fa5, -16(a1)
	mv	a2, sp
	addi	sp, a2, -16
	fld	fa5, -64(s0)
	fld	fa6, -16(s0)
	fld	fa7, -72(s0)
	fld	ft8, -32(s0)
	fmul.d	fa5, fa5, fa6
	fmul.d	fa6, fa7, ft8
	fadd.d	fa5, fa5, fa6
	fsd	fa5, -16(a2)
	mv	a3, sp
	addi	sp, a3, -16
	fld	fa5, -64(s0)
	fld	fa6, -24(s0)
	fld	fa7, -72(s0)
	fld	ft8, -40(s0)
	fmul.d	fa5, fa5, fa6
	fmul.d	fa6, fa7, ft8
	fld	fa7, -16(a0)
	fld	ft8, -16(a1)
	fadd.d	fa5, fa5, fa6
	fsd	fa5, -16(a3)
	fmul.d	fa5, fa7, ft0
	fdiv.d	fa6, ft8, ft1
	fld	fa7, -16(a1)
	fadd.d	fa5, fa5, fa6
	fmul.d	fa5, fa5, ft2
	fsd	fa5, -16(a0)
	fmul.d	fa6, fa7, ft3
	fdiv.d	fa5, fa5, ft4
	fadd.d	fa5, fa6, fa5
	fld	fa6, -16(a2)
	fld	fa7, -16(a3)
	fmul.d	fa5, fa5, ft5
	fsd	fa5, -16(a1)
	fmul.d	fa5, fa6, ft6
	fdiv.d	fa6, fa7, ft7
	fld	fa7, -16(a3)
	fadd.d	fa5, fa5, fa6
	fmul.d	fa5, fa5, fa0
	fsd	fa5, -16(a2)
	fmul.d	fa6, fa7, fa1
	fdiv.d	fa5, fa5, fa2
	fld	fa7, -16(a0)
	fadd.d	fa5, fa6, fa5
	fmul.d	fa5, fa5, fa3
	fsd	fa5, -16(a3)
	fsd	fa7, -48(s0)
	fld	fa5, -16(a1)
	fld	fa6, -16(a2)
	fld	fa7, -16(a3)
	fld	ft8, -80(s0)
	fsd	fa5, -56(s0)
	fsd	fa6, -64(s0)
	fsd	fa7, -72(s0)
	fadd.d	fa5, ft8, fa4
	fsd	fa5, -80(s0)
	j	.LBB5_1
.LBB5_3:                                # %or-else
	lui	a0, %hi(40)
	addi	a0, a0, %lo(40)
	lui	a1, %hi(41)
	addi	a1, a1, %lo(41)
	mv	a2, sp
	addi	sp, a2, -16
	li	a3, 34
	sw	a3, -16(a2)
	sw	a1, -12(a2)
	call	printf@plt
	fld	ft0, -48(s0)
	lui	a0, %hi(42)
	addi	a0, a0, %lo(42)
	fsd	ft0, -88(s0)
	lw	a2, -88(s0)
	lw	a3, -84(s0)
	call	printf@plt
	fld	ft0, -56(s0)
	lui	a0, %hi(43)
	addi	a0, a0, %lo(43)
	fsd	ft0, -88(s0)
	lw	a2, -88(s0)
	lw	a3, -84(s0)
	call	printf@plt
	fld	ft0, -64(s0)
	lui	a0, %hi(44)
	addi	a0, a0, %lo(44)
	fsd	ft0, -88(s0)
	lw	a2, -88(s0)
	lw	a3, -84(s0)
	call	printf@plt
	fld	ft0, -72(s0)
	lui	a0, %hi(45)
	addi	a0, a0, %lo(45)
	fsd	ft0, -88(s0)
	lw	a2, -88(s0)
	lw	a3, -84(s0)
	call	printf@plt
	fld	ft0, -48(s0)
	fld	ft1, -56(s0)
	fld	ft2, -64(s0)
	fld	ft3, -72(s0)
	fadd.d	ft0, ft0, ft1
	fadd.d	ft0, ft0, ft2
	fadd.d	ft0, ft0, ft3
	fsd	ft0, -88(s0)
	lw	a0, -88(s0)
	lw	a1, -84(s0)
	addi	sp, s0, -96
	lw	ra, 92(sp)                      # 4-byte Folded Reload
	lw	s0, 88(sp)                      # 4-byte Folded Reload
	addi	sp, sp, 96
	ret
.Lfunc_end5:
	.size	complex.matrix_exponentiation, .Lfunc_end5-complex.matrix_exponentiation
	.cfi_endproc
                                        # -- End function
	.type	0,@object                       # @"0"
	.section	.rodata,"a",@progbits
0:
	.asciz	"%s\n"
	.size	0, 4

	.type	1,@object                       # @"1"
1:
	.asciz	"Complex Cases"
	.size	1, 14

	.type	2,@object                       # @"2"
2:
	.asciz	"%s\n"
	.size	2, 4

	.type	3,@object                       # @"3"
3:
	.asciz	"1. Factorial"
	.size	3, 13

	.type	4,@object                       # @"4"
4:
	.asciz	"%f\n"
	.size	4, 4

	.type	5,@object                       # @"5"
5:
	.asciz	"%s\n"
	.size	5, 4

	.type	6,@object                       # @"6"
6:
	.asciz	"Matrix Multiply"
	.size	6, 16

	.type	7,@object                       # @"7"
7:
	.asciz	"%s\n"
	.size	7, 4

	.type	8,@object                       # @"8"
8:
	.asciz	"Matrix A:"
	.size	8, 10

	.type	9,@object                       # @"9"
9:
	.asciz	"%f\n"
	.size	9, 4

	.type	10,@object                      # @"10"
10:
	.asciz	"%f\n"
	.size	10, 4

	.type	11,@object                      # @"11"
11:
	.asciz	"%f\n"
	.size	11, 4

	.type	12,@object                      # @"12"
12:
	.asciz	"%f\n"
	.size	12, 4

	.type	13,@object                      # @"13"
13:
	.asciz	"%s\n"
	.size	13, 4

	.type	14,@object                      # @"14"
14:
	.asciz	"Matrix B:"
	.size	14, 10

	.type	15,@object                      # @"15"
15:
	.asciz	"%f\n"
	.size	15, 4

	.type	16,@object                      # @"16"
16:
	.asciz	"%f\n"
	.size	16, 4

	.type	17,@object                      # @"17"
17:
	.asciz	"%f\n"
	.size	17, 4

	.type	18,@object                      # @"18"
18:
	.asciz	"%f\n"
	.size	18, 4

	.type	19,@object                      # @"19"
19:
	.asciz	"%s\n"
	.size	19, 4

	.type	20,@object                      # @"20"
	.p2align	4
20:
	.asciz	"Resultant Matrix C:"
	.size	20, 20

	.type	21,@object                      # @"21"
21:
	.asciz	"%f\n"
	.size	21, 4

	.type	22,@object                      # @"22"
22:
	.asciz	"%f\n"
	.size	22, 4

	.type	23,@object                      # @"23"
23:
	.asciz	"%f\n"
	.size	23, 4

	.type	24,@object                      # @"24"
24:
	.asciz	"%f\n"
	.size	24, 4

	.type	25,@object                      # @"25"
25:
	.asciz	"%s\n"
	.size	25, 4

	.type	26,@object                      # @"26"
	.p2align	4
26:
	.asciz	"3. Euler's Number Approximation"
	.size	26, 32

	.type	27,@object                      # @"27"
27:
	.asciz	"%s\n"
	.size	27, 4

	.type	28,@object                      # @"28"
28:
	.asciz	"Computed e:"
	.size	28, 12

	.type	29,@object                      # @"29"
29:
	.asciz	"%f\n"
	.size	29, 4

	.type	30,@object                      # @"30"
30:
	.asciz	"%s\n"
	.size	30, 4

	.type	31,@object                      # @"31"
	.p2align	4
31:
	.asciz	"4. Intensive Floating-Point Computation"
	.size	31, 40

	.type	32,@object                      # @"32"
32:
	.asciz	"%s\n"
	.size	32, 4

	.type	33,@object                      # @"33"
	.p2align	4
33:
	.asciz	"Final Computed Values:"
	.size	33, 23

	.type	34,@object                      # @"34"
34:
	.asciz	"%f\n"
	.size	34, 4

	.type	35,@object                      # @"35"
35:
	.asciz	"%f\n"
	.size	35, 4

	.type	36,@object                      # @"36"
36:
	.asciz	"%f\n"
	.size	36, 4

	.type	37,@object                      # @"37"
37:
	.asciz	"%f\n"
	.size	37, 4

	.type	38,@object                      # @"38"
38:
	.asciz	"%s\n"
	.size	38, 4

	.type	39,@object                      # @"39"
	.p2align	4
39:
	.asciz	"6. Matrix Exponentiation"
	.size	39, 25

	.type	40,@object                      # @"40"
40:
	.asciz	"%s\n"
	.size	40, 4

	.type	41,@object                      # @"41"
	.p2align	4
41:
	.asciz	"Final Matrix After Exponentiation:"
	.size	41, 35

	.type	42,@object                      # @"42"
42:
	.asciz	"%f\n"
	.size	42, 4

	.type	43,@object                      # @"43"
43:
	.asciz	"%f\n"
	.size	43, 4

	.type	44,@object                      # @"44"
44:
	.asciz	"%f\n"
	.size	44, 4

	.type	45,@object                      # @"45"
45:
	.asciz	"%f\n"
	.size	45, 4

	.section	".note.GNU-stack","",@progbits
