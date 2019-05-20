#include "testy.h"
#include "BigN.h"
#include <string>
#include <iostream>
#include <iomanip>
#include <fstream>
#include <chrono>

//mnoży liczby z pliku 'test1.txt' i wypisuje wynik do 'res1.txt' szesnastkowo
void test1()
{
	std::string num1_s;
	std::string num2_s;
	BigN *num1, *num2, res;
	std::ifstream in_file("test1.txt");
	std::ofstream out_file("res1.txt");
	int in_len, in_num_size;

	if( in_file.good() && out_file.good() )
	{
		in_file >> in_num_size;
		in_file >> in_len;
		while( !in_file.eof() && in_len-- > 0)
		{
			in_file >> num1_s;
			in_file >> num2_s;
			num1 = new BigN(num1_s,0);
			num2 = new BigN(num2_s,0);

			res = u_mul(*num1, *num2);

			out_file << res.to_string_hex() << std::endl;
			std::cout<< res.to_string_hex() << std::endl;
			delete num1;
			delete num2;

		}
	}
	in_file.close();
	out_file.close();

}

//testy szybkości
void test2()
{
	std::string num1_s;
	std::string num2_s;
	BigN *tab, *num1, *num2;
	std::ifstream in_file("test1.txt");

	int in_len, in_num_size, i=0;

	if( in_file.good() )
	{
		in_file >> in_num_size;
		in_file >> in_len;
		tab = new BigN[2*in_len];

		while( !in_file.eof() && i < 2*in_len)
		{
			in_file >> num1_s;
			in_file >> num2_s;
			num1 = new BigN(num1_s,0);
			num2 = new BigN(num2_s,0);
			tab[ i ] = *num1;
			tab[ i+1 ] = *num2;
			std::cout<<i<<" "<< tab[ i ].to_string_hex() << std::endl;
			std::cout<<i+1<<" "<< tab[i+1].to_string_hex() << std::endl;

			delete num1;
			delete num2;
			i+=2;

		}
	}
	in_file.close();

	//pomiar czasu
	std::chrono::high_resolution_clock::time_point t1;
	std::chrono::high_resolution_clock::time_point t2;


	BigN *res = new BigN[in_len];


	t1 = std::chrono::high_resolution_clock::now();

	for(int j = 0 ; j<in_len ; j+=2)
	{
		res[j] = u_mul( tab[2*j] , tab[2*j+1] );
	}

	t2 = std::chrono::high_resolution_clock::now();
	std::chrono::duration<double> pomiar = std::chrono::duration_cast<std::chrono::duration<double>>(t2 - t1);
	std::cout <<"wykonanie mnozen zajelo: "<<std::fixed<<std::setprecision (12) << pomiar.count() << " s"<<std::endl;

	std::ofstream out_file("res1.txt");

	if(out_file.good())
	{
		for(int j = 0 ; j<in_len ; j++)
		{
			out_file << res[j].to_string_hex() <<std::endl;
		}
	}
	std::ofstream time_file("czasy.csv", std::ios::app);
	if(out_file.good())
	{
		time_file << in_num_size <<','<<in_len<<','<< pomiar.count() <<std::endl;
	}
	time_file.close();


	std::cout <<"wykonanie "<<in_len<<" mnozen "<<in_num_size<<" bitowych liczb zajelo: "
				<<std::fixed<<std::setprecision (12) << pomiar.count() << " s"<<std::endl;

	delete[] res;
	delete[] tab;
	out_file.close();

}
void test3()
{
	std::string num1_s;
	std::string num2_s;
	BigN *tab, *num1, *num2;
	std::ifstream in_file("test1.txt");

	int in_len, in_num_size, i=0;

	if( in_file.good() )
	{
		in_file >> in_num_size;
		in_file >> in_len;
		tab = new BigN[2*in_len];

		while( !in_file.eof() && i < 2*in_len)
		{
			in_file >> num1_s;
			in_file >> num2_s;
			num1 = new BigN(num1_s,0,'h');
			num2 = new BigN(num2_s,0,'h');
			tab[ i ] = *num1;
			tab[ i+1 ] = *num2;
			std::cout<<i<<" "<< tab[ i ].to_string_hex() << std::endl;
			std::cout<<i+1<<" "<< tab[i+1].to_string_hex() << std::endl;

			delete num1;
			delete num2;
			i+=2;

		}
	}
	in_file.close();

	//pomiar czasu
	std::chrono::high_resolution_clock::time_point t1;
	std::chrono::high_resolution_clock::time_point t2;
	int powt = 100;

	BigN *res = new BigN[in_len*powt];


	t1 = std::chrono::high_resolution_clock::now();

	for(int k=0; k<powt; k++)
	{
		for(int j = 0 ; j<in_len ; j++)
		{
			res[in_len*k+j] = u_mul( tab[2*j] , tab[2*j+1] );
		}
	}


	t2 = std::chrono::high_resolution_clock::now();
	std::chrono::duration<double> pomiar = std::chrono::duration_cast<std::chrono::duration<double>>(t2 - t1);
	std::cout <<"wykonanie mnozen zajelo: "<<std::fixed<<std::setprecision (12) << pomiar.count() << " s"<<std::endl;

	std::ofstream out_file("res3.txt");
	if(out_file.good())
	{
		for(int j = 0 ; j<in_len ; j++)
		{
			out_file << res[j].to_string_hex() <<std::endl;
		}
	}
	out_file.close();

	std::ofstream time_file("czasy.csv", std::ios::app);
	if(out_file.good())
	{
		time_file << in_num_size <<','<<in_len*powt<<','<< pomiar.count() <<std::endl;
	}
	time_file.close();


	std::cout <<"wykonanie "<<in_len<<" mnozen "<<in_num_size<<" bitowych liczb zajelo: "
				<<std::fixed<<std::setprecision (12) << pomiar.count() << " s"<<std::endl;

	delete[] res;
	delete[] tab;


}

