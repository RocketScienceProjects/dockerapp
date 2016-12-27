#!/bin/bash
docker -v
result=$?

if [ $result -ne 0 ]; then 
   echo "docker not installed"
else 
   echo "docker installed"
fi