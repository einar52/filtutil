#!/bin/ksh
#
#	Antialias filter for 100 Hz data, flat from 0 to 4 Hz
#
export PDRIVER=gif
export PFILE=junk.gif
filtutil -d 0.01 -i 0.0019 -p 1.8 12 -p 4.4 5.3  -A 20 
xv junk.gif &
filtutil -d 0.01 -i 0.0019 -p 1.8 12 -p 4.4 5.3  -w filter
sleep 4
filtutil -d 0.01 -i 0.0019 -p 1.8 12 -p 4.4 5.3  -I 1.0
xv junk.gif &

# here is a filter that is flatter in pass band but not as strong
# rejection of frequencies above 10 Hz
#filtutil -d 0.01 -i 0.0028 -p 1.8 16 -p 4.4 7 -w filter 
