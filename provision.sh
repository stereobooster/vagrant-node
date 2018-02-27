#!/bin/bash

sudo echo "Europe/Berlin" | sudo tee /etc/timezone
sudo dpkg-reconfigure -f noninteractive tzdata

sudo apt-get update -y
sudo apt-get install -y build-essential curl git libssl-dev man

git clone https://github.com/creationix/nvm.git ~/.nvm && cd ~/.nvm && git checkout `git describe --abbrev=0 --tags`
echo "source ~/.nvm/nvm.sh" >> ~/.profile
source ~/.profile

nvm install 6.0
nvm alias default 6.0

echo "cd ~/projects" >> ~/.profile

ssh-keyscan github.com >> ~/.ssh/known_hosts

echo ""
echo "Everything done, have a nice day :-)!"
