close all
m=18.8;%mass 
r=0.065;%m
k=1; b=1;

Ts=0.04
s=tf('s')


G=(k/r)/(m*s+b)
H1=(1-exp(-Ts*s))/(Ts*s)

figure(1);
opts = bodeoptions;
opts.YLim = {[-200,100]}; % {maglimits;phaselimits}
opts.XLim = {[10^-4,10^4]};
opts.YLimMode = {'manual';'auto'}; % {maglimits mode;phaselimits mode}
bode(G*H1,opts);grid on;title('platform bode');


G=((k/r)/(m*s+b))*exp(-0.4*s)
H1=(1-exp(-Ts*s))/(Ts*s)

figure(2);
opts = bodeoptions;
opts.YLim = {[-200,100];[-720,0]}; % {maglimits;phaselimits}
opts.XLim = {[10^-4,10^4]};
opts.YLimMode = {'manual';'manual'}; % {maglimits mode;phaselimits mode}
bode(G*H1,opts);grid on;title('platform bode with dealy 0.4s');


z=1;
p=100;
K=p/z;
C1=K*(s+z)/(s+p);
G=((k/r)/(m*s+b))*exp(-0.4*s)
H1=(1-exp(-Ts*s))/(Ts*s)

figure(3);
opts = bodeoptions;
opts.YLim = {[-200,100];[-720,0]}; % {maglimits;phaselimits}
opts.XLim = {[10^-4,10^4]};
opts.YLimMode = {'manual';'manual'}; % {maglimits mode;phaselimits mode}
bode(C1*G*H1,opts);grid on;title('platform bode with dealy 0.4s');