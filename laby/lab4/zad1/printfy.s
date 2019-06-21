	EXIT_NR  = 1
	READ_NR  = 3
	WRITE_NR = 4

	STDOUT = 1
	EXIT_CODE_SUCCESS = 0


.data

format_string_in:
	.ascii "%d %s"
format_string_out:
	.ascii "int = %d , string = %s\n\0"
.bss
	
buffer:
	.space 100
my_int:
	.space 4

.text
	msg: .ascii "Hello, world!\n"
	msgLen = . - msg


.global main

.type main, @function
main:

	pushl %ebp
	movl %esp, %ebp

	pushl $buffer
	pushl $my_int 
	pushl $format_string_in

	call scanf

	addl $12, %esp

	pushl $buffer
	pushl my_int 
	pushl $format_string_out
	
	call printf
	addl $12, %esp

	#movl %ebp, %esp
	#popl %ebp
	leave
	movl $0, %eax
	ret

