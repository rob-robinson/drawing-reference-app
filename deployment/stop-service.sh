#!/usr/bin/env bash

echo "=== stop and remove previous mysql container:"
docker stop $(docker ps -aqf "name=image-search-db-container")
docker rm $(docker ps -aqf "name=image-search-db-container")

echo "=== stop and remove previous web app container:"
docker stop $(docker ps -aqf "name=image-search-app-container")
docker rm $(docker ps -aqf "name=image-search-app-container")

echo "=== take down the network:"
docker network rm image-search-app-bridge
