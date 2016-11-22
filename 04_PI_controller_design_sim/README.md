
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
>
![](https://github.com/ChingHengWang/mobile_mimo/blob/master/04_PI_controller_design_sim/fig/diff_mobile_model_simple.png) 


----
## changelog
* 22-11-2016 first-write	

