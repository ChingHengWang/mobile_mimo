
% project name 
% matlab_ws > andbot > prototype > mobile > motor > calculation > angel.m


% content: 
% calcualte angel robot motor specification
% input Vx(linear speed) Ax(linear acceleration) Wz(angular speed) Az(angular acceleration)
%
% theory: differential theory

% reference :
% parameter in prototype - andbot
% https://github.com/oudeis/therobot/blob/master/Andbot_pkg/andbot/catkin/src/andbot/config/fake/base_local_planner_params.yaml

% move_base parameter 
% http://wiki.ros.org/base_local_planner

% Angle robot specification ver2
% https://www.evernote.com/shard/s647/nl/110509500/b25c68d8-d276-4319-ad80-5113999e9b42?title=Angle%20robot%20specification%20ver2

% 3530B spec
% https://www.evernote.com/shard/s647/nl/110509500/a1efe80b-8a1f-4152-b48c-0907026a28f2?title=3530B%20motor%20spec

% google drive motor calculation :  andbot>prototype>mobile>motor>calculation
% https://drive.google.com/drive/folders/0B134T1DTCk6tOFc0Mm5JVXVJOHc
acc_time = 0.1

Vx=0.6; %
Ax=Vx/acc_time; % acc_time to achieve Vx

Wz=1;
Az=Wz/acc_time; % acc_time to achieve Wz


l=0.247; %meter  wheel seperation
r=0.0375; %meter radius of wheel

wr= (2*Vx+Wz*l)/(2*r) % right wheel speed rad/s
wr_rpm=wr*60/6.28 % right wheel speed rpm
wl= (2*Vx-Wz*l)/(2*r)
wl_rpm=wl*60/6.28

ar= (2*Ax+Az*l)/(2*r); %right wheel angular acceleration rad/s^2
ar_rpm=wr*60/6.28;
al= (2*Vx-Az*l)/(2*r);
al_rpm=wl*60/6.28;


m_wheel=0.226; % mass of one wheel @design by mech team
I=m_wheel*r^2; % rough calculate Inertia of one wheel 

m=5;%kg

u=0.4; % assumption between metal and wood

fl=0.5*m*al*r; % left wheel move force
fr=0.5*m*ar*r; % right wheel move force

tq_l=I*al+fr*r % left motor rotate torque
               % I is inertia of wheel 
tq_r=I*ar+fr*r % right motor rotate torque
