#!/bin/bash
set -e

echo "Starting application..."

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

# Try to find nodemon
NODEMON_PATH=$(which nodemon)
echo "Using nodemon from: $NODEMON_PATH"

# Check if we can run nodemon directly
if nodemon --version >/dev/null 2>&1; then
  echo "Nodemon working properly, starting application..."
  npm run start
else
  echo "Nodemon not working properly, starting with node directly..."
  # Find the www file
  if [ -f "./bin/www" ]; then
    echo "Starting application with node directly..."
    node ./bin/www
  else
    echo "Looking for alternate start scripts..."
    # Find a main file from package.json
    MAIN_FILE=$(node -e "console.log(require('./package.json').main || 'index.js')")
    echo "Starting $MAIN_FILE with node..."
    node $MAIN_FILE
  fi
fi