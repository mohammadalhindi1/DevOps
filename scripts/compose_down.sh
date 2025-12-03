#!/usr/bin/env bash
# Stop and remove docker compose services

set -e

echo "Stopping docker compose services..."
docker compose down