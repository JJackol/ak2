
all: showimage

showimage: showimage.c
	gcc showimage.c -l SDL-1.2 -l SDL_image-1.2 -I /usr/include/SDL -o showimage filter.c mmx_filter.s -m32

clean: 
	rm *.o showimage


