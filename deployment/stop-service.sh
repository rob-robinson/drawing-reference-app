#!/usr/bin/env bash

echo "=== stop and remove previous mysql container:"
docker stop $(docker ps -aqf "name=image-search-db-develop")
docker rm $(docker ps -aqf "name=image-search-db-develop")

echo "=== stop and remove previous web app container:"
docker stop $(docker ps -aqf "name=image-search-app-develop")
docker rm $(docker ps -aqf "name=image-search-app-develop")

echo "=== take down the network:"
docker network rm image-search-app-bridge
