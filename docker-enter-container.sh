#!/bin/bash

CONTAINER=$(docker inspect --format '{{.State.Pid}}' `docker ps | grep $1 | head -c 12`)
echo $CONTAINER
sudo nsenter --target $CONTAINER --mount --uts --ipc --net --pid