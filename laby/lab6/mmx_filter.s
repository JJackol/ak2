.data
_size:
	.long 0
koniec:
	.long 0
zeros:
	.space 8, 0
init_mm0:
	.8byte 0x0400040004000400
	// poczatkowa wartość 1024 do kazdego slowa(16bit) w mmx0 

.text
.type Filter, @function
.global Filter, my_timer

Filter:
	push %ebp
	movl %esp, %ebp

	pushl %ebx
	pushl %ecx
	pushl %esi
	pushl %edi

	movl 16(%ebp), %eax
	mull 20(%ebp)
	movl %eax, _size

	movl 8(%ebp), %ebx
	movl _size, %edi
	leal (%ebx, %edi, 1), %eax
	movl %eax, koniec				;// pierwsza komórka poza zakresem

	movl 8(%ebp), %edx
	movl $0, %eax
	leal 2(%edx,%eax, 1), %ebx		;//1. row
	addl 16(%ebp), %eax	
	leal 2(%edx, %eax, 1), %ecx		;//2. row
	addl 16(%ebp), %eax		
	leal 2(%edx, %eax, 1), %edi		;//3. row


	movl 12(%ebp), %edx
	movl 16(%ebp), %eax				;// width -> eax
	leal 1(%edx, %eax, 1), %esi		;//output row
loop_w:
	movq init_mm0, %mm0
	
	movd -2(%ebx), %mm1
	punpcklbw zeros, %mm1
	psubw %mm1, %mm0
	
	movd 0(%ebx), %mm2
	punpcklbw zeros, %mm2
	paddw %mm2, %mm0
	
	movd -2(%ecx), %mm3
	punpcklbw zeros, %mm3
	psubw %mm3, %mm0
	psubw %mm3, %mm0
	
	movd 0(%ecx), %mm4
	punpcklbw zeros, %mm4
	paddw %mm4, %mm0
	paddw %mm4, %mm0
	
	movd -2(%edi), %mm5
	punpcklbw zeros, %mm5
	psubw %mm5, %mm0
	
	movd 0(%edi), %mm6
	punpcklbw zeros, %mm6
	paddw %mm6, %mm0
	
	psrlw $3, %mm0
	
	packuswb zeros, %mm0
	movd %mm0, (%esi)

	addl $4, %ebx
	addl $4, %ecx
	addl $4, %edi
	addl $4, %esi

	cmp %edi, koniec
	jge loop_w

	popl %edi
	popl %esi
	popl %ecx
	popl %ebx
	leave
	ret


//
// timer do pomiaru czasu
//
	.type my_timer, @function
my_timer:

	pushl %ebx
	pushl %ecx
	xorl %eax, %eax
	cpuid
	rdtsc

	popl %ecx
	popl %ebx
	ret
