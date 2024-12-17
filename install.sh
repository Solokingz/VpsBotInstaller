#!/bin/bash
apt install wget -y
clear

echo "ᴍᴀᴋᴇᴅ ʙʏ - 𝖘𝖔𝖑𝖔𝖟𝖎𝖕"

echo Create Your Own Free VPS Hosting!

read -p "Are you sure you want to continue? Agree to create or not? (y/n): " -n 1 -r
echo

if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "Installation aborted."
    exit 1
fi

clear

echo "Install python3-pip and docker."
sudo apt update
sudo apt install -y python3 python3-pip docker.io
echo "Installation successful"

clear

echo "Install the necessary files"
wget https://raw.githubusercontent.com/Solokingz/VpsBotFiles/refs/heads/main/Dockerfile1
wget https://raw.githubusercontent.com/Solokingz/VpsBotFiles/refs/heads/main/Dockerfile2
wget https://raw.githubusercontent.com/Solokingz/VpsBotFiles/refs/heads/main/main.py
echo "Installation successful"

clear

echo "Install the downloaded files"
docker build -t ubuntu-22.04-with-tmate -f Dockerfile1 . && docker build -t debian-with-tmate -f Dockerfile2 .
pip install docker discord

clear

echo "Enter discord bot token"
read -r TOKEN
echo "Updating main.py with provided Discord bot token..."
sed -i "s/TOKEN = ''/TOKEN = '$TOKEN'/" main.py

clear

echo "Let's start botting"
echo "python3 main.py"
python3 main.py
