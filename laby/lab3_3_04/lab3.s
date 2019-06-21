pocz:
	EXIT_NR  = 1
	READ_NR  = 3
	WRITE_NR = 4

	STDOUT = 1
	STDIN = 0
	EXIT_CODE_SUCCESS = 0

	buffer_size=255
	out_buffer_size=615
.data

buffer: 
	.space buffer_size, 0 
#buffer przechowuje wejsciowy blok danych oraz kolejne ilorazy dzielenia wielobajtowego

dataL:
	.space 4
buff_out: 
	.space out_buffer_size 
#buffer przygotowany na cyfry wyjsciowe
#1 bajt na jedna cyfre
#rozmiar = ceil ( log_10(256^255) ) // logarytm dzisietny z maksymalnej mozliwej wartosci wejscowej

endl:
	.string "\n"

.text

.global _start

_start:
	
	movw $buffer_size	,	%cx
		
	movl $READ_NR, %eax 
	movl $STDIN  , %ebx 
	movl $buffer	, %ecx 
	movl $buffer_size  , %edx 
	int $0x80

	cmp $0 , %eax
	je koniec	#skocz na koniec jeśli wczytano 0 bajtow

	movl $0	,	%edi	#przygotu licznik po docelowej tablicy na rep dziesietna

dziel_pocz:
	movl $0	,	%esi	#wyzeruj indeks(iterator) po bajtach dzielonej liczby
	movb $0	,	%ah		#wyzeruj starszy bajt dzielnej(pojedynczej operacji divb)
	
dzielenie:
	movb buffer(,%esi,1)	,	%al
	mov $10	,	%bx
	divb %bl
	movb %al	,	buffer(,%esi,1)	#wynik pojedynczego dzielenia bajtowego wpisz do buffora

	incl %esi
	cmp $255	,	%esi 
#petla wykonuje dzielenie bajt po bajcie
#skok do dzielenie
	jl dzielenie

#zapisz reszte z dzielenia jako kolejna(idac od najmnlodszej) cyfre reprezentacji dziesietnej
#jedna cyfra na bajt
#konwencja LE (najmlodza cyfra pod indeksem 0)
	movb %ah	,	buff_out(%edi)
	incl %edi	

#petla sprawdzajaca czy wyliczony iloraz (wielobajtowy) nie jest juz zerem
# iloraz ten jest kolejna dzielna przy konwersji
	movl $buffer_size, %esi
zero_check:
	decl %esi
#skok do dziel pocz
	cmpb $0 , buffer(%esi)
	jne dziel_pocz	 #skok do dziel pocz
	cmp $0 , %esi
	jne zero_check

	#petla wypisujaca
wypisz:
	decl %edi
	addb $'0	,	buff_out(%edi)	#dodaj kod ascii zera aby wypisac znaki odpowiadajace cyfrom
	movl $WRITE_NR, %eax 
	movl $STDOUT  , %ebx 
	leal buff_out(%edi)     , %ecx 
	movl $1  , %edx 
	int $0x80

	cmpl $0, %edi
	jne wypisz

#wypisanie konca lini po każdej konwertowanej liczbie
	movl $WRITE_NR, %eax 
	movl $STDOUT  , %ebx 
	movl $endl , %ecx 
	movl $1  , %edx 
	int $0x80

	jmp _start

koniec:
	movl $EXIT_NR          , %eax
	movl $EXIT_CODE_SUCCESS, %ebx 
	int $0x80

