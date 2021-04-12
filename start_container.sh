#!/bin/bash

source config_container.sh

if docker container ls -a | grep $CONTAINER_NAME &> /dev/null;
then
    if docker container ls | grep $CONTAINER_NAME &> /dev/null;
    then
        echo $CONTAINER_NAME runtting
    else
        docker container start $CONTAINER_NAME
    fi
else
    echo $CONTAINER_NAME not fount
fi