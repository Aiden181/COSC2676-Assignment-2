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

#Create tomcat container from my-tomcat-image
docker run -d --name tomcat-container -p 8081:8080 my-tomcat-image

#Create User
useradd dockeradmin

#Create User Password
passwd dockeradmin

#Add user to docker group
usermod -aG docker dockeradmin 

#Set PasswordAuthentication to Yes
sed -i 's/.*PasswordAuthentication.*/PasswordAuthentication yes/g' /etc/ssh/sshd_config

#Restart SSH Service
service sshd reload

exit
