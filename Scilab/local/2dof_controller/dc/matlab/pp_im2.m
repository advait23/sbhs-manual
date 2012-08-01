% function [Rc,Sc,Tc,gamma,phit] = pp_im2(B,A,k,phi,Delta,a)
% 2-DOF PP controller with internal model of Delta and without
% hidden oscillations

function [Rc,Sc,Tc,gamma,phit] = pp_im2(B,A,k,phi,Delta,a)

if nargin == 5, a = 1; end
dphi = length(phi)-1;

% Setting up and solving Aryabhatta identity
[Ag,Ab] = polsplit3(A,a); dAb = length(Ab) - 1;
[Bg,Bb] = polsplit3(B,a); dBb = length(Bb) - 1;
[zk,dzk] = zpowk(k);
[N,dN] = polmul(Bb,dBb,zk,dzk);
dDelta = length(Delta)-1;
[D,dD] = polmul(Ab,dAb,Delta,dDelta);
[S1,dS1,R1,dR1] = xdync(N,dN,D,dD,phi,dphi);

% Determination of control law
Rc = conv(Bg,conv(R1,Delta)); Sc = conv(Ag,S1);
Tc = Ag; gamma = sum(phi)/sum(Bb); 

% Total characteristic polynomial
phit = conv(phi,conv(Ag,Bg));