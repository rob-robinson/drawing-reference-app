#!/usr/bin/env bash

echo "=== Create The Image Search Service ===:"

echo "Step One:"

#echo -n "Port to serve on: (80) ? "
#read requested_port

requested_port=80

#if [[ requested_port == "" ]]; then
#    requested_port = 80
#else
    #requested_port =
#fi

# ============================================

echo "=== stop and remove previous mysql container:"
docker stop $(docker ps -aqf "name=image-search-db-develop")
docker rm $(docker ps -aqf "name=image-search-db-develop")

echo "=== stop and remove previous web app container:"
docker stop $(docker ps -aqf "name=image-search-app-develop")
docker rm $(docker ps -aqf "name=image-search-app-develop")

echo "=== set up network:"
docker network rm image-search-app-bridge
docker network create image-search-app-bridge

echo "=== build mysql:"
docker build \
    -t image-search-db-image \
    ./db/

echo "=== run the mysql container: ( this can take a long time if you have a bigger database 1G/Min or so... )"
docker run \
    --name image-search-db-develop \
    -p 3306:3306 \
    --network image-search-app-bridge \
    -d \
    image-search-db-image

echo "=== build app:"
docker build \
    -t image-search-app-image \
    ./app/

echo "===== run the app container:"
docker run \
    --name image-search-app-develop \
    -p ${requested_port}:5000 \
    --network image-search-app-bridge \
    -d \
    image-search-app-image
