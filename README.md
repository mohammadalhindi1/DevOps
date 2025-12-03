# 🚀 Task Service – FastAPI Microservice (Docker + Kubernetes)

A simple and production-ready **FastAPI microservice** containerized with **Docker** and deployed locally using **Kubernetes (Minikube)**.

This project demonstrates key DevOps concepts:
- Docker containerization
- Kubernetes deployments & services
- Health checks
- Multi-stage Docker builds
- Automated scripts
- Clean folder structure

---

## 📁 Project Structure

task-service/
- app/
  - main.py
  - routers/...
- k8s/
  - namespace.yaml
  - task-service.yaml
- scripts/
  - build.sh
  - deploy.sh
- Dockerfile
- docker-compose.yml
- requirements.txt

---

## 🐍 FastAPI Application

### Health Check Endpoint

- Method: GET  
- Path: `/health`  

Expected output:

{"status": "ok"}

Used for:
- Docker healthcheck
- Kubernetes liveness probe
- Kubernetes readiness probe

---

## 🐳 Run Using Docker

Build the image:

docker build -t task-service:latest .

Run the container:

docker run -p 8000:8000 task-service:latest

Test:

- http://localhost:8000/health
- http://localhost:8000/docs

---

## 🐙 Run Using Docker Compose

Start services:

docker compose up -d

Follow logs:

docker compose logs -f

Stop:

docker compose down

---

## ☸ Deploying to Kubernetes (Minikube)

1️⃣ Use Minikube Docker Engine:

eval $(minikube docker-env)

2️⃣ Build image inside Minikube:

docker build -t task-service:latest .

3️⃣ Apply Kubernetes manifests:

kubectl apply -f k8s/

4️⃣ Verify everything is running:

kubectl get pods -n task-service-ns
kubectl get svc -n task-service-ns

5️⃣ Access the service:

- Get Minikube IP:

minikube ip

- Then open:

http://<minikube-ip>:30080/health

Example:

http://192.168.49.2:30080/health

---

Mohammad Alhindi – DevOps Engineer
