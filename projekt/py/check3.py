#!/usr/bin/env python3
from random import randint

print('testuje poprawnosc...')

file_in = open('../test1.txt' , 'r' )
results = open('../res3.txt' , 'r' )
bits = int( file_in.readline() )
i = int( file_in.readline() )
flag_w = 0

for x in range(i):
	a = int(file_in.readline())
	b = int(file_in.readline())
	r = int(results.readline(), base=16)
	if a*b == r:
		print( x, " good ", r)
	else:
		print( x, " bad ", r)
		flag_w += 1;


print("mnozenie bits= ", bits)
print("wrong : ", flag_w)
file_in.close()
results.close()

