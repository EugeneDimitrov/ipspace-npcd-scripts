#!/bin/bash

#######################################
# Bash script to install nginx
#######################################

SITE_DOMAIN_NAME="domain.local"

echo "Updating System..."
sudo apt-get update -y && sudo apt-get upgrade -y

echo "Installing Git, Nginx..."
sudo apt install git nginx -y

echo "Configure firewall rules..."
sudo ufw allow 'Nginx HTTP'
sudo ufw allow 'OpenSSH'

echo "Enable firewall..."
sudo ufw --force enable

echo "Create server block"
sudo mkdir -p /var/www/$SITE_DOMAIN_NAME/html
sudo chown -R $USER:$USER /var/www/$SITE_DOMAIN_NAME/html
sudo chmod -R 755 /var/www/$SITE_DOMAIN_NAME

cp index.html /var/www/$SITE_DOMAIN_NAME/html/
sudo cp $SITE_DOMAIN_NAME /etc/nginx/sites-available/
sudo ln -s /etc/nginx/sites-available/$SITE_DOMAIN_NAME /etc/nginx/sites-enabled/
sudo cp nginx.conf /etc/nginx/

echo "Restart Nginx service"
sudo systemctl restart nginx
