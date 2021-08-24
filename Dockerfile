FROM nginx:alpine

## Step 1:
# Create a working directory
#WORKDIR /app

## Step 2:
# Copy source code to working directory
COPY index.html /usr/share/nginx/html

## Step 3:
# Install packages 
# hadolint ignore=DL3013

## Step 4:
# Expose port 80
EXPOSE 80

## Step 5:
# Run app
#CMD ["python", "app.py"]
#app.run(host='0.0.0.0'
#CMD ["flask", "run", "--host", "0.0.0.0"]
#CMD ["nginx", "--host", "0.0.0.0"]
