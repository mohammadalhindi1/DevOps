# -----------------------------
# Build stage
# -----------------------------
FROM python:3.10-slim AS builder

# Set working directory inside the container
WORKDIR /app

# Copy project files
COPY requirements.txt ./

# Install only required packages
RUN pip install --no-cache-dir -r requirements.txt

# -----------------------------
# Final runtime stage
# -----------------------------
FROM python:3.10-slim

# Create a non-root user for security (best practice)
RUN useradd -m appuser

WORKDIR /app

# Copy installed Python dependencies from builder
COPY --from=builder /usr/local /usr/local

# Copy application files
COPY app ./app

# Expose default FastAPI port
EXPOSE 8000

# Switch to non-root user
USER appuser

# Start FastAPI app with uvicorn
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]