	.file	1 ""
	.section .mdebug.abi32
	.previous
	.nan	legacy
#	.module	fp=32
	.module	nooddspreg
	.abicalls
#	.section	.rodata.str1.4,"aMS",@progbits,1
#	.align	2
$LC0:
#	.ascii	"Hello, World!\000"
#	.section	.text.startup,"ax",@progbits
#	.align	2
	.globl	main
	.set	nomips16
	.set	nomicromips
	.ent	main
#	.type	main, @function
main:
	.frame	$sp,32,$31		# vars= 0, regs= 1/0, args= 16, gp= 8
	.mask	0x80000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	nomacro
#	lw	$5,%got($LC0)($28)
	addiu	$sp,$sp,-32
#	lw	$25,%call16(__printf_chk)($28)
#	addiu	$5,$5,%lo($LC0)
	sw	$31,28($sp)
	movz	$31,$31,$0
	.cprestore	16
	.reloc	1f,R_MIPS_JALR,__printf_chk
#1:	jalr	$25
	li	$4,1			# 0x1

	lw	$31,28($sp)
	move	$2,$0
#	j	$31
	addiu	$sp,$sp,32

	.set	macro
	.set	reorder
	.end	main
	.size	main, .-main
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.9) 5.4.0 20160609"