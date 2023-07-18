#!/bin/bash

echo "Выполнение предварительных команд или скриптов..."

docker kill $(docker ps -q)
docker rm portainer


docker volume create portainer_data
# docker compose run portainer
docker run -d -p 8000:8000 -p 9443:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest
# docker volume create lamp_portainer_data

sleep 5

docker compose up -d