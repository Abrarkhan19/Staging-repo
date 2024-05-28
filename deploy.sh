#!/bin/bash

# Pull the latest image
docker pull $1/my-express-app:latest

# Stop and remove the existing container if it exists
docker stop my-express-app || true
docker rm my-express-app || true

# Run the new container with environment variables
docker run -d -p 80:8086 --name my-express-app \
  -e PORT=$2 \
  -e SECRET_KEY=$3 \
  -e MONGO_URI=$4 \
  -e SMTP_HOST=$5 \
  -e SMTP_PORT=$6 \
  -e SMTP_USER=$7 \
  -e SMTP_PASS=$8 \
  $1/my-express-app:latest

# Print the logs
docker logs my-express-app
