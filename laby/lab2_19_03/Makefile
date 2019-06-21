AS_FLAGS= --32 -g 
LD_FLAGS= -m elf_i386

all: hello

hello: hello.o
	ld $(LD_FLAGS) hello.o -o hello

hello.o: hello.s
	as $(AS_FLAGS) hello.s -o hello.o

clean: 
	rm *.o hello


