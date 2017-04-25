#!/usr/bin/env bash


mysql -u root -p -e "CREATE USER 'image_storage'@'%' IDENTIFIED BY 'image_storage'; create database image_storage; GRANT ALL ON image_storage.* TO 'image_storage'@'localhost';"

mysql -u root image_storage < setup.sql