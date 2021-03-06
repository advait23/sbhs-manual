% program for using Box Jenkins model
clear 
close all
clc

% load the data ( data is in form u,y1 y2)
load finals_2005.mat;
n=input(' enter 1 for y1 data or 2 for y2 data-->');

if n==1
    y=y1;
    disp('First data y1 is selected')
else
    y=y2;
    disp(' 2nd data y2 is selected')
end
    z=[y u];
    
figure(1);
idplot(z(100:1000,:)), % reponce of actual plant
z=dtrend(z);

figure(2)
idplot(z(100:1000,:));

dataexp = iddata(y,u,1); 
dataexp.Tstart = 0;
datatrain = dataexp(100:1500); % data for test
datatest = dataexp(2501:3000); % data for velidation
figure(3)
cra(datatrain); % to see the impulse responce
figure(4)
step(datatrain)
 theta_oe1 = oe(datatrain,[1 2 1]); % prediction error model
 present(theta_oe1);
 figure(5)
 resid(theta_oe1,datatrain); % check the residue
 figure(6)
 compare(theta_oe1,datatrain); % fitness between model and test data
 figure(7);
 compare(theta_oe1,datatest); % fitness between model and velidation data 
% Estimating the Noise Model
 
 err_oe1 = pe(theta_oe1,datatrain); % get the error between the model and actual data
 figure(8)
 plotacf(err_oe1.y,1e-03,20,1); % acto correlation function
 figure(9);
 arun_pacf(err_oe1.y,20); % partial suto correlation fumction
% 
 theta_n1 = ar(err_oe1.y,3); % AR modelling 
 present(theta_n1); 
 err_n1 = pe(theta_n1,err_oe1); % error estimaion
 figure(10)
 plotacf(err_n1.y,1e-03,20,1); % autocorelation plot
% 
% % fitting BJ modell for error
  B = theta_oe1.b; F = theta_oe1.f; D = theta_n1.a; 
   gtotal = idpoly(1,B,1,D,F); 
   theta_bj1 = bj(datatrain,gtotal);
    present(theta_bj1);
    figure (11)
  resid(theta_bj1,datatrain); 
 % roots(theta_bj1.f); % Calculate Poles 
  figure(12)
  compare(theta_bj1,datatrain);
  figure(13); 
  compare(theta_bj1,datatest);
% % %    theta_bj2=armax(datatrain,[1 1 1 3],'MaxIter',0)
   theta_bj2=bj(datatrain,[2 2 3 2 1])
   present(theta_bj2); 
   figure (14)
  resid(theta_bj2,datatrain); 
% % roots(theta_bj2.f); % Calculate Poles 
  figure(15)
  compare(theta_bj2,datatrain);
  figure(16); 
  compare(theta_bj2,datatest);
  
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  %  Fitting the otherset of data in the same model%
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
B1= theta_bj2.b;C1=theta_bj2.c;D1=theta_bj2.d;  
F1= theta_bj2.f;
gtotal1 =idpoly(1,B1,C1,D1,F1);

if n==1,
    y11=y2;
else
    y11=y1;
end

dataexp1=iddata(y11,u,1);
datatrain1=dataexp1(100:1500);
datatest1=dataexp1(2501:3000);
theta_bj3=bj(datatrain1,gtotal1);
figure(17)
resid(theta_bj3,datatrain1);
figure(18)
compare(theta_bj3,datatrain1);
figure(19)
compare(theta_bj3,datatest1);