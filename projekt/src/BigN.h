#ifndef BIGN_H
#define BIGN_H
#include <string>
#include <fstream>

class BigN
{
	private:
        unsigned int * tab; //tablica przechowująca binarna reprezentacje dużej liczby. Konwencja litle endian, najmlodszy bit na najmlodszej pozycji tab[0]
        unsigned int s;
    public:
        BigN(unsigned int _s=8);
        BigN(BigN &a);
        BigN(BigN &&a);
        BigN(std::string dec , unsigned int _s = 8, char base='d');
        virtual ~BigN();
        BigN& operator=(const BigN& a);

        unsigned int size(){return s;};

        friend BigN u_mul(BigN x, BigN y);

        void get_dec(std::string &dec);
        void set_bit(int ind);

        void print_hex();
		void print_hex(const std::ofstream of );
		std::string to_string_hex();

};

	void divideS_by_2(std::string &dec);
	bool is_s_zeros(std::string dec);
	BigN u_mul(BigN x, BigN y);
#endif // BIGN_H
