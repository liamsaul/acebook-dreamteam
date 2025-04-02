#!/bin/bash
set -e

# Load NVM
export NVM_DIR="/home/ec2-user/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Use the correct Node version
nvm use 23

# Start the server
cd /home/ec2-user/myapp
echo "Starting server in directory: $(pwd)"
echo "Node version: $(node -v)"
echo "Using nodemon from: $(which nodemon)"

# Start the application
npm run start