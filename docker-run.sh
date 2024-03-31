#!/bin/bash

echo "Running Docker container..."

container_name=${1:-"python-microservice-container"}
image_name=${2:-"python-microservice-image"}
image_tag=${3:-"v1.0.0"}

docker container stop $container_name
docker container rm $container_name

docker run \
    -p 8000:8000 \
    --name $container_name \
    $image_name:$image_tag \
    sh -c "uvicorn main.entrypoint.main:app --host 0.0.0.0 --port 8000"
