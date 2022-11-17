#!/bin/sh

# Common libraries
sudo apt install ros-noetic-gmapping
sudo apt-get install -y python-is-python3
sudo apt-get install -y python-testresources
pip install --upgrade setuptools

echo "-----------------------------------------------------"
echo "Enter the mobile platform number you want to install?"
echo "-----------------------------------------------------"
echo "1: Turtlebot3"
echo "2: Summit-XL Steel (Robotnik)"
echo "3: Summit-XL Steel (RIRO Lab)"
echo "-----------------------------------------------------"
read robot

# Install robot dependencies ------------------------------
if [[ "$robot" -eq 1 ]]
then
    echo "Install the Turtlebot3."
    sudo apt install ros-noetic-turtlebot3 ros-noetic-dwa-local-planner
fi

if [[ "$robot" -eq 2 ]]
then
    echo "Install the Summit-XL Steel."
    sudo apt-get install -y python3-vcstool ros-noetic-costmap-2d ros-noetic-twist-mux ros-noetic-robot-localization ros-noetic-mavros ros-noetic-amcl ros-noetic-imu-complementary-filter ros-noetic-move-base ros-noetic-rviz-plugin-tutorials ros-noetic-global-planner ros-noetic-teb-local-planner 
    # No version: ros-noetic-timed-roslaunch
    vcs import --input https://raw.githubusercontent.com/RobotnikAutomation/summit_xl_sim/melodic-master/doc/summit_xl_sim.repos 
    # No version: noetic-master   
fi

if [[ "$robot" -eq 3 ]]
then
    echo "Install the Summit-XL Steel (RIRO Lab Version)."
    ### Original
    sudo apt-get install -y python3-vcstool ros-noetic-costmap-2d ros-noetic-twist-mux ros-noetic-robot-localization 
    sudo apt-get install -y ros-noetic-mavros ros-noetic-amcl ros-noetic-imu-complementary-filter ros-noetic-move-base 
    sudo apt-get install -y ros-noetic-rviz-plugin-tutorials ros-noetic-global-planner ros-noetic-teb-local-planner 
    sudo apt-get install -y ros-noetic-ira-laser-tools ros-noetic-realsense2-description
    # No version: ros-noetic-timed-roslaunch ros-noetic-pddl-planner ros-noetic-pddl-planner-viewer
    ### New
    sudo apt-get install -y python3-catkin-tools ros-noetic-ros-control ros-noetic-ros-controllers ros-noetic-moveit
    sudo apt-get install -y ros-noetic-py-trees ros-noetic-py-trees-ros ros-noetic-rqt-py-trees 
    sudo apt-get install -y ros-noetic-trac-ik-python ros-noetic-velodyne* ros-noetic-pointcloud-to-laserscan 
    sudo apt-get install -y ros-noetic-trac-ik-kinematics-plugin
    sudo apt-get install -y ros-noetic-map-server
    ### Import repositories
    vcs import --input doc/summit_xl_riro_sim.repos    --workers 1
fi

# ---------------------------------------------------------

# Install default requirements
pip install -r requirements.txt


if [[ $SHELL == *"bash"* ]]; then 
	source /opt/ros/noetic/setup.bash
fi 

if [[ $SHELL == *"zsh"* ]]; then 
	source /opt/ros/noetic/setup.zsh
fi 

# rosdep install --from-paths src --ignore-src --rosdistro=noetic -y
# catkin build -c 
catkin build
