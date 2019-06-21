	EXIT_NR  = 1
	READ_NR  = 3
	WRITE_NR = 4

	STDOUT = 1
	EXIT_CODE_SUCCESS = 0

.data
endl:
	.ascii "\n\0"

s_contr: 
	.ascii "%d\0"
s_contr2: 
	.ascii "control w: %x \n\0"
control_word:
	.space 2
single_prec:
	.float 4

.text

.global set_control

set_control:

	pushl %ebp
	movl %esp, %ebp
	movw 8(%ebp), %ax
	movw %ax, control_word

	fldcw control_word

	leave
	ret

.global flagi

flagi:

	pushl %ebp
	movl %esp, %ebp
	xorl %eax, %eax

	fstsw

	push %eax
	leave
	ret

.global clear

clear:

	pushl %ebp
	movl %esp, %ebp

	fnclex

	leave
	ret

.global show_control

show_control:

	pushl %ebp
	movl %esp, %ebp

	fnstcw control_word
	movl control_word, %eax

	leave
	ret

.global operation

operation:
	pushl %ebp
	movl %esp, %ebp
	pushl %ebx
	pushl %ecx

	movl 8(%ebp), %eax
	movl %eax, single_prec
	flds single_prec
	
	fadds 12(%ebp)
	fsts single_prec
	movl single_prec, %eax

	movl $32, %ecx
	movl $0 , %edx
	movl $2, %ebx
loop1:
	movl $2, %ebx
	idivl %ebx
	pushl %eax
	pushl %ecx

	pushl %edx
	pushl $s_contr
	call printf
	addl $8, %esp

	popl %ecx
	popl %eax
	movl $0 , %edx
	loop loop1

	pushl $endl
	call printf
	addl $4, %esp

	popl %ecx
	popl %ebx
	leave

	ret
	
