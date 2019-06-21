#include <stdio.h>

#define NE_DOUBLE_EXT 0x037F
#define NE_DOUBLE 0x027F
#define NE_SINGLE 0x007F

#define DOWN_DOUBLE_EXT 0x077F
#define DOWN_DOUBLE 0x067F
#define DOWN_SINGLE 0x047F

#define UP_DOUBLE_EXT 0x0B7F
#define UP_DOUBLE 0x0A7F
#define UP_SINGLE 0x087F

#define ZERO_DOUBLE_EXT 0x0F7F
#define ZERO_DOUBLE 0x0E7F
#define ZERO_SINGLE 0x0C7F

extern  long long unsigned int my_timer();
extern void  set_control(short int control_w);
extern int  flagi();
extern void  clear();
extern short int show_control();
extern float operation(float, float);

int main()
{
	float a,b,c,d,e,f;
	printf("control w: %x \n", show_control() );
	clear();
	a=1.0;
	b=0.0;
	
	c = a/b;
	printf("%f\n", c);
	printf("flagi : %x\n", flagi() );

	d = 0x0.ffffp126;
	e = 0x0.ffffp126;
	clear();
	f = d*e;
	printf("flagi : %x\n", flagi() );
	printf("%f\n", f);

	
	clear();
	d = 0x1.0p-126;
	e = 0x2.0p-126;
	f = d+e;
	printf("%70.70f\n", f);
	printf("flagi : %x\n", flagi() );

	
//	printf("-----precision-----\n");
//	clear();
//	set_control(DOWN_SINGLE);
//	printf("%f\n", operation(d,e) );
//	clear();
//	set_control(UP_SINGLE);
//	printf("%f\n", operation(d,e) );
//	clear();
//	set_control(ZERO_SINGLE);
//	printf("%f\n", operation(d,e) );

	printf("-----precision-----\n");
	clear();
	set_control(DOWN_SINGLE);
	printf("%f\n", operation(0.1, 0.2) );
	clear();
	set_control(UP_SINGLE);
	printf("%f\n", operation(0.1, 0.2) );
	clear();
	set_control(ZERO_SINGLE);
	printf("%f\n", operation(0.1, 0.2) );
	return 0;
}

