#!/bin/bash

# updating the system
sudo apt update -y && sudo apt upgrade -y

# Install Java (required for Jenkins)
sudo apt install openjdk-17-jre -y

#  verify Java installation
java -version

# Add Jenkins repository and key
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key


echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]" \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null

# Update packages and install jenkins
sudo apt-get update
sudo apt-get install jenkins

# start and enable Jenkins service
sudo systemctl start jenkins
sudo systemctl enable jenkins

# Verify the Jenkins status
sudo systemctl status jenkins

# Print the initial Jenkins passwor
sudo cat /var/lib/jenkins/secrets/initialAdminPassword

# Access Jenkin
echo "Access jenkins at : http://<your-server-ip>:8080"
