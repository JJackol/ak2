
void Filter_c(unsigned char * in, unsigned char * out, int width, int height)
{
	int temp;
	int i;
	int j;
	for(i=1; i<width-1; i++)
	{
		for(j=1; j<height-1; j++)
		{
			temp = 1024;
			temp -= in[(j-1)*width-1+i];
			temp -= 2*in[j*width-1+i];
			temp -= in[(j+1)*width-1+i];

			temp += in[(j-1)*width+1+i];
			temp += 2*in[j*width+1+i];
			temp += in[(j+1)*width+1+i];

			out[j*width+i] = (unsigned char)(temp/8);

		}
	}

}

// współczynniki dobrane, aby obraz wyglądał jak w przykładach
void Filter_c2(unsigned char * in, unsigned char * out, int width, int height)
{
	int temp;
	int i;
	int j;
	for(i=1; i<width-1; i++)
	{
		for(j=1; j<height-1; j++)
		{
			temp = 1024;
			temp += 2*in[(j-1)*width-1+i];
			temp += 1*in[j*width-1+i];
			temp += 0*in[(j+1)*width-1+i];

			temp += in[(j-1)*width+i];
			temp += 0*in[j*width+i];
			temp -= in[(j+1)*width+i];

			temp -= 0*in[(j-1)*width+1+i];
			temp -= 1*in[j*width+1+i];
			temp -= 2*in[(j+1)*width+1+i];

			out[j*width+i] = (unsigned char)(temp/8);

		}
	}

}
