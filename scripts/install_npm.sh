#!/bin/bash
set -e

echo "Starting AfterInstall script..."

# Install NodeJs
curl -fsSL https://rpm.nodesource.com/setup_18.x | sudo bash -
sudo yum install -y nodejs

sudo npm cache clean --force
sudo npm init -y

# Install dependencies
cd /home/ec2-user/myapp
echo "Installing npm dependencies in $(pwd)..."
sudo npm install

# Install nodemon globally with specific version
echo "Installing nodemon globally..."
sudo npm install -g nodemon@latest

# Also install nodemon locally
echo "Installing nodemon locally..."
npm install --save-dev nodemon

# Install pm2 for server start
echo "Installing pm2 for automatic server start"
sudo npm install -g pm2

echo "AfterInstall script completed successfully."