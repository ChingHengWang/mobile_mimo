close all


Ts=0.01
s=tf('s')


m=1;
b=0.1;
M=(1/b)/(m/b*s+1)
step(M);hold on;

m=1;
b=0.3;
M=(1/b)/(m/b*s+1)
step(M);hold on;

m=1;
b=0.5;
M=(1/b)/(m/b*s+1)
step(M);hold on;