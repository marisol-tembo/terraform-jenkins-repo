#!/bin/bash
sudo dnf update
curl -sfL https://get.k3s.io | sh - 
# Check for Ready node, takes ~30 seconds 
sudo k3s kubectl get node 
sudo dnf install docker -y
sudo systemctl start docker
sudo systemctl enable docker
sudo useradd ansible -m 
chmod 640 /etc/sudoers.d/90-cloud-init-users
echo "ansible ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/90-cloud-init-users
chmod 440 /etc/sudoers.d/90-cloud-init-users