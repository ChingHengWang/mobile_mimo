# `03_PI_controller_design_bode`

----
## code
    bode_V.m
    bode_W.m

> Design PI controller on bode plot, use our model from ID identification, 
add system delay, add finit differential sampling or moving filter .
----
## `bode_V.m`

    Kp_L=25.7/0.8;
    Ki_L=(9.11/1)*Kp_L*1;

### design Kp and Ki
>
* Design Kp
  * find where is wg (gain cross over frequency) , and phase margin is enough 
  * use Kp to cut magnitude 
* Design Ki
  * set Ki/Kp, this is zero position, zero will increase phase , will destory phase margin. 

###

    Ts = 0.001
>sampling time is 1ms

    s=tf('s');

    C=(Kp_L*s+Ki_L)/s;
>C is PI controller

    G1 = (1.136/(s+12.99))*exp(-0.052*s);
    G2 = (0.67/(s+11.24))*exp(-0.052*s);%calcualte this
    G3 = (0.5567/(s+10.64))*exp(-0.052*s);
    G4 = (0.6023/(s+12.99))*exp(-0.052*s);
> ther is four model , using different voltage, and we choose G2 to be design model.

    H1=(1-exp(-Ts*s))/(Ts*s);
>Finite Sampling block, Ts is sampling time

    figure(1);
    opts1 = bodeoptions;
    opts1.YLim = {[-200,100];[-360,0]}; %     {maglimits;phaselimits}
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
>plot Open Loop bode of G1 G2 G3 G4
>G2 is design model

![](https://drive.google.com/uc?view&id=0B134T1DTCk6tSjYxRFNEVE9RRzA)


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
>plot Close Loop bode of G1 G2 G3 G4
>G3 is design model

![](https://drive.google.com/uc?view&id=0B134T1DTCk6tbjRRNFdvVmo0UXc)

----
## `bode_W.m`

    Kp_W=5.6/1.0
    Ki_W=(12.9/2)*Kp_W*1

### design Kp and Ki
>
* Design Kp
  * find where is wg (gain cross over frequency) , and phase margin is enough 
  * use Kp to cut magnitude 
* Design Ki
  * set Ki/Kp, this is zero position, zero will increase phase , will destory phase margin. 

###

    Ts = 0.001
>sampling time is 1ms

    s=tf('s');

    C=(Kp_L*s+Ki_L)/s;
>C is PI controller

    G1 = (4.375/(s+12.5))*exp(-0.052*s);
    G2 = (3.401/(s+13.16))*exp(-0.052*s);
    G3 = (2.691/(s+12.05))*exp(-0.052*s);%calculate this
    G4 = (2.5/(s+12.5))*exp(-0.052*s);
> ther is four model , using different voltage, and we choose G3 to be design model.

    H1=(1-exp(-Ts*s))/(Ts*s);
>Finite Sampling block, Ts is sampling time

    figure(1);
    opts1 = bodeoptions;
    opts1.YLim = {[-200,100];[-360,0]}; %     {maglimits;phaselimits}
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
>plot Open Loop bode of G1 G2 G3 G4
>G2 is design model

![](https://drive.google.com/uc?view&id=0B134T1DTCk6tMy1tOW45NU5YZTg)


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
>plot Close Loop bode of G1 G2 G3 G4
>G3 is design model

![](https://drive.google.com/uc?view&id=0B134T1DTCk6ta1U2bGhaMzhYbm8)
