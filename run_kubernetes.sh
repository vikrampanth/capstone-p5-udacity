#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
# dockerpath=<>
dockerpath="vikrampanth/mlapp"

# Step 2
# Run the Docker Hub container with kubernetes
kubectl run mlappp4 --image=$dockerpath --port=80 --labels app=mlappp4
#kubectl create deployment my-mlapp --image=$dockerpath --port=80 --labels app=my-mlapp
#kubectl create deployment my-mlapp --image=vikrampanth/mlapp --port=80 --labels app=my-mlapp

# Step 3:
# List kubernetes pods
kubectl get pods

# Step 4:
# Forward the container port to a host
kubectl port-forward mlappp4 8000:80
