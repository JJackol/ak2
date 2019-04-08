import matplotlib.pyplot as plt
#import matplotlib

import numpy as np
from sys import argv

my_data = np.genfromtxt("../czasy_do_wykresu.csv", delimiter=',')
print(my_data)

plt.plot(my_data[:,0], my_data[:,2])
plt.ylabel('czas [s]')
plt.xlabel('liczba bitów argumentu')
plt.title('Czas 500 mnozeń')
plt.savefig("../wykres5x100.png")



