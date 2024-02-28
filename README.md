# new_update_repo

Este repositório é uma adaptação do original criado pelo Prof. Arnaldo Jr. (https://github.com/arnaldojr/new_repo.git) para o ROS2 Humble.

Instruções para atualização automatica dos repostitorios do robo fisico turtlebot3.

acessar via SSH o robô e rodar os comandos abaixo:

    cd ~/colcon_ws/src
    git clone https://github.com/rbcuenca/new_update_repo.git
    cd ~/new_update_repo
    ./script.sh


## O que esta sendo feito:

    repositorios para atualização automatica bumper, servo_camera, servo_arm
    restart do serviços 

# Para restart apenas dos serviços do robô

    sudo systemctl restart start_turtle.service
    sudo systemctl restart telinha.service
    
  
