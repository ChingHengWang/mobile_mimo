close all
clear all

s=tf('s')
z=0.1;
p=100;
C=(s+z)/(s+p);


figure(1);
opts = bodeoptions;
opts.YLim = {[-200,100]}; % {maglimits;phaselimits}
opts.XLim = {[10^-4,10^4]};
opts.YLimMode = {'manual';'auto'}; % {maglimits mode;phaselimits mode}
bode(C,opts);grid on;title('platform bode');

