#!/bin/sh

# Run this script after start_build.sh to launch fap_dev_env instance
DEV_USER=$USER;
if [ $USER = root ]; then
	ESP_IDF_USER=dev_user;
fi;
docker run --user $DEV_USER -v /tmp:/tmp -w /home/$DEV_USER/dev -it --rm fap_dev_env:latest sh
