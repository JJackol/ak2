#!/usr/bin/env python3
from random import randint

print('hello')

file = open('../test1.txt' , 'w' )

size = 200
file.write( str(size) )
file.write( '\n' )

x = 2**256 - 1

for i in range(2*size):
	x = randint(1, 2**244)
	file.write( str(x) )
	file.write( '\n' )
file.close()


