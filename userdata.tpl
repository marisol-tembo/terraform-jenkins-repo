#!/bin/bash
sudo dnf update
#installing jenkins
sudo wget -O /etc/yum.repos.d/jenkins.repo \
 https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
sudo dnf upgrade -y
sudo dnf install java-21-devel -y
sudo dnf install jenkins docker git -y 
sudo systemctl daemon-reload
systemctl start jenkins
systemctl enable jenkins
systemctl start docker
systemctl enable docker
sudo usermod -aG docker jenkins
chmod 640 /etc/sudoers.d/90-cloud-init-users
echo "jenkins ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/90-cloud-init-users
chmod 440 /etc/sudoers.d/90-cloud-init-users