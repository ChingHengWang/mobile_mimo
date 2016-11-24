# `01_system_id`

----
## code
    init.m
    ID_model.slx
    system_id.m
    

> identify system model,use step input to excite system response.

----
## init.m
>ros init on MATLAB  

    rosinit('http://localhost:11311')

    setenv('ROS_IP','192.168.25.79')
     
    setenv('ROS_MASTER_URI','http://localhost:11311')

## `ID_model.slx`
>simulink model.

![](https://drive.google.com/uc?view&id=0B134T1DTCk6tMkFWUlNkX2pHVEU)
> openloop enable set

* 0 is closed loop
* 1 is openloop

![](https://drive.google.com/uc?view&id=0B134T1DTCk6tRHJiM3RnVHRDVk0)
> cmd vel

* cmd_v
* cmd_w

![](https://drive.google.com/uc?view&id=0B134T1DTCk6tbmsyek1NNm43cTA)
> feedforward parameter set

* FF vol : compensate friction force
* back emf compensate for left wheel
* back emf compensate for right wheel

![](https://drive.google.com/uc?view&id=0B134T1DTCk6tMk9JaWtFOVdQZU0)
>Kp Ki set

* Kp_L : linear velocity loop Kp
* Ki_L : linear velocity loop Ki
* Kp_W : angular velocity loop Kp
* Ki_W : angular velocity loop Ki

![](https://drive.google.com/uc?view&id=0B134T1DTCk6tbUdzRmJkRUZHRzQ)
>cmd and feedback compare

## system identification
![](https://drive.google.com/uc?view&id=0B134T1DTCk6tR0wzTFFRLWc5Zmc)

![](https://drive.google.com/uc?view&id=0B134T1DTCk6tOFVNTC0xckw5Ums)

----
## changelog
* 22-11-2016 first-write	

