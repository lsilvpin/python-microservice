#!/bin/bash

function throw_error_if_need() {
    if [ $? -ne 0 ]; then
        echo "An error ocurred"
        exit 1
    fi
}

image_name=${1:-"my-api-image"}
image_tag=${2:-"v1.0.0"}
tests_container_name=${3:-"my-api-tests-container"}

has_contianer=$(docker ps -a --format '{{.Names}}' | grep $tests_container_name)

if [ ! -z "$has_contianer" ]; then
    docker container stop $tests_container_name
    docker container rm $tests_container_name
fi

echo "Running tests in Docker container..."

docker run \
    --name $tests_container_name \
    $image_name:$image_tag \
    sh -c "pytest -k . --capture=no"

throw_error_if_need

echo "Tests ran successfully."
