num = 1; den = [250 35 1]; Ts = 3;
G = tf(num,den);
[B,A,k] = myc2d(G,Ts);
alpha = 0.5;
% [k,HiN,HiD,R,S] = imc_stable(B,A,k,alpha);
[k,HiN,HiD,R,S,mu] = imc(B,A,k,alpha);
[zk,dzk] = zpowk(k);
Bp = B; Ap = A;
