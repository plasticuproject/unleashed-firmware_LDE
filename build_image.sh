#!/bin/sh

# Check for and update exiting build environment image
echo "[/] Checking for existing fap_dev_env docker image...";
if [ ! -z $(docker images | grep fap_dev_env | head -n 1 | cut -d " " -f 1) ]; then
	echo "[!] fap_dev_env image found..."
	echo "[/] Removing image...";
        docker rmi fap_dev_env;
	echo "";
fi;

# Set username and build image
echo "[/] Building new fap_dev_env docker image...";
DEV_USER=$USER
if [ $USER = root ]; then
	DEV_USER=dev_user;
fi;
docker build --no-cache --build-arg DEV_USER=$DEV_USER -t fap_dev_env .
