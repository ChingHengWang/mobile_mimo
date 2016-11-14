us=2;
final_V_L=0.2;
t_L=0.04;
a_L = 1/t_L
b_L = (a_L*final_V_L)/us
% us 2  a25 b2.5


us=4;
final_V_L=0.273;
t_L=0.04;
a_L = 1/t_L
b_L = (a_L*final_V_L)/us
% us 4  a25 b1.7

us=4;
final_V_L=0.273;
t_L=0.04;
a_L = 1/t_L
b_L = (a_L*final_V_L)/us
% us 4  a25 b1.7


ud=6;
final_V_W=0.339;
t_W= 0.04;
a_W = 1/t_W
b_W = (a_W*final_V_W)/ud
% us 6  a25 b1.4

ud=8;
final_V_W=0.406;
t_W= 0.06;
a_W = 1/t_W
b_W = (a_W*final_V_W)/ud
% us 8  a16.67 b0.8
% 
% Ts=0.001*100;
% s=tf('s');
% 
% Kp_L = 1.0;
% Ki_L = 0.1;
% 
% Kp_W = 4;
% Ki_W = 0.07;
% 
% CL=(Kp_L*s+Ki_L)/s;
% GL=b_L/(s+a_L)
% 
% CW=(Kp_W*s+Ki_W)/s;
% GW=b_W/(s+a_W)
% 
% H1=(1-exp(-Ts*s))/(Ts*s);
% 
% figure(1);
% opts = bodeoptions;
% opts.YLim = {[-200,100];[-720,0]}; % {maglimits;phaselimits}
% opts.XLim = {[10^-4,10^4]};
% opts.YLimMode = {'manual';'manual'}; % {maglimits mode;phaselimits mode}
% bode(CL*GL*H1,opts);grid on;title('L platform bode');
% 
% figure(2);
% opts = bodeoptions;
% opts.YLim = {[-200,100];[-720,0]}; % {maglimits;phaselimits}
% opts.XLim = {[10^-4,10^4]};
% opts.YLimMode = {'manual';'manual'}; % {maglimits mode;phaselimits mode}
% bode(CW*GW*H1,opts);grid on;title('W platform bode');
% 
% %figure(3);
% %T=feedback(CW*GW,H1);
% %[y,t,x]=step(T);step(T);grid on;title('W totaly Clossedloop time unit step response');axis([0 120 0 3]);hold on;
