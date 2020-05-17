#!/bin/ksh
#
#	Antialias filter for 400 Hz data, flat from 0 to 40 Hz
#	This is a good canidate for antialias filter in SIL digitizer
#	delay for peak of impulse response is about 15 ms, 1.5 sample
#	intervals at 100 samples, frequency response of filter is flat
#	up to about 38 Hz, very low above 62 Hz.
#	This filter is minimum phase, cosisting of 3 pole-pairs, at
#	10, 28.5 and 39 Hz.
#	Application of filter consists of about 7 multiplications and
#	6 additions.
#			Einar Kjartansson, 16 Nov 1996
#
#	0
#	6
#	 0.004
#	 4.6193163054652
#	-9.32801576669675
#	10.4779614929457
#	-6.88123913506786
#	 2.50012014280278
#	-0.392190706407973
#
export PDRIVER=gif
export PFILE=junk.gif
filtutil -d 0.0025 -i 0.004 -p 10 82 -p 28.5 63 -p 39 26  -A 100 ; xv junk.gif &
filtutil -d 0.0025 -i 0.004 -p 10 82 -p 28.5 63 -p 39 26 -w filter 
sleep 4
filtutil -d 0.0025 -i 0.004 -p 10 82 -p 28.5 63 -p 39 26 -I 0.1; xv junk.gif &
