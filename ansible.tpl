#!/bin/bash
sudo dnf update
sudo dnf install ansible -y
sudo useradd ansible -m 
chmod 640 /etc/sudoers.d/90-cloud-init-users
echo "ansible ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/90-cloud-init-users
chmod 440 /etc/sudoers.d/90-cloud-init-users