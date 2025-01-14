cd ~

#Import Repository and Key
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key

#Install Java
sudo amazon-linux-extras install java-openjdk11

#Install Jenkin
yum install jenkins

#Start Jenkins
service jenkins start

#Download and Extract Maven
cd /opt
wget https://dlcdn.apache.org/maven/maven-3/3.8.6/binaries/apache-maven-3.8.6-bin.tar.gz
tar -xvzf apache-maven-3.8.6-bin.tar.gz
mv apache-maven-3.8.6 maven
cd ~

#Get Default Admin Password
cat /var/lib/jenkins/secrets/initialAdminPassword
