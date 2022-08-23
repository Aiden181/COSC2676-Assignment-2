#!/bin/bash
#Back to root folder
cd ~

#Create Dockerfile
touch Dockerfile
echo FROM tomcat:latest >> Dockerfile
echo RUN cp -R /usr/local/tomcat/webapps.dist/* /usr/local/tomcat/webapps >> Dockerfile
echo COPY ./*.war /usr/local/tomcat/webapps >> Dockerfile;

docker kill $(docker ps -q)
docker system prune
docker build -t tomcat:v2 .
docker run -d --name tomcat-v2 -p 8081:8080 tomcat:v2
