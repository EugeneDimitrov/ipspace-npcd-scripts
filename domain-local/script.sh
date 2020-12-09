#!/bin/bash

#######################################
# Bash script to install nginx
#######################################

SITE_DOMAIN_NAME="domain.local"

echo #######################################
echo # Updating System
echo #######################################
sudo apt-get update -y && sudo apt-get upgrade -y

echo #######################################
echo # Installing Git, Nginx
echo #######################################
sudo apt install git nginx -y

echo #######################################
echo # Configure firewall rules
echo #######################################
sudo ufw allow 'Nginx HTTP'
sudo ufw allow 'OpenSSH'

echo #######################################
echo # Enable firewall
echo #######################################
sudo ufw --force enable

echo #######################################
echo # Create server block
echo #######################################
sudo mkdir -p /var/www/$SITE_DOMAIN_NAME/html
sudo chown -R $USER:$USER /var/www/$SITE_DOMAIN_NAME/html
sudo chmod -R 755 /var/www/$SITE_DOMAIN_NAME

cp index.html /var/www/$SITE_DOMAIN_NAME/html/
sudo cp $SITE_DOMAIN_NAME /etc/nginx/sites-available/
sudo ln -s /etc/nginx/sites-available/$SITE_DOMAIN_NAME /etc/nginx/sites-enabled/
sudo cp nginx.conf /etc/nginx/

echo #######################################
echo # Restart Nginx service
echo #######################################
sudo systemctl restart nginx
