#!/bin/bash
sudo docker -v
result=$?

if [ $result -ne 0 ]; then 
   echo "docker not installed"
   #exit 1
   
   echo "installing docker on CentOS" 
   curl -fsSL https://get.docker.com/ | sh
   echo "enabling the docker service"
   sudo systemctl enable docker.service
   echo "starting the docker service"
   sudo systemctl start docker
    echo "testing the docker service"
   sudo docker run --rm hello-world
   
else 
   echo "docker installed"
fi

