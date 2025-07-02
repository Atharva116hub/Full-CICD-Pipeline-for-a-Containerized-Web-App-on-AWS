#!/bin/bash

# Update the system
sudo yum update -y

# Install Java (required by Jenkins)
sudo amazon-linux-extras enable corretto11
sudo yum install -y java-11-amazon-corretto

# Install Git
sudo yum install -y git

# Install Docker
sudo yum install -y docker
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker ec2-user

# Install Jenkins
sudo wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo

sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key

sudo yum install -y jenkins

# Start and enable Jenkins
sudo systemctl start jenkins
sudo systemctl enable jenkins

# Allow Jenkins through the firewall (optional, if using firewalld)
# sudo firewall-cmd --permanent --zone=public --add-port=8080/tcp
# sudo firewall-cmd --reload

echo "Jenkins installed successfully. Access it via http://<EC2-IP>:8080"

