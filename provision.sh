#!/bin/bash

sudo echo "Europe/Berlin" | sudo tee /etc/timezone
sudo dpkg-reconfigure -f noninteractive tzdata

sudo apt-get update -y
sudo apt-get install -y build-essential curl git libssl-dev man

git clone https://github.com/creationix/nvm.git ~/.nvm && cd ~/.nvm && git checkout `git describe --abbrev=0 --tags`
echo "source ~/.nvm/nvm.sh" >> ~/.profile
source ~/.profile

# LTS is v6.9.0
# current in travis v6.12.3
# nvm install 6 installs v6.13
nvm install 6.12.3
nvm alias default 6.12.3
# npm install npm@5.6.0 -g

echo "cd ~/projects" >> ~/.profile

ssh-keyscan github.com >> ~/.ssh/known_hosts

node --version
npm --version
nvm --version

echo ""
echo "Everything done, have a nice day :-)!"
