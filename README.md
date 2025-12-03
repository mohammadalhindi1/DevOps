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

### **Health Check Endpoint**
GET `/health`

Expected Output:
```json
{"status": "ok"}

🐳 Run Using Docker
Build image:
docker build -t task-service:latest .

Run container:
docker run -p 8000:8000 task-service:latest

Test:
http://localhost:8000/health
http://localhost:8000/docs

🐙 Run Using Docker Compose

Start:
docker compose up -d

Logs:
docker compose logs -f

Stop:
docker compose down

☸ Deploying to Kubernetes (Minikube)

1️⃣ Use Minikube Docker Engine
eval $(minikube docker-env)

2️⃣ Build Image Inside Minikube
docker build -t task-service:latest .

3️⃣ Apply Kubernetes Manifests
kubectl apply -f k8s/

4️⃣ Verify Everything
kubectl get pods -n task-service-ns
kubectl get svc -n task-service-ns

5️⃣ Access the Service
Get Minikube IP:
minikube ip

Then open your service:
http://<minikube-ip>:30080/health

Mohammad Alhindi – DevOps Engineer
