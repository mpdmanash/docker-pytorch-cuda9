#!/usr/bin/env bash
TAG="latest"
DOCKER_NAME=pytorch-cuda9
DOCKER_CONTAINER_NAME=$DOCKER_NAME

QT_GRAPHICSSYSTEM="native"
xhost + > /dev/null
echo "stopping container $DOCKER_CONTAINER_NAME"
docker stop $DOCKER_CONTAINER_NAME &> /dev/null
sleep 1
echo "removing container $DOCKER_CONTAINER_NAME"
docker rm $DOCKER_CONTAINER_NAME &> /dev/null
sleep 1


GPU=0
echo "launching docker image $DOCKER_NAME at tag $TAG as $DOCKER_CONTAINER_NAME"

echo "running docker"
docker run --privileged -d -e "DISPLAY=unix:0.0" -v "/tmp/.X11-unix:/tmp/.X11-unix:rw"  -v "/tmp:/tmp:rw" -v "/dev:/dev:rw" \
    -h ${DOCKER_CONTAINER_NAME} \
    --gpus all \
    -v $OCTOPUS_ROOT:/home:rw \
    --env DOCKER_NAME=$DOCKER_NAME \
    --name $DOCKER_CONTAINER_NAME $DOCKER_NAME:$TAG \
    tail -f /dev/null
echo "Done."
