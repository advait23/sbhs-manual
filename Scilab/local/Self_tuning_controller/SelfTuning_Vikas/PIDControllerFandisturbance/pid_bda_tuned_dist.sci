mode(0);
//PID using Backward difference approximation for I and D

function [temp,CO] = pid_bda_tuned_dist(setpoint,disturbance)
global temp heat_in fan_in et SP CO eti u_old u_new e_old e_new e_old_old
L = 6;
R = (0.016*temp-0.114)/(66.90-0.415*temp);
K = 1.2/(R*L)
Ti = 2*L;
Td = 0.5*L;


e_new = setpoint - temp;

Ts=1;

S0=K*(1+(Ts/Ti)+(Td/Ts));
S1=K*(-1-((2*Td)/Ts));
S2=K*(Td/Ts);

u_new = u_old + S0*e_new + S1*e_old + S2*e_old_old;
et = setpoint - temp;
CO = u_new;

  if CO>39
    CO = 39;
  end;
  
  if CO<0
    CO = 0;
  end;
  
u_new = CO;     
  
u_old = u_new;
e_old_old = e_old;
e_old = e_new;


heat_in = CO;
fan_in = disturbance;

writeserial(handl,ascii(254)); //heater
writeserial(handl,ascii(heat_in));
writeserial(handl,ascii(253));
writeserial(handl,ascii(fan_in));
writeserial(handl,ascii(255));
sleep(1);
temp = ascii(readserial(handl,2));
temp = temp(1) + 0.1*temp(2);

endfunction;

