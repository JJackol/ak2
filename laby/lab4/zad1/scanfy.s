	EXIT_NR  = 1
	READ_NR  = 3
	WRITE_NR = 4

	STDOUT = 1
	EXIT_CODE_SUCCESS = 0


.data

format_string_in:
	.ascii "%d %s\0"
format_string_out:
	.ascii "int = %d , string = %s blablabla\n\0"
buffer:
	.space 100
.bss
	
my_int:
	.space 4

.text
	msg: .ascii "Hello, world!\n\0"
	msgLen = . - msg


.global _start

.type _start, @function
_start:


	pushl $buffer
	pushl $my_int 
	pushl $format_string_in

	call scanf

	addl $12, %esp

	pushl $buffer
	pushl my_int 
	pushl $format_string_out
	
print_:
	call printf
	addl $12, %esp

	#movl %ebp, %esp
	#popl %ebp

	pushl $0
	call exit

pre_end:

	#leave
	xorl %eax, %eax
	ret

