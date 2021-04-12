#!/bin/bash

source ./config_container.sh

if docker container ls | grep $CONTAINER_NAME &> /dev/null;
then
    docker container stop $CONTAINER_NAME
else
    echo $CONTAINER_NAME not start
fi