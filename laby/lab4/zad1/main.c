#include <stdio.h>

extern long long int my_func();

int main(int argc, char** args)
{
	for(int i=0; i<10 ;i++)
	{
		
		printf("%llx \n", my_func());
	}
	return 0;
}

