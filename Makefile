
CFLAGS = -g

filtutil :  filtutil.o detfil.o  fftd.o splotc.o
	cc ${CFLAGS}  -o filtutil filtutil.o detfil.o fftd.o splotc.o $P -lm 

P=-lf2c -lgd

.f.o :
	 f2c -A $*.f
	 $(CC) -c $(CFLAGS) $*.c


clean : 
	rm *.o  filtutil core fftd.c
fil2 	: filtutil
	filtutil -i 0.0000086 -z 0.3  -p 1.08 .73 -p 1.46 1.74 \
	-p 1.9 .91 -w fil2

fil24 	: filtutil
	filtutil  -d 0.01 -i 4.5e-8 -z 0.3  -p 1.03 0.65 -p 1.285 1.56 \
	-p 1.675 1.56  -p 1.94 0.67 -w fil24
lop2 	: filtutil
	filtutil -i 1.25e-5 -z 3 -p 1.97 1.0 -p 1.55 2.8  -p .6 4 -A 4 ; 
	xv junk.gif &
fil14 	: filtutil
	filtutil  -d 0.005 -i 7e-10 -z 0.3  -p 1.03 0.65 -p 1.285 1.56 \
	-p 1.675 1.56  -p 1.94 0.67 -w fil14
fil44 	: filtutil
	filtutil  -d 0.02 -i 2.8e-6 -z 0.3  -p 1.03 0.65 -p 1.285 1.56 \
	-p 1.675 1.56  -p 1.94 0.67 -w fil44
lopx 	: filtutil
	filtutil -d 0.1 -i 1.05e-6 -p 0.0022 0.015 -p 0.005 0.005 -z 0.01 -w lopx
