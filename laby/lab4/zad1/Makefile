
AS_FLAGS= --32 --gstabs 
LD_FLAGS= -m elf_i386 -lc -dynamic-linker /usr/lib32/ld-linux.so.2 --library-path=/usr/lib32/

all: scanfy

scanfy: scanfy.o
	ld $(LD_FLAGS) scanfy.o -o scanfy

scanfy.o: scanfy.s
	as $(AS_FLAGS) scanfy.s -o scanfy.o

clean: 
	rm *.o scanfy

