#!/usr/bin/env bash

echo "System will install server features"


echo "System Upgrades repositories"
sudo apt-get update
echo "System install Htop"
sudo apt-get install htop
echo "System install git & clone system configurations"
sudo apt-get install git -y
sudo mkdir /sysrepo
sudo git clone git@github.com:amadeuszg22/iamg.git /sysrepo
echo "System copy keys"
sudo rsync -artvpolz /sysrepo/iamg/LB/config/.ssh/ /root/.ssh/
echo "System install nginx and configure it"
sudo apt-get install nginx -y
sudo rsync -artvpolz /sysrepo/iamg/LB/config/nginx/ /etc/nginx/
sudo /etc/init.d/nginx reload

