// Updated(18-7-07)
// 5.4

w = 0.01:0.01:%pi;
G = 1-exp(-%i*w);
subplot(2,1,1)
plot2d1("gll",w,abs(G),style = 2);
label('',4,' ','Magnitude',4);
subplot(2,1,2)
plot2d1("gln",w,phasemag(G),style = 2);
label('',4,'w','Phase',4)


