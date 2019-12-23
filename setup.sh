#!/bin/bash

mkdir -p ~/catkin_ws/src
cd ~/catkin_ws/src
catkin_init_workspace
cd ~/catkin_ws/
catkin build
cd ~/catkin_ws/src
git clone https://github.com/DaikiMaekawa/ypspur.git
git clone https://github.com/open-rdc/orne_navigation
wstool init
wstool merge orne_navigation/orne_pkgs.install
wstool up
rosdep install --from-paths . --ignore-src --rosdistro $ROS_DISTRO -y
catkin build
sed -i -e 's/find_package(ypspur)/find_package(YPSpur)/g' ~/catkin_ws/src/icart_mini/icart_mini_driver/CMakeLists.txt
catkin build
sed -i -e 's/find_package(YPSpur)/find_package(ypspur)/g' ~/catkin_ws/src/icart_mini/icart_mini_driver/CMakeLists.txt
catkin build
catkin build
echo "source ~/catkin_ws/devel/setup.bash" >> ~/.bashrc
exit
