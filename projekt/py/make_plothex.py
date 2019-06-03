import matplotlib.pyplot as plt

import numpy as np
from sys import argv

my_data = np.genfromtxt( '../czasy_hex.csv', delimiter=',' )
print(my_data)

file = open('../test1.txt' , 'r' )
file_o = open('sradnie.txt' , 'w' )

nr_of_sizes = int( file.readline() )
nr_of_input = int( file.readline() )
init_bits = int( file.readline() )
        
file.close()

sizes = np.arange(init_bits, init_bits*nr_of_sizes, init_bits)
avg_czasy = np.array([])

for i in sizes:
    czasy_si = np.array([])
    for row in my_data:
        if row[1] == i:
            czasy_si = np.append( czasy_si, row[2] )
    avg_czasy = np.append( avg_czasy, np.average(czasy_si) )


print(sizes)
print(avg_czasy)
res=  np.vstack((sizes, avg_czasy)).T

file_o.write( "liczba bitów")
file_o.write(",")
file_o.write( "średni czas" )
file_o.write("\n")

print(res)
for rows in res:
    file_o.write( str(int(rows[0])))
    file_o.write(",")
    file_o.write( '{:1.4f}'.format(rows[1])) 
    file_o.write("\n")
    
#np.savetxt(file_o, res, delimiter=',', format="%d,%f")
file_o.close()


plt.plot(sizes, avg_czasy)

plt.ylabel('czas [s]')
plt.xlabel('liczba bitów argumentu')
plt.title('Czas 100 mnozeń')
plt.show()
#plt.savefig("../wyk_hex.png")



