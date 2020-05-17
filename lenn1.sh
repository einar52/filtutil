#!/bin/ksh
#
#	Compute a filter with similar response as lennarts 1 Hz.


filtutil -i 1  -z 0.0 -p 0.7 4.5  -L 20 -S 11.27 6.59 -A 50 -w lenn1.filt

