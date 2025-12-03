#!/usr/bin/env bash
# Simple script to run FastAPI app locally using uvicorn

set -e  # Exit immediately if a command exits with a non-zero status

# Activate virtual environment
source .venv/bin/activate

# Run FastAPI app with auto-reload
uvicorn app.main:app --reload --host 0.0.0.0 --port 8000