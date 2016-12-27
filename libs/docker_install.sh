#!/bin/bash
sudo docker -v
result=$?

if [ $result -ne 0 ]; then 
   echo "docker not installed"
   exit 1
else 
   echo "docker installed"
fi