#include <iostream>
#include <cmath>
#include "BigN.h"
#include "testy.h"

using namespace std;



int main()
{
    cout << "Mnożenie " <<sizeof(int)<< endl;
    //przykładowe dane
    BigN * a = new BigN("1234567890123456789012345678901234567890");
    BigN * b = new BigN("1234567890123456789012345678901234567890");
    //spodziewany wynik
    BigN * c = new BigN("1524157875323883675049535156256668194500533455762536198787501905199875019052100", 16);
//    cout << "M 12357 " ;
//    BigN * e = new BigN("1524157875323883675049535156256668194500533455762536198787501905199875019052100", 0);
//    cout << "M 0 " ;
	BigN * d = new BigN("0", 0);
//    delete d;
//    cout << "M 16 " ;
//	d = new BigN("16", 0);
//    delete d;
//    cout << "M 15 " ;
//	d = new BigN("15", 0);
//    delete d;
//    cout << "M 256 " ;
//	d = new BigN("256", 0);
//    delete d;
//    cout << "M 255 " ;
//    d = new BigN("255", 0);
//    delete d;
//	cout << "Max uint " ;
//    d = new BigN("4294967295", 0);
//    delete d;


    a->print_hex();
    b->print_hex();
    cout<<d->to_string_hex()<<endl;
    cout<<"spodziewany wynik :  ";
    c->print_hex();

    BigN res = u_mul(*a,*b);
    cout<<"wlasciwy wynik :     "<<res.to_string_hex()<<endl;

    //res.print_hex();

    delete a;
    delete b;
    delete c;

    test1();

    return 0;
}
