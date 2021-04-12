#!/bin/bash

export CONTAINER_NAME="shell"
export CONTAINER_IMAGE="eromangasensei/qshell"
export CONTAINER_OPTIONS="--name $CONTAINER_NAME -it -p 8022:22 $CONTAINER_IMAGE /sbin/sshd -D"