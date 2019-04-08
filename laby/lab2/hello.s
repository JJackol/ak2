	EXIT_NR  = 1
	READ_NR  = 3
	WRITE_NR = 4

	STDOUT = 1
	STDIN = 0
	EXIT_CODE_SUCCESS = 0

.data

buffer: 
	.space 1024 
dataL:
	.space 4
buff_out: 
	.space 1024 

war_next:
	.space 4

.bss
	
	.lcomm in_bytes , 1024 

.text


.global _start

_start:
	
	#wczytaj bajty 
next:
		
	movl $READ_NR, %eax 
	movl $STDIN  , %ebx 
	movl $buffer	, %ecx 
	movl $1024  , %edx 
	int $0x80
	movl %eax	,	%ecx

	#sprawdz czy trzeba powtorzyc buforowanie
	movl $0	,	war_next
	subl $1024	,	%eax
	jne dont_buffer_again
	movl $1, war_next
dont_buffer_again:

	#zmiaana znakow
	#movl dataL	, %ecx
	movl $0	,	%esi
	movl $0	,	%edi

#zamienia znaki w petli
zamien:
	movb buffer(%esi) , %bl
	cmpb $'a' , %bl
	jl	end
	cmpb $'z'	,%bl
	jg end
	
	subb $32	,	%bl
	movb %bl	,	buff_out(%edi)
	incl %edi

end:
	incl %esi

	#decl %ecx
#skook petli zamieniajacej male na duze
	loop zamien


	movl $WRITE_NR, %eax 
	movl $STDOUT  , %ebx 
	movl $buff_out     , %ecx 
	movl %edi  , %edx 
	int $0x80

	cmpb $1	,	war_next
#skok petli buforujacej
	je next

	movl $EXIT_NR          , %eax
	movl $EXIT_CODE_SUCCESS, %ebx 
	int $0x80

