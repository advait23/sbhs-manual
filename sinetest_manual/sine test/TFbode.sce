s=poly(0,'s')
h=syslin('c',(0.475/(124.827*s^2+57.26*s+1)))
bode(h,0.001,10);