	EXIT_NR  = 1
	READ_NR  = 3
	WRITE_NR = 4

	STDOUT = 1
	EXIT_CODE_SUCCESS = 0


.text


.global my_func
	.type my_func, @function
my_func:

	pushl %ebx
	pushl %ecx
	xorl %eax, %eax
	cpuid
	rdtsc

	popl %ecx
	popl %ebx
	ret

