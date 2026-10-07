#!/bin/bash


export DEBIAN_FRONTEND=noninteractive

# Les vostres comandes de la Pt1.3
apt update -y
apt upgrade -y
sudo apt install -y docker.io
sudo systemctl enable --now docker

# ruta completa 
mkdir -p /home/ubuntu/minecraft-data

# para enchufar el minecraft del docker 
docker run -d \
  --name minecraft-server \
  --restart unless-stopped \
  -p 25565:25565 \
  -v ~/minecraft-data:/data \
  -e EULA=TRUE \
  -e ENABLE_AUTOPAUSE=FALSE \
  -e ONLINE_MODE=FALSE \
  -e MOTD="Server Rafael Subi" \
  itzg/minecraft-server
