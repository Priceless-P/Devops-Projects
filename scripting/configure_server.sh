#!/usr/bin/env bash
sudo apt-get update
sudo apt-get install nodejs -y
sudo apt-get install npm -y
sudo apt install mongodb
sudo apt install git -y

# Install docker
# Install dependencies
sudo apt install apt-transport-https ca-certificates curl software-properties-common -y

# Add Docker GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Set up the stable Docker repository
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Install Docker engine
sudo apt update
sudo apt install docker-ce docker-ce-cli containerd.io -y

# install docker compose
sudo apt  install docker-compose -y

# install pip
sudo apt install python3-pip -y