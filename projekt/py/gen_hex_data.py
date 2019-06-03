#!/usr/bin/env python3
from random import randint

print('hello')

file = open('../test1.txt' , 'w' )

nr_of_sizes = 50 

nr_of_input = 100


#random range [a, b]
#bits = 256
init_bits = 1024
#bits = 8192
#bits = 32768



file.write( str(nr_of_sizes) )
file.write( '\n' )
file.write( str(nr_of_input) )
file.write( '\n' )

file.write( str(init_bits) )
file.write( '\n' )

for j in range(nr_of_sizes):
    bits = init_bits*(j+1)
    a = 2**(bits-30)
    b = 2**bits - 1
    
    for i in range(2*nr_of_input):
        x = randint(a, b)
        file.write( str(hex(x)) )
        file.write( '\n' )
        
file.close()


