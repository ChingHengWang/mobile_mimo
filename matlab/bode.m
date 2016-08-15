m=18.8;
r=0.065;
k=1;
b=1;

Ki=1.2;
Kp=12;
Ts=0.01
s=tf('s')

C=(Kp*s+Ki)/s;
G=(k/r)/(m*s+b)
%C=tf([1]);
T=feedback(C*G,H1*H2)
H1=(1-exp(-Ts*s))/(Ts*s)
H2=100/(s+100)

figure(1);
opts = bodeoptions;
opts.YLim = {[-200,100]}; %{maglimits;phaselimits}
opts.XLim = {[10^-4,10^4]};
opts.YLimMode = {'manual';'auto'}; %{maglimits mode;phaselimits mode}
bode(G*H1,opts);grid on;title('platform bode');


figure(2);
T=feedback(G,H1);
[y,t,x]=step(T);step(T);grid on;title('platform time unit step response');axis([0 120 0 3]);
y_stable=1;
for i=1:length(y)
    if y(i)>y_stable
        break;
    end
end
tr=x(i);
[max_response,index]=max(y);
tp=x(index);
for i=1:length(y)
    if max(y(i:length(y)))<=1.02*y_stable
        if min(y(i:length(y)))>=0.98*y_stable
            break;
        end
    end
end
ts=x(i);

figure(3);
opts2 = bodeoptions;
opts2.YLim = {[-200,100]}; %{maglimits;phaselimits}
opts2.XLim = {[10^-4,10^4]};
opts2.YLimMode = {'manual';'auto'}; %{maglimits mode;phaselimits mode}
bode(C,opts2);grid on;title('controller bode');


figure(4);
opts3 = bodeoptions;
opts3.YLim = {[-200,100]}; %{maglimits;phaselimits}
opts3.XLim = {[10^-4,10^4]};
opts3.YLimMode = {'manual';'auto'}; %{maglimits mode;phaselimits mode}
bode(C*G*H1*H2,opts3);grid on;title('totoaly open loop bode');

figure(5);
opts4 = bodeoptions;
opts4.YLim = {[-200,100]}; %{maglimits;phaselimits}
opts4.XLim = {[10^-4,10^4]};
opts4.YLimMode = {'manual';'auto'}; %{maglimits mode;phaselimits mode}
bode(H2,opts4);grid on;title('sensor filter bode');

figure(6);
T=feedback(C*G,H1*H2);
[y,t,x]=step(T);step(T);grid on;title('totaly Clossedloop time unit step response');axis([0 120 0 3]);
y_stable=1;
for i=1:length(y)
    if y(i)>y_stable
        break;
    end
end
tr=t(i);
[max_response,index]=max(y);
tp=t(index);
for i=1:length(y)
    if max(y(i:length(y)))<=1.02*y_stable
        if min(y(i:length(y)))>=0.98*y_stable
            max(y(i:length(y)))
            min(y(i:length(y)))
            break;
        end
    end
end
ts=t(i);
tp
tr
ts

