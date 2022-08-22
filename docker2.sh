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

cd ~
