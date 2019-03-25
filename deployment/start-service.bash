#!/usr/bin/env bash

source config.bash

echo "=== Create The Image Search Service ===:"

echo "=== stop and remove previous mysql container:"
docker stop $(docker ps -aqf "name=${DB_CONTAINER}")
docker rm $(docker ps -aqf "name=${DB_CONTAINER}")

echo "=== stop and remove previous web app container:"
docker stop $(docker ps -aqf "name=${APP_CONTAINER}")
docker rm $(docker ps -aqf "name=${APP_CONTAINER}")

echo "=== set up network:"
docker network rm ${NET_NAME}
docker network create ${NET_NAME}

echo "=== build mysql:"
docker build \
    -t ${DB_IMAGE} \
    ./db/

echo "=== run the mysql container: ( this can take a long time if you have a bigger database 1G/Min or so... )"
docker run \
    --name ${DB_CONTAINER} \
    -p 3306:3306 \
    --network ${NET_NAME} \
    -d \
    ${DB_IMAGE}

sleep 10

echo "=== build app:"
docker build \
    -t ${APP_IMAGE} \
    ./app/

echo "===== run the app container:"
docker run \
    --name ${APP_CONTAINER} \
    -p ${SERVICE_PORT}:5000 \
    --network ${NET_NAME} \
    -d \
    ${APP_IMAGE}
#    -v ${REPO_DIRECTORY}/app_src/:/app/:ro \
