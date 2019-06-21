.extern printf
.extern getch

.global change
change:
	FSTCW		mem
	MOVW		mem,	%AX
	ANDW		$64767,	%AX
	MOVW		%AX,	mem
	FLDCW		mem
	FSTCW		mem
	MOVW		mem,	%AX
RET
.data

mem:	.word 0

.global ptc
ptc:
	PUSHL		%EBP
	MOVL		%ESP,		%EBP
	PUSHA
#--------------------------------------------------------------	

	

	MOVL		8(%EBP),	%EBX

	MOVL		$0,		%edx
	MOVL		%EDX,		BBB
STR:
	MOVL		BBB,		%EDX
	CMP		$32,		%edx
	JE		WYJ			
	
	SAL		%EBX	
	JB		JEDEN
	
	MOVL		$0,		%EAX
	ADDL		$48,		%EAX	
	
	PUSHL		%EAX
	PUSHL		$ SSS
	CALL		printf
	ADDL		$ 8,		%ESP	
	
WBC:
	MOVL		BBB,		%EDX
	INC		%edx
	MOVL		%EDX,		BBB
	JMP		STR

#--------------------------------------------------------------	
WYJ:

	POPA
	MOVL		%EBP,	%ESP
	POP		%EBP


RET

.data
BBB:	.long 0
SSS:	.ASCIZ "%c"

JEDEN:
	MOVL		$1,		%EAX
	ADDL		$48,		%EAX
	PUSHL		%EAX
	PUSHL		$ SSS
	CALL		printf
	ADDL		$ 8,		%ESP			

	JMP	WBC






.global pta
pta:
	PUSHL		%EBP
	MOVL		%ESP,		%EBP
	PUSHA
#--------------------------------------------------------------	

	

	MOVL		12(%EBP),	%EBX

	MOVL		$0,		%edx
	MOVL		%EDX,		BBB
STRa:
	MOVL		BBB,		%EDX
	CMP		$32,		%edx
	JE		WYJ			
	
	SAL		%EBX	
	JB		JEDENa
	
	MOVL		$0,		%EAX
	ADDL		$48,		%EAX	
	
	PUSHL		%EAX
	PUSHL		$ SSS
	CALL		printf
	ADDL		$ 8,		%ESP	
	
WBCa:
	MOVL		BBB,		%EDX
	INC		%edx
	MOVL		%EDX,		BBB
	JMP		STRa

#--------------------------------------------------------------	
WYJa:

	POPA
	MOVL		%EBP,	%ESP
	POP		%EBP


RET


JEDENa:
	MOVL		$1,		%EAX
	ADDL		$48,		%EAX
	PUSHL		%EAX
	PUSHL		$ SSS
	CALL		printf
	ADDL		$ 8,		%ESP			

	JMP	WBCa
