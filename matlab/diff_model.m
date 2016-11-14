vel_x = 0.7
vel_th = 0
wheelSeparation = 0.393 % 0.43
wheelRadius = 0.078 % 0.085

left_vel = (2*vel_x - vel_th * wheelSeparation) / (2 * wheelRadius)
right_vel = (2*vel_x + vel_th * wheelSeparation) / (2 * wheelRadius)

% SOG V_RATED 85rpm V_NOLOAD 110rpm
V_RATED=85*(6.28/1)*(1/60) % 8.9
V_NOLOAD=110*(6.28/1)*(1/60) % 11.5

MaxSpeed 10.96
