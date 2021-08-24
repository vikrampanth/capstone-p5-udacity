#!/usr/bin/env bash

## Complete the following steps to get Docker running locally

# Step 1:
# Build image and add a descriptive tag
docker build -t vikrampanth/capstone-image .

# Step 2: 
# List docker images
docker image ls

# Step 3: 
# Run app, but commented as Kube will be used to start the app
docker run -d -p 8080:80 vikrampanth/capstone-image
