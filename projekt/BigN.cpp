#include "../include/BigN.h"
#include <iostream>
#include <cstdio>
#include <stdexcept>
#include <vector>


BigN::BigN(unsigned int _s) : s(_s)
{
    tab = new unsigned int[s];
    for(unsigned int i=0; i<s; i++)
        tab[i] = 0; //zerowanie wartosci
}

BigN::BigN(BigN &a) : s(a.s)
{
    tab = new unsigned int[s];
    for(int i=0; i<s; i++)
        tab[i] = a.tab[i];
}
BigN::BigN(BigN &&a) : s(a.s)
{
    tab = new unsigned int[s];
    for(int i=0; i<s; i++)
        tab[i] = a.tab[i];
}

BigN::BigN(std::string dec, unsigned int _s) : s(_s)
{
    tab = new unsigned int[s];
    get_dec(dec);

}

BigN::~BigN()
{
    delete[] tab;
}
BigN& BigN:: operator=(BigN& a)
{
    if(this != &a){
        delete[] tab;

        s=a.s;
        tab = new unsigned int[s];

        for(int i=0; i<s; i++)
            tab[i] = a.tab[i]; //kopiowanie wartosci
    }
    return *this;
}

void BigN::get_dec(std::string &dec)
{
    for (char& c : dec){
        if(c<'0' || c>'9')
            throw std::invalid_argument("wczytany ciąg nie jest ciągiem cyfr");
        c-= '0';
    }
    for(int i=0; i<s; i++)
        tab[i] = 0; //zerowanie wartosci

    int ssize = dec.size();
    int i = 0;
    while (i < s*32){
        if (!is_s_zeros(dec)){
            //printf("%d %d\n",dec[ssize-1], dec.back());
            if((dec[ssize-1]%2 == 1))
                set_bit(i);//dodaj 1 na itej pozycji bitowej do tab
            divideS_by_2(dec);
        }
        i++;
    }
}
void BigN::set_bit(int ind)
{
    tab[ind/32] |= 1<<(ind%32);
}
void BigN::print_hex(){
    for(int i=s-1; i>=0; i--)
        printf("%x",tab[i]);
    printf("\n");

}

void divideS_by_2(std::string &dec)
{
    int ssize= dec.size();
    std::vector<int> fives_pos;

    for (int i=0; i<ssize; i++){
        if(dec[i]%2 == 1 && i+1 < ssize)
            fives_pos.push_back(i+1);
        dec[i]/=2;
    }
    for(int pos : fives_pos){
        dec[pos]+=5;
    }
}
bool is_s_zeros(std::string dec)
{
    for(char c : dec)
        if(c!=0)
            return false;
    return true;
}

//mnożenie w NB, algorytm naiwny, cyfra(słowo) razy cyfra(słowo)
BigN u_mul(BigN x, BigN y){
    unsigned int res_size = 2* (x.s> y.s ? x.s : y.s);
    BigN res(res_size);

    unsigned long long a=0;

    for (int i=0; i<y.s; i++){
        for(int j=0; j<x.s; j++){
            a = (unsigned long long)(y.tab[i]) * (unsigned long long)(x.tab[j]);
            if(0xffffffff-res.tab[i+j] < (a<<32)>>32) //OVflow check
                res.tab[i+j+1] +=1;
            res.tab[i+j] += a;
            if(0xffffffff-res.tab[i+j+1] < a>>32) //OVflow check
                res.tab[i+j+2] += 1;
            res.tab[i+j+1] += a>>32;
        }
    }

    return res;
}
