#!/usr/bin/env bash
# Port-forward Kubernetes service to local machine

set -e

NAMESPACE="task-service-ns"
SERVICE_NAME="task-service-svc"
LOCAL_PORT=8000
TARGET_PORT=8000

echo "Port-forwarding ${SERVICE_NAME} in namespace ${NAMESPACE}..."
echo "Open http://127.0.0.1:${LOCAL_PORT}/health"
kubectl port-forward svc/${SERVICE_NAME} ${LOCAL_PORT}:${TARGET_PORT} -n ${NAMESPACE}