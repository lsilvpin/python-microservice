#!/bin/bash

function throw_error_if_need() {
    if [ $? -ne 0 ]; then
        echo "An error occurred"
        exit 1
    fi
}

echo "Pushing Docker image to AWS..."

ecr_name="my-api-image"

# Obter a URI do repositório ECR
ecr_uri=$(aws ecr describe-repositories --repository-name $ecr_name --query "repositories[0].repositoryUri" --output text)
throw_error_if_need

# Definir nome e tag da imagem
image_name=${1:-"my-api-image"}
image_tag=${2:-"v1.0.0"}
echo "Local image: $image_name:$image_tag"

remote_image_and_tag="$ecr_uri:$image_tag"
echo "Remote image: $remote_image_and_tag"

# Taguear a imagem local para o repositório remoto
docker tag $image_name:$image_tag $remote_image_and_tag
throw_error_if_need

# Enviar a imagem para o ECR
docker push $remote_image_and_tag
throw_error_if_need

echo "Docker image pushed successfully."
