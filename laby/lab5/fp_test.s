	.file	"fp_test.c"
	.section	.rodata
.LC2:
	.string	"%f\n"
.LC5:
	.string	"%70.70f\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	leal	4(%esp), %ecx
	.cfi_def_cfa 1, 0
	andl	$-16, %esp
	pushl	-4(%ecx)
	pushl	%ebp
	.cfi_escape 0x10,0x5,0x2,0x75,0
	movl	%esp, %ebp
	pushl	%ecx
	.cfi_escape 0xf,0x3,0x75,0x7c,0x6
	subl	$36, %esp
	call	show_control
	call	clear
	fld1
	fstps	-32(%ebp)
	fldz
	fstps	-28(%ebp)
	flds	-32(%ebp)
	fdivs	-28(%ebp)
	fstps	-24(%ebp)
	flds	-24(%ebp)
	subl	$4, %esp
	leal	-8(%esp), %esp
	fstpl	(%esp)
	pushl	$.LC2
	call	printf
	addl	$16, %esp
	call	flagi
	flds	.LC3
	fstps	-20(%ebp)
	flds	.LC3
	fstps	-16(%ebp)
	call	clear
	flds	-20(%ebp)
	fmuls	-16(%ebp)
	fstps	-12(%ebp)
	call	flagi
	flds	-12(%ebp)
	subl	$4, %esp
	leal	-8(%esp), %esp
	fstpl	(%esp)
	pushl	$.LC2
	call	printf
	addl	$16, %esp
	call	clear
	flds	.LC4
	fstps	-20(%ebp)
	flds	.LC4
	fstps	-16(%ebp)
	flds	-20(%ebp)
	fadds	-16(%ebp)
	fstps	-12(%ebp)
	flds	-12(%ebp)
	subl	$4, %esp
	leal	-8(%esp), %esp
	fstpl	(%esp)
	pushl	$.LC5
	call	printf
	addl	$16, %esp
	call	flagi
	movl	$0, %eax
	movl	-4(%ebp), %ecx
	.cfi_def_cfa 1, 0
	leave
	.cfi_restore 5
	leal	-4(%ecx), %esp
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.section	.rodata
	.align 4
.LC3:
	.long	2122317568
	.align 4
.LC4:
	.long	8388608
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.11) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
