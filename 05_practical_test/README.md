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

## result
![](https://drive.google.com/view?id=1--L6bD2Wg7o4vJPbwjY9xnrWfcLMokbplmrCRCetdjY)
----
## changelog
* 22-11-2016 first-write	
