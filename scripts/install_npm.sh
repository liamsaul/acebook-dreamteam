#!/bin/bash
set -e

echo "Starting AfterInstall script..."

# # Load NVM for the ec2-user
# export NVM_DIR="/home/ec2-user/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# # Install Node.js 23
# echo "Installing Node.js 23..."
# nvm install 23
# nvm use 23
# nvm alias default 23

# # Verify node is available
# echo "Node version: $(node -v)"
# echo "NPM version: $(npm -v)"

# # Remove any problematic nodemon installations
# echo "Cleaning any existing nodemon installations..."
# npm uninstall -g nodemon || true
# rm -rf /home/ec2-user/myapp/node_modules/nodemon || true
# rm -f /home/ec2-user/myapp/node_modules/.bin/nodemon || true

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

# # Check nodemon installation
# echo "Nodemon version: $(nodemon --version || echo 'Not installed correctly')"

# # Fix permissions
# echo "Setting proper permissions..."
# chmod -R 755 /home/ec2-user/myapp/node_modules

echo "AfterInstall script completed successfully."