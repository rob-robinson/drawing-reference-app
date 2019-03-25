#!/usr/bin/env bash

source config.bash

echo "=== stop and remove previous mysql container:"
docker stop $(docker ps -aqf "name=${DB_CONTAINER}")
docker rm $(docker ps -aqf "name=${DB_CONTAINER}")

echo "=== stop and remove previous web app container:"
docker stop $(docker ps -aqf "name=${APP_CONTAINER}")
docker rm $(docker ps -aqf "name=${APP_CONTAINER}")

echo "=== take down the network:"
docker network rm ${NET_NAME}
