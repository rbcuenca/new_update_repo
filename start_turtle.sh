#!/bin/bash
#cd /home/ubuntu/colcon_ws/src/new_update_repo/
#git pull
#sleep 3
screen -dmS ROBO bash
#screen -S ROBO -X screen -t UPDATE_REPO bash -ic "bash /home/ubuntu/colcon_ws/src/new_update_repo/update_repo.sh"
sleep 1
#screen -S ROBO -X screen -t RASPICAM bash -ic "ros2 run v4l2_camera v4l2_camera_node"
#sleep 5
screen -S ROBO -X screen -t REALSENSE2 bash -ic "ros2 run realsense2_camera realsense2_camera_node"
sleep 5
screen -S ROBO -X screen -t LIDAR bash -ic "ros2 launch turtlebot3_bringup robot.launch.py"
sleep 2
screen -S ROBO -X screen -t SERVOCAM bash -ic "ros2 launch camera_servo_pkg camera_servo.launch.py"
sleep 1
screen -S ROBO -X screen -t SERVOARM bash -ic "ros2 launch servo_arm_pkg servo_arm.launch.py"
sleep 1
screen -S ROBO -X screen -t BUMPER bash -ic "ros2 launch bumper_pkg bumper.launch.py"
sleep 2
screen -S ROBO -X screen -t TELINHA bash -ic "/usr/bin/python /home/ubuntu/turtlebot3_ws/src/new_update_repo/menu.py"
sleep 1
screen -S ROBO -X screen -t BEEP bash -ic "rostopic pub -1 /sound turtlebot3_msgs/Sound 'value: 1'"


echo 0
