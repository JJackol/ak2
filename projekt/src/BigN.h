#ifndef BIGN_H
#define BIGN_H
#include <string>
#include <fstream>

class BigN
{
    public:
        BigN(unsigned int _s=8);
        BigN(BigN &a);
        BigN(BigN &&a);
        BigN(std::string dec , unsigned int _s = 8);
        virtual ~BigN();
        BigN& operator=(const BigN& a);
        void print_hex();
		void print_hex(const std::ofstream of );
		std::string to_string_hex();

        unsigned int size(){return s;};

        friend BigN u_mul(BigN x, BigN y);

    protected:

    private:
        unsigned int * tab; //tablica przechowująca binarna reprezentacje dużej liczby. Konwencja litle endian, najmlodszy bit na najmlodszej pozycji tab[0]
        unsigned int s;
        void get_dec(std::string &dec);
        void set_bit(int ind);


};

void divideS_by_2(std::string &dec);
bool is_s_zeros(std::string dec);
BigN u_mul(BigN x, BigN y);
#endif // BIGN_H
