#!/usr/bin/env bash
# Start services using docker compose

set -e

echo "Starting docker compose in detached mode..."
docker compose up -d

echo "Current running services:"
docker compose ps