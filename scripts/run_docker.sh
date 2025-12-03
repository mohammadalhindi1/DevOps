#!/usr/bin/env bash
# Run task-service Docker container locally

set -e

CONTAINER_NAME="task-service-container"
IMAGE_NAME="task-service:latest"
PORT="8000"

echo "Stopping old container if exists..."
docker rm -f ${CONTAINER_NAME} 2>/dev/null || true

echo "Starting new container..."
docker run --name ${CONTAINER_NAME} -p ${PORT}:8000 ${IMAGE_NAME}