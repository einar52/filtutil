

#filtutil -d 0.05  -i 1 -z 0.05 -p 1.05 0.9 -p 1.42 2.2  -p 1.95 1.35  -q 1.5 -A 5 ; display -rotate 90 j.ps

#filtutil -d 0.05  -i 1 -z 0.025 -p .525 0.45 -p 0.715 1.1  -p 0.975  0.675  -q 0.75 -A 2 ; display -rotate 90 j.ps

f0="-z 0.012 -p 0.262 0.225 -p 0.358 0.55 -p 0.49  0.337"

f2="-z 0.05 -p 1.05 0.9 -p 1.42 2.2 -p 1.95 1.35"
f4="-z 0.2 -p 2.1 1.8 -p 2.85 4.4 -p 3.9 2.7"

echo filtutil -d 0.05 -i 1 ${f0} -q 0.37 -A 1 
filtutil -d 0.05 -i 1 ${f0} -q 0.37 -A 1 ; display -rotate 90 j.ps

export f0="-z 0.012 -p 0.262 0.225 -p 0.358 0.55 -p 0.49 0.337"

#filtutil  -i 64e-9  ${f0}  -A 1 ; display -rotate 90 j.ps
filtutil  -i 64e-9  ${f0}  -q 0.375 -A 1 ; display -rotate 90 j.ps

# 4 - 8 Hz

filtutil -i 3.3e-3  -z 0.4 -p 4.2 3.6 -p 5.7 8.8 -p 7.8 5.4 -q 6 -A 15 

f8=" -z 0.4 -p 4.2 3.6 -p 5.7 8.8 -p 7.8 5.4 "

