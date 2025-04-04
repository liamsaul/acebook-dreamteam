#!/bin/bash
set -e

echo "Starting application..."

# # Load NVM
# export NVM_DIR="/home/ec2-user/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# # Use the correct Node version
# nvm use 23

# # Start the server
# cd /home/ec2-user/myapp || { echo "Failed to change directory"; exit 1; }
# echo "Starting server in directory: $(pwd)"
# echo "Node version: $(node -v)"

# # Create logs directory if it doesn't exist
# mkdir -p /home/ec2-user/logs
# sudo chown ec2-user:ec2-user /home/ec2-user/logs
# sudo chmod 775 /home/ec2-user/logs

# # Try to find nodemon
# NODEMON_PATH=$(which nodemon)
# echo "Using nodemon from: $NODEMON_PATH"

# # Run the application in the background as ec2-user
# if nodemon --version >/dev/null 2>&1; then
#   echo "Nodemon working properly, starting application in background..."
#   sudo -u ec2-user nohup npm run start > /home/ec2-user/logs/app.log 2>&1 &
# else
#   echo "Nodemon not working properly, starting with node directly..."
#   # Find the www file
#   if [ -f "./bin/www" ]; then
#     echo "Starting application with node directly in background..."
#     sudo -u ec2-user nohup node ./bin/www > /home/ec2-user/logs/app.log 2>&1 &
#   else
#     # Find a main file from package.json
#     MAIN_FILE=$(node -e "console.log(require('./package.json').main || 'index.js')")
#     echo "Starting $MAIN_FILE with node in background..."
#     sudo -u ec2-user nohup node $MAIN_FILE > /home/ec2-user/logs/app.log 2>&1 &
#   fi
# fi

# # Store the process ID in /tmp to avoid permission issues
# echo $! > /tmp/app.pid
# echo "Application started in background with PID: $(cat /tmp/app.pid)"

# # Give the application a moment to start and see if it crashes immediately
# sleep 5

# # Check if process is still running
# if ps -p $(cat /tmp/app.pid) > /dev/null; then
#   echo "Application successfully started and running."
# else
#   echo "WARNING: Application may have crashed after starting. Check logs at /home/ec2-user/logs/app.log"
#   # Don't exit with error, let CodeDeploy continue
# fi

# echo "ApplicationStart script completed."

#!/bin/bash
cd /home/ec2-user/my-app
npm install
pm2 start npm -- start
pm2 save
