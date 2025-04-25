#!/bin/sh
# script adaptado para o turtlebot rodando ROS2

echo "Atualizando start_turtle.sh"
sudo rm -rf /usr/bin/start_turtle.sh
sudo cp ~/turtlebot3_ws/src/new_update_repo/start_turtle.sh /usr/bin/start_turtle.sh
sudo rm -rf /lib/systemd/system/start_turtle.service
sudo rm -rf /lib/systemd/system/telinha.service
sudo cp ~/turtlebot3_ws/src/new_update_repo/start_turtle.service /lib/systemd/system/
sudo cp ~/turtlebot3_ws/src/new_update_repo/telinha.service /lib/systemd/system/


echo "Restart dos serviços do robo"
sudo systemctl stop start_turtle.service
sudo systemctl stop telinha.service
sudo systemctl start start_turtle.service
sudo systemctl start telinha.service
sudo systemctl enable start_turtle.service
sudo systemctl enable telinha.service

echo "habilitando o hotspot"
sudo apt  install network-manager
sudo cp enableHotSpot.sh /usr/bin/enableHotSpot.sh
sudo cp enableHotSpot.service /lib/systemd/system/

sudo systemctl stop enableHotSpot.service
sudo systemctl start enableHotSpot.service
sudo systemctl enable enableHotSpot.service
sudo systemctl daemon-reload
echo "Fim"
