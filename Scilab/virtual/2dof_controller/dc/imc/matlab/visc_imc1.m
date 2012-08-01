B = [0.51 1.21];
A = [1 -0.44];
k = 1;
alpha = 0.5;
[k,GiN,GiD] = imc_stable1(B,A,k,alpha);
[zk,dzk] = zpowk(k);
Bp = B; Ap = A; 
Ts = 0.1; t0 = 0; tf = 20; Nvar = 0.01;