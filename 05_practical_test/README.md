# `05_practical_test`

----
## code
    roscore & rosserial
    mimo_mega_base/src/mimo_base_controller.ino
    vnh5019_base/src/vnh5019_base_mimo_ver2.ino

> after all procedure done , we will run our controller on pracitcal robot,run roscore and rosserial on odroid, and burn code into mega and 328p.

----
## roscore & rosserial
    ssh odroid@metal1
    roscore
    rosrun rosserial_python serial_node.py _port:=/dev/mega_base _baud:=1000000    

----
## `mimo_mega_base/src/mimo_base_controller.ino`
>this is main mimo base controller code, using PI controller and Feedforward.

## `vnh5019_base/src/vnh5019_base_mimo_ver2.ino`
>this is main mimo base controller code, using PI controller and Feedforward.

## mimo spec
![](https://drive.google.com/uc?view&id=0B134T1DTCk6tY0VoWnVrNU5zM3M)

#result
1. first figure : V
2. second figure : W
3. third figure : uL
4. fourth figure : uR 

###Velocity 2V Angular 4V
![](https://drive.google.com/uc?view&id=0B134T1DTCk6tdXFpRTJJWVl0UzQ)

###Velocity 4V Angular 6V
![](https://drive.google.com/uc?view&id=0B134T1DTCk6ta0NzY1BzcjJqcW8)

###Velocity 6V Angular 8V
![](https://drive.google.com/uc?view&id=0B134T1DTCk6tYzkwbk5FXzk0cEE)

###Velocity 8V Angular X
![](https://drive.google.com/uc?view&id=0B134T1DTCk6tZktqTEJLNXRqNkU)

----
## changelog
* 22-11-2016 first-write	
