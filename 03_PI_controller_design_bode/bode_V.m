close all
Kp_L=25.7/0.8;
Ki_L=(9.11/1)*Kp_L*1;
Ts=0.001;
s=tf('s');

C=(Kp_L*s+Ki_L)/s;
%G=(k/r)/(m*s+b);
G1 = (1.136/(s+12.99))*exp(-0.052*s);
G2 = (0.67/(s+11.24))*exp(-0.052*s);%calcualte this
G3 = (0.5567/(s+10.64))*exp(-0.052*s);
G4 = (0.6023/(s+12.99))*exp(-0.052*s);

%G = (1.423/(s+4.5))*exp(-0.04*s);
% C=tf([1]);
H1=(1-exp(-Ts*s))/(Ts*s);

%H2=((1-exp(-100*s))/(1-exp(-1*s)))/100;
H2=1;

figure;
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

figure;
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
    bode(C*G3*H1*H2,opts1);grid on;title('closeloop bode');
    hold on;
    subplot(2,2,4)
    bode(C*G4*H1*H2,opts1);grid on;title('closeloop bode');

