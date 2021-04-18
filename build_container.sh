#!/bin/bash

source config_container.sh

docker build -t $CONTAINER_IMAGE .
