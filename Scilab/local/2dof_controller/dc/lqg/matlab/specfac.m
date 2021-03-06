% function [r,b,dAFW] = ...
%    specfac(A,dA,B,dB,rho,V,dV,W,dW,F,dF)
% Implements the spectral factorization for use with LQG 
% control by design method of Ahlen and Sternad

function [r,b,dAFW] = specfac(A,dA,B,dB,rho,V,dV,W,dW,F,dF)
AFW = conv(A,conv(W,F));
dAFW = dA + dF + dW;
AFWWFA = rho * conv(AFW,flip(AFW));
BV = conv(B,V);
dBV = dB + dV;
BVVB = conv(BV,flip(BV));
diff = dAFW - dBV;
dBVVB = 2*dBV;
for i = 1:diff
    [BVVB,dBVVB] = polmul(BVVB,dBVVB,[0 1],1);
end
[rbb,drbb] = poladd(AFWWFA,2*dAFW,BVVB,dBVVB);
rts = roots(rbb);
rtsin = rts(dAFW+1:2*dAFW);
b = 1;
for i = 1:dAFW,
    b = conv(b,[1 -rtsin(i)]);
end
b = real(b); 
br = flip(b);
bbr = conv(b,br);
r = rbb(1) / bbr(1);
