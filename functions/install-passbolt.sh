#!/bin/bash
#passbolt install file for Debian 11.

#copy configuration data
sudo cp data/docker-compose-ce.yaml docker-compose-ce.yaml
sudo cp data/traefik.yaml traefik.yaml
sudo cp -r data/conf conf/

#compose docker container
sudo docker compose -f docker-compose-ce.yaml up -d