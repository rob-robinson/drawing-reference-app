#!/usr/bin/env bash

REPO_DIRECTORY="/Users/robrobinson/search-appprojects/another_docker_attempt"
ECBM_DIRECTORY="/Users/robrobinson/search-appprojects/ecbm/easycbm-district"


echo "=== Create The Image Search Service ===:"

echo "Step One:"

#echo -n "Do you want to get a fresh version of the database (y/n) ? "
#read step_one

#if [[ $step_one == y* ]]; then

#else
#    echo "No fresh database ... moving on ..."
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


echo "=== run the mysql container: ( this can take a long time, watch the logs, up to 10 minutes the first time... )"
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
    -p 80:5000 \
    --network image-search-app-bridge \
    -d \
    image-search-app-image




