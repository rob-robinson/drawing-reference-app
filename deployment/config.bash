#!/usr/bin/env bash

REPO_DIRECTORY=~/Desktop/flask-docker/flask-docker/deployment

SERVICE_PORT=80

DB_IMAGE='image-search-db-image'
DB_CONTAINER='image-search-db-container'

APP_IMAGE='image-search-app-image'
APP_CONTAINER='image-search-app-container'

NET_NAME='image-search-app-bridge'