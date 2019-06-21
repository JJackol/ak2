AS_FLAGS= --32 -g 
LD_FLAGS= -m elf_i386

all: lab3

lab3: lab3.o
	ld $(LD_FLAGS) lab3.o -o lab3

lab3.o: lab3.s
	as $(AS_FLAGS) lab3.s -o lab3.o

clean: 
	rm *.o lab3


