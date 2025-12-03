#!/usr/bin/env bash
# Build Docker image for task-service

set -e

IMAGE_NAME="task-service"
TAG="latest"

echo "Building Docker image: ${IMAGE_NAME}:${TAG}"
docker build -t ${IMAGE_NAME}:${TAG} .