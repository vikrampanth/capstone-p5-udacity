#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub

# Assumes that an image is built via `run_docker.sh`

# Step 1:
# Create dockerpath; use the Docker hub name before the image name
# dockerpath=<your docker ID/path>
dockerpath="vikrampanth/capstone-image"

# Step 2:  
# Authenticate & tag
echo "Docker ID and Image: $dockerpath"
echo $DOCKER_HUB_PASSWORD | docker login --username vikrampanth --password-stdin
docker tag capstone-image $dockerpath

# Step 3:
# Push image to a docker repository
docker image push $dockerpath
