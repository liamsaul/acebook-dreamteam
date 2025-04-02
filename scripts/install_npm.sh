#!/bin/bash
set -e

# Load NVM for the ec2-user
export NVM_DIR="/home/ec2-user/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Install Node.js 23
echo "Installing Node.js 23..."
nvm install 23
nvm use 23
nvm alias default 23

# Verify node is available
node -v
npm -v

# Install npm dependencies
cd /home/ec2-user/myapp
npm install

# Install nodemon globally to fix the path issue
npm install -g nodemon

# Fix permissions
chmod -R 755 /home/ec2-user/myapp/node_modules