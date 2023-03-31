#!/bin/sh

# pass -d to this script to restart the container in the background

docker stop "krishna.studio"
docker rm "krishna.studio"
docker rmi "krishnastudio-site-app"
docker-compose up $@
