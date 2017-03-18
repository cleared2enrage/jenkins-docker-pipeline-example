#! /bin/bash

CONTAINER_NAME=$1

CONTAINER_ID=`docker ps -qa --filter "name=$CONTAINER_NAME"`
if [ -n "$CONTAINER_ID" ] then
  docker stop $CONTAINER_ID
  docker rm $CONTAINER_ID
fi
