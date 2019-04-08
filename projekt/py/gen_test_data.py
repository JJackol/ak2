#!/usr/bin/env python3
from random import randint

print('hello')

file = open('../test1.txt' , 'w' )

size = 5


#random range [a, b]
#bits = 256
bits = 1024*7
#bits = 8192
#bits = 32768

a = 2**(bits-16)
b = 2**bits - 1

file.write( str(bits) )
file.write( '\n' )
file.write( str(size) )
file.write( '\n' )

for i in range(2*size):
	x = randint(a, b)
	file.write( str(x) )
	file.write( '\n' )
file.close()


