D = conv([1 -1.7 1],[1 -1]);
dD = 3;
N = [0 0 -1 2];
dN = 3;
C = [1 -0.6];
dC = 1;
[Y,dY,X,dX] = xdync(N,dN,D,dD,C,dC);
N1 = conv(N,[1 -1]);
dN1 = 4;
N2 = N;
dN2 = dN;
N = zeros(1,2);
dN = 0;
[N,dN] = putin(N,dN,N1,dN1,1,1);
[N,dN] = putin(N,dN,N2,dN2,1,2);
[N,dN] = transp(N,dN);
[Y,dY,X,dX] = xdync(N,dN,D,dD,C,dC);
