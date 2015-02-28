#!/usr/bin/env bash

sudo apt-get update

# Include both emacs and vim
sudo apt-get install -y vim
sudo apt-get install -y emacs

# install git
sudo apt-get install -y git

sudo apt-get install -y apache2
sudo a2enmod rewrite

# Set up which directory apache uses 
if [ ! -h /var/www ];
then
	sudo rm -rf /var/www
	sudo ln -fs /vagrant /var/www
	sudo a2enmod rewrite
	sudo service apache2 restart
fi

# Make a symbolic link to the /vagrant directory
if [ ! -h ~/shared ];
then 
	sudo ln -s /vagrant/ shared
fi

# install mysql
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password password'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password password'
sudo apt-get install -y mysql-server
sudo apt-get install -y mysql-client

sudo apt-get install -y php5 php5-curl php5-gd

sudo service apache2 restart




