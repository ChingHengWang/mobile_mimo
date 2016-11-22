
# `04_PI_controller_design_sim``

----
## code
    init.m
    diff_mobile_model_simple.slx

> After PI controller in bode , we have Kp and Ki , and use `diff_mobile_model_simple.slx` to simulate time response.
> We observe overshoot ,ts ,and tr, it this spec are ok,then go to practical design.

----
## init.m
>ros initial for matlab environment. 

    rosinit('http://localhost:11311')
>initial ros environment

    setenv('ROS_IP','192.168.25.79')
>set ros IP

    setenv('ROS_MASTER_URI','http://localhost:11311')
>set ros master is localhost

----
## `diff_mobile_model_simple.slx`
![](https://github.com/ChingHengWang/mobile_mimo/blob/master/04_PI_controller_design_sim/fig/diff_mobile_model_simple.png) 

* Up Loop is Linear Velocity Loop , Down Loop is Angular Velocity Loop

* Vd is Linear Velocity command, Wd is Angular Velociy command

* two Loop all have Feedforward item, but now disable it, so gain is zero.
* use Saturation block to simulate robot saturation condition, for us is 24 limit, for ud is 24 limit

* V transfer function (for example)
  * Numerator coefficients : [0.67]
  * Denominator coefficients : [1 11.24]

* W transfer function 
  * Numerator coefficients : [2.5]
  * Denominator coefficients : [1 12.5]  

* finite differential sample : LTI system (1-exp(-Ts`*`s))/(Ts`*`s)
* no anti-windup now
 
![](https://github.com/ChingHengWang/mobile_mimo/blob/master/04_PI_controller_design_sim/fig/time_response.png) 
* up figure : V control
* down figure : W control
* note : model couldn't be totally accurate, so simulaiton response has some oscillation but practical is ok

.
----
## changelog
* 22-11-2016 first-write	
