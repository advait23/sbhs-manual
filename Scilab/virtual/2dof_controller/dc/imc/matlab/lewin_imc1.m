num = 1; den = [250 35 1]; Ts = 3;
G = tf(num,den);
[B,A,k] = myc2d(G,Ts);
alpha = 0.9;
[k,GiN,GiD] = imc_stable1(B,A,k,alpha);
[zk,dzk] = zpowk(k);
Bp = B; Ap = A;
t0 = 0; tf = 100; st = 1; Nvar = 0;

% simulink executed with delay block deleted
