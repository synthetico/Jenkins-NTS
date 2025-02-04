#!/bin/bash
# Update packages
sudo yum update -y
sudo yum install wget -y

# Add the Jenkins repo
sudo wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo

# Import Jenkins key
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key

# Upgrade packages
sudo yum upgrade -y

# Install Java (Use yum instead of dnf for Amazon Linux 2)
sudo yum install java-17-amazon-corretto -y

# Grant Jenkins sudo permissions
echo "jenkins ALL=(ALL) NOPASSWD: ALL" | sudo tee -a /etc/sudoers

# Install Jenkins
sudo yum install jenkins -y

# Enable and start Jenkins
sudo systemctl enable jenkins
sudo systemctl start jenkins

# Install Git
sudo yum install git -y
