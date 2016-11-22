close all
Kp_W=5.6/1.0
Ki_W=(12.9/2)*Kp_W*1
Ts=0.001;
s=tf('s')

C=(Kp_W*s+Ki_W)/s;
%G=(k/r)/(m*s+b);

G1 = (4.375/(s+12.5))*exp(-0.052*s);
G2 = (3.401/(s+13.16))*exp(-0.052*s);
G3 = (2.691/(s+12.05))*exp(-0.052*s);%calculate this
G4 = (2.5/(s+12.5))*exp(-0.052*s);

%G = (1.423/(s+4.5))*exp(-0.04*s);
% C=tf([1]);
H1=(1-exp(-Ts*s))/(Ts*s);

%H2=((1-exp(-100*s))/(1-exp(-1*s)))/100;
H2=1;

figure(1);
opts1 = bodeoptions;
opts1.YLim = {[-200,100];[-360,0]}; % {maglimits;phaselimits}
opts1.XLim = {[10^-4,10^4]};
opts1.YLimMode = {'manual';'manual'}; % {maglimits mode;phaselimits mode}

    subplot(2,2,1)
    bode(G1*H1*H2,opts1);grid on;title('platform bode');
    hold on;
    subplot(2,2,2)
    bode(G2*H1*H2,opts1);grid on;title('platform bode');
    hold on;
    subplot(2,2,3)
    bode(G3*H1*H2,opts1);grid on;title('platform bode');
    hold on;
    subplot(2,2,4)
    bode(G4*H1*H2,opts1);grid on;title('platform bode');

figure(2);
opts2 = bodeoptions;
opts2.YLim = {[-200,100];[-360,0]}; % {maglimits;phaselimits}
opts2.XLim = {[10^-4,10^4]};
opts2.YLimMode = {'manual';'manual'}; % {maglimits mode;phaselimits mode}
    subplot(2,2,1)
    bode(C*G1*H1*H2,opts1);grid on;title('closeloop bode');
    hold on;
    subplot(2,2,2)
    bode(C*G2*H1*H2,opts1);grid on;title('closeloop bode');
    hold on;
    subplot(2,2,3)
    bode(C*G3*H1*H2,opts1);grid on;title('closeloop bode (design this)');
    hold on;
    subplot(2,2,4)
    bode(C*G4*H1*H2,opts1);grid on;title('closeloop bode');
