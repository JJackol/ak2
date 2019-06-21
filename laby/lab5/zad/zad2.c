#include<stdio.h>
int change();
void ptc(double www);
void pta(double www);
int main(void)
{
	double a, b, c, d, e, f;
	char wynik[54];	
	int i=32;

	int w;
	d=a=0.00001;
	e=b=128;
	c=a/b;
	w=change();
	f=d/e;

	//gcvt(c, 24, wynik);
	printf("%hx   %.14a   %.14a\n", w, c, f);
	pta(c);	
	ptc(c);
	printf("\n");
	pta(f);
	ptc(f);
	printf("\n");
}
