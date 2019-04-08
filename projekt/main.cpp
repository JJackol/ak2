#include <iostream>
#include "include/BigN.h"

using namespace std;

int main()
{
    cout << "Mnożenie" << endl;
    //przykładowe dane
    BigN * a = new BigN("1234567890123456789012345678901234567890");
    BigN * b = new BigN("1234567890123456789012345678901234567890");
    //spodziewany wynik
    BigN * c = new BigN("1524157875323883675049535156256668194500533455762536198787501905199875019052100", 16);

    a->print_hex();
    b->print_hex();
    cout<<"spodziewany wynik :  ";
    c->print_hex();

    BigN res = u_mul(*a,*b);
    cout<<"wlasciwy wynik :     ";
    res.print_hex();

    delete a;
    delete b;
    delete c;
    return 0;
}
