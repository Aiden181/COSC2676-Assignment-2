#Import key from Jenkins
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo

sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key

#Install Java
sudo amazon-linux-extras install java-openjdk11

#Install Jenkins 
yum install jenkins

#Start Jenkin
service jenkins start

#Download and Extract Maven
cd /opt
wget https://dlcdn.apache.org/maven/maven-3/3.8.6/binaries/apache-maven-3.8.6-bin.tar.gz
tar -xvzf apache-maven-3.8.6-bin.tar.gz
mv apache
cd ~

#Install and start Docker
yum install docker -y
service docker start

#Remove all images
docker container prune

#Pull Tomcat image
docker pull tomcat

#Open container with interactive mode
docker exec -it tomcat-container /bin/bash

#Move files to Webapps Directory
cp -R webapps.dist/* webapps

#Exit Interacting with Container
exit

#Build Docker Image from Dockerfile
docker build -t my-tomcat-image .


docker run -d --name tomcat-container -p 8081:8080 my-tomcat-image

#Create User
useradd dockeradmin

#Create User Password
passwd dockeradmin

#Add user
usermod -aG docker dockeradmin to docker group

#Set PasswordAuthentication to Yes
sed -i 's/.*PasswordAuthentication.*/PasswordAuthentication yes/g' /etc/ssh/sshd_config\

#Restart SSH Service
service sshd reload

exit
