
all: fpu

fpu: fp_test.c my_timer.s control.s
	gcc fp_test.c my_timer.s control.s -m32 -Wall -o fpu


clean: 
	rm *.o fpu

