#!/bin/bash
#Back to root folder
cd ~

#Install and start Docker
yum install docker -y
service docker start

#Pull Tomcat image
docker pull tomcat

#Move Dockerfile to Root Folder - Go Back to Root Folder
cd COSC2676-Assignment-2
mv Dockerfile /root
cd ~

#Build Docker Image from Dockerfile
docker build -t my-tomcat-image .


docker run -d --name tomcat-container -p 8081:8080 my-tomcat-image

#Open container with interactive mode
docker exec -it tomcat-container /bin/bash
