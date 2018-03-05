#!/usr/bin/env bash

REPO_DIRECTORY=~/Desktop/flask-docker/flask-docker/deployment

echo "=== Create The Image Search Service ===:"

echo "Step One:"

requested_port=80

echo "=== stop and remove previous mysql container:"
docker stop $(docker ps -aqf "name=image-search-db-container")
docker rm $(docker ps -aqf "name=image-search-db-container")

echo "=== stop and remove previous web app container:"
docker stop $(docker ps -aqf "name=image-search-app-container")
docker rm $(docker ps -aqf "name=image-search-app-container")

echo "=== set up network:"
docker network rm image-search-app-bridge
docker network create image-search-app-bridge

echo "=== build mysql:"
docker build \
    -t image-search-db-image \
    ./db/

echo "=== run the mysql container: ( this can take a long time if you have a bigger database 1G/Min or so... )"
docker run \
    --name image-search-db-container \
    -p 3306:3306 \
    --network image-search-app-bridge \
    -d \
    image-search-db-image

sleep 10

echo "=== build app:"
docker build \
    -t image-search-app-image \
    ./app/

echo "===== run the app container:"
docker run \
    --name image-search-app-container \
    -p ${requested_port}:5000 \
    --network image-search-app-bridge \
    -v ${REPO_DIRECTORY}/app_src/:/app/:ro \
    -d \
    image-search-app-image
