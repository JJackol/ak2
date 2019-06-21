	.file	"filter.c"
	.text
.globl Filter
	.type	Filter, @function
Filter:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$16, %esp
	movl	$0, -4(%ebp)
	jmp	.L2
.L5:
	movl	$0, -8(%ebp)
	jmp	.L3
.L4:
	movl	-8(%ebp), %eax
	imull	16(%ebp), %eax
	addl	-4(%ebp), %eax
	addl	12(%ebp), %eax
	movl	-8(%ebp), %edx
	imull	16(%ebp), %edx
	addl	-4(%ebp), %edx
	addl	8(%ebp), %edx
	movzbl	(%edx), %edx
	movb	%dl, (%eax)
	addl	$1, -8(%ebp)
.L3:
	movl	-8(%ebp), %eax
	cmpl	20(%ebp), %eax
	jl	.L4
	addl	$1, -4(%ebp)
.L2:
	movl	-4(%ebp), %eax
	cmpl	16(%ebp), %eax
	jl	.L5
	movl	$0, -4(%ebp)
	jmp	.L6
.L7:
	movl	16(%ebp), %eax
	addl	$1, %eax
	imull	-4(%ebp), %eax
	addl	12(%ebp), %eax
	movb	$0, (%eax)
	addl	$1, -4(%ebp)
.L6:
	cmpl	$99, -4(%ebp)
	jle	.L7
	leave
	ret
	.size	Filter, .-Filter
	.ident	"GCC: (Ubuntu 4.4.3-4ubuntu5.1) 4.4.3"
	.section	.note.GNU-stack,"",@progbits
