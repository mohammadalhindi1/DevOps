#!/usr/bin/env bash
# Apply Kubernetes manifests for task-service

set -e

echo "Applying Kubernetes manifests..."
kubectl apply -f k8s/task-service.yaml

echo "Resources in namespace task-service-ns:"
kubectl get all -n task-service-ns