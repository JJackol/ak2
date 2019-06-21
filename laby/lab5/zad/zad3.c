#include<stdio.h>
int change();
int change_1();
void ptc(double xxx);
void pta(double xxx);
int main(void)
{
	double a, b, c, d, e, f;
	int w;
	//w=change_1();
	d=a=0.00003;
	e=b=13167812;
	c=a/b;
	w=change_1();
	f=d/e;
	printf("%hx   %.15a   %.15a\n", w, c, f);
	
	pta(c);	
	ptc(c);
	printf("\n");
	
	pta(f);
	ptc(f);
	printf("\n");
	

}
