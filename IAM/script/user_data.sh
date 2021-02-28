#!/bin/bash
# Update packages
yum update -y 

# Install nginx 
amazon-linux-extras install nginx1 -y 

# Enable and start nginx service 
systemctl enable --now nginx