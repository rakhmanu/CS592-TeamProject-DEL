# CS592-TeamProject-DEL
This is a team project from the CS592 class.   

This repository requires Ubuntu 20.04 and ROS Noetic. You can install the ROS Noetic following instructions on http://wiki.ros.org/noetic/Installation/Ubuntu.
First, clone the repo and instantiate a catkin workspace in the root directory
~~~~bash
git clone https://github.com/rakhmanu/CS592-TeamProject-DEL.git
~~~~

Please follow the commands: 
~~~~bash
cd CS592-TeamProject-DEL
su
source ./install.sh
~~~~

## Running a Summit XL Steel with a UR5e (i.e., Haetae)
You can run our Haetae robot.
~~~~bash
source ./robot.sh sim manip
roslaunch riro_bringup summit_xls_riro_complete.launch
~~~~
