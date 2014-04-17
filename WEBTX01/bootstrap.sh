#!/usr/bin/env bash

echo "System will install server features"


echo "System Upgrades repositories"
sudo apt-get update
echo "System install Htop"
sudo apt-get install htop -y
echo "System install git & clone system configurations"
sudo apt-get install git -y
sudo mkdir /sysrepo
sudo git clone git@github.com:amadeuszg22/iamg.git /sysrepo
echo "System copy keys"
sudo rsync -artvpolz /sysrepo/iamg/LB/config/.ssh/ /root/.ssh/
echo "System install Apache and configure it"
sudo apt-get install apache2 -y
sudo chmod a-rwx ~/.ssh/id_rsa
sudo chmod u+rw ~/.ssh/id_rsa
sudo /etc/init.d/apache2 reload
echo "System installs ajax explorer"
sudo echo "deb http://dl.ajaxplorer.info/repos/apt stable main
> deb-src http://dl.ajaxplorer.info/repos/apt stable main">> /etc/apt/sources.lis
sudo wget -O - http://dl.ajaxplorer.info/repos/charles@ajaxplorer.info.gpg.key | sudo apt-key add -
sudo apt-get update
sudo apt-get install pydio
sudo apt-get install php5-mysql
sudo cp /usr/share/doc/pydio/apache2.sample.conf /etc/apache2/sites-enabled/pydio.conf
sudo /etc/init.d/apache2 reload

