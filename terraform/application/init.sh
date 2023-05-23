#!/bin/bash
# Update the Server
sudo apt update && sudo apt upgrade -y

# Install and configure Nginx
sudo apt install nginx
sudo systemctl start nginx
sudo systemctl enable nginx

# Install Dependancies
sudo apt install python3-pip python3-dev poetry build-essential libssl-dev libffi-dev python3-setuptools