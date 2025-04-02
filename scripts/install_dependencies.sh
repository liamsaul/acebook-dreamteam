#!/bin/bash
set -e  # Exit on any error

# Update system packages
sudo yum update -y

# Install NVM if not installed
if [ ! -d "$HOME/.nvm" ]; then
    echo "Installing NVM..."
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.4/install.sh | bash
else
    echo "NVM is already installed."
fi

# Load NVM into the shell session
# Install Node.js 23
echo "Installing Node.js 23..."
nvm install 23

# Ensure the app directory exists
APP_DIR="/home/ec2-user/app"
if [ ! -d "$APP_DIR" ]; then
    mkdir -p "$APP_DIR"
    echo "Created $APP_DIR directory."
fi

# Move to app directory and install npm dependencies
cd "$APP_DIR"
npm init -y
npm install

# Install and start MongoDB
echo "[mongodb-org-8.0]
name=MongoDB Repository
baseurl=https://repo.mongodb.org/yum/amazon/2023/mongodb-org/8.0/aarch64/
gpgcheck=1
enabled=1
gpgkey=https://pgp.mongodb.com/server-8.0.asc" | sudo tee /etc/yum.repos.d/mongodb-org-8.0.repo

sudo yum install -y mongodb-org

sudo systemctl start mongod
