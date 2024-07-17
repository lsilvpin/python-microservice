#!/bin/bash

function throw_error_if_need() {
    if [ $? -ne 0 ]; then
        echo "An error ocurred"
        exit 1
    fi
}

echo "Running Docker container..."

container_name=${1:-"my-api-container"}
image_name=${2:-"my-api-image"}
image_tag=${3:-"v1.0.0"}
port=${4:-"32003"}

has_container=$(docker ps -a --format '{{.Names}}' | grep $container_name)

if [ ! -z "$has_container" ]; then
    docker container stop $container_name
    docker container rm $container_name
fi

docker run -d \
    --cap-add=NET_ADMIN \
    --device /dev/net/tun \
    -p $port:8000 \
    --name $container_name \
    $image_name:$image_tag \
    sh -c "uvicorn main.entrypoint.main:app --host 0.0.0.0 --port 8000 --log-level debug"

throw_error_if_need

timeout_sec=15
counter=0
while [ $(docker container inspect -f '{{.State.Running}}' $container_name) != "true" ]; do
    echo "Waiting for container to be ready..."
    sleep 1
    counter=$((counter+1))
    if [ $counter -eq $timeout_sec ]; then
        echo "Timeout reached"
        exit 1
    fi
done
