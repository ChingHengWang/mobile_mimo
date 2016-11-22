% rugby head tilt and yaw rotation calculation

m = 1.2; %head weight kg
r = 0.12; %head radius

w = 3.14*0.7;%tilt rotate speed rad/s
acc_time = 1.0; %acceleration time
arfa = w / acc_time; %tilt rotate angular acceleration
e = 0.06; %distance between motor and head mass center
g = 9.81;
I_tilt = m * r^2;%head Inertia for tilt axis
T_tilt_require = m*g*e + I_tilt * arfa %Nm
W_tilt_require = w %rad/s

I_yaw = m * r^2;%head Inertia for tilt axis
T_yaw_require = I_yaw * arfa* 1/9.81 * 100 %kgcm   
                             %neglect bearing friction force
W_yaw_require = w %rad/s

t_yaw_m = T_yaw_require  %kg-cm
w_yaw_m = W_yaw_require  %rpm


%Pulley radius
r1 = 1; %belt wheel radius 1
r2 = 1; %belt wheel radius 2

% motor
t_tilt_m = T_tilt_require * r1/r2 * 1/9.81 * 100 %kg-cm
w_tilt_m = W_tilt_require * r2/r1 * 60/1 * 1/6.28 %rpm

%result
