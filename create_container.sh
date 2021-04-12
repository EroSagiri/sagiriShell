#!/bin/bash

source config_container.sh

if docker container ls -a | grep $CONTAINER_NAME &> /dev/null;
then
    echo $CONTAINER_NAME
else
    docker container create $CONTAINER_OPTIONS
fi