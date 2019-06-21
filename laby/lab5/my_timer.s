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

