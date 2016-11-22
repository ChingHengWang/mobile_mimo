

syms s
syms R L Ke Kt b J
 b=0.0168;
 Kt=1.092;
 R=0.457;
 Ke=Kt;
 J=0.034;
% L=0.000001;
L=10

A=[-R/L -Ke/L;Kt/J -b/J];
IA=inv(s*eye(size(A))-A);
C=[0 1];
B=[1/L;0];
T=C*IA*B

% A=[-R/L 0;Kt/J -b/J];
% inv(s*eye(size(A))-A);

s=tf('s');
G000001=46901042872320000000/(1460288880640*s^2 + 667352740006985813*s + 51545689225691146962);
figure;rlocus(G000001)
G001=3212/(s^2 + 46.19*s + 3530);
figure;rlocus(G001)
G10=3.212/( s^2 + 0.5398*s + 3.53)
figure;rlocus(G10)

G1=27300/(850*s^2 + 39265*s + 3000354);
K=100;G11=K*G1/(1-K*G1);
G2=27300/((85*s + 42)*(10*s + 457));
K=20;G22=K*G2/(1+K*G2);
figure;rlocus(G2)
figure;rlocus(G22)

figure;
step(G11);title('positive feedback');
figure;
step(G22);title('back emf compensate');
figure;
opts1 = bodeoptions;
opts1.YLim = {[-200,100];[-360,0]}; % {maglimits;phaselimits}
opts1.XLim = {[10^-4,10^4]};
opts1.YLimMode = {'manual';'manual'}; % {maglimits mode;phaselimits mode}
bode(G2,opts1);grid on;title('decouple bode');

figure;
opts2 = bodeoptions;
opts2.YLim = {[-200,100];[-360,0]}; % {maglimits;phaselimits}
opts2.XLim = {[10^-4,10^4]};
opts2.YLimMode = {'manual';'manual'}; % {maglimits mode;phaselimits mode}
bode(G11,opts2);grid on;title('positive feedback bode');