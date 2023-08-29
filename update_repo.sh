#!/bin/bash
echo "Atualizando repositorios..." >> ~/update_repo.txt
cd ~/colcon_ws/src/new_update_repo
git pull
echo "atualizando repositorio git bumper_pkg." >> ~/update_repo.txt
cd ~/colcon_ws/src/bumper_pkg
git pull
echo "atualizando repositorio git servo_arm_pkg." >> ~/update_repo.txt
cd ~/colcon_ws/src/servo_arm_pkg
git pull
echo "atualizando repositorio git camera_servo_pkg." >> ~/update_repo.txt
cd ~/colcon_ws/src/camera_servo_pkg
git pull
echo "Repositórios atualizados." >> ~/update_repo.txt
date >> ~/update_repo.txt
