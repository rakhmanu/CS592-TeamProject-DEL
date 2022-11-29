# CS592-TeamProject-DEL
This is a team project from the CS592 class.   

This repository requires Ubuntu 20.04 and ROS Noetic. You can install the ROS Noetic following instructions on http://wiki.ros.org/noetic/Installation/Ubuntu.
First, clone the repo and instantiate a catkin workspace in the root directory
~~~~bash
git clone https://github.com/rakhmanu/CS592-TeamProject-DEL.git
~~~~
## Experiment Setup
Please follow the commands: 
~~~~bash
cd CS592-TeamProject-DEL
su
source ./install.sh
~~~~

## Vision 
## Task Planning 

## Motion Planning

### Running a Summit XL Steel with a UR5e (i.e., Haetae)
You can run our Haetae robot.
~~~~bash
source ./robot.sh sim manip
roslaunch riro_bringup summit_xls_riro_complete_cs592class.launch
~~~~
### For loading the planning scene please ensure that the simulation is running and then
~~~~bash
source ./robot.sh sim manip
roslaunch pick_and_place demo_class.launch sim:=true perception_src:=gazebo
~~~~
### For controlling using rviz MoveIt! and visualizing the movement in gazebo for the gripper and the arm, launch the following file:
~~~~bash
source ./robot.sh sim manip
rosrun pick_and_place fake_grounding_publisher.py
~~~~

### To navigate, please run:

~~~~bash
rosrun teleop_twist_keyboard teleop_twist_keyboard.py
rostopic echo /cmd_vel
~~~~


