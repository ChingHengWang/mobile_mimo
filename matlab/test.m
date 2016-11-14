close all;
s=tf('s')
T=0.001
G = (1-exp(-s*T))/(s*T);
figure(1);
opts1 = bodeoptions;
opts1.YLim = {[-200,100];[-360,0]}; % {maglimits;phaselimits}
opts1.XLim = {[10^-4,10^8]};
opts1.YLimMode = {'manual';'manual'}; % {maglimits mode;phaselimits mode}
bode(G,opts1);grid on;title('platform bode');

G = (1/100)*(1-exp(-s*T*100))/(1-exp(-s*T));
figure(2);
opts1 = bodeoptions;
opts1.YLim = {[-200,100];[-360,0]}; % {maglimits;phaselimits}
opts1.XLim = {[10^-4,10^8]};
opts1.YLimMode = {'manual';'manual'}; % {maglimits mode;phaselimits mode}
bode(G,opts1);grid on;title('platform bode');

%figure;T=0.001
%f=1:1:100000;
%G1 = (1-exp(-2*pi*f*T))./(2*pi*f*T);
%G2= exp(-j*pi*f*T).*sin(f*T)./(f*T);
%G=sin(pi*f*100)./(100*sin(pi*f));
%plot(log10(f),20*log10(G));

