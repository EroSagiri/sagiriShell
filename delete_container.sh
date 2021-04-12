#!/bin/bash

source config_container.sh


if docker container ls -a | grep $CONTAINER_NAME &> /dev/null;
then
    

    if docker container ls | grep $CONTAINER_NAME &> /dev/null;
    then
        ./stop_container.sh
    fi

    docker container rm $CONTAINER_NAME
else
    echo $CONTAINER_NAME not fount
fi