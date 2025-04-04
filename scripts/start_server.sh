#!/bin/bash
set -e

echo "Starting application..."

#!/bin/bash
cd /home/ec2-user/myapp
curl -fsSL https://rpm.nodesource.com/setup_18.x | sudo bash -
sudo yum install -y nodejs
sudo npm install -g pm2
pm2 start npm -- start
pm2 save
