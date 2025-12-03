# 🚀 Task Service – FastAPI Microservice (Docker + Kubernetes)

A simple and production-ready **FastAPI microservice** fully containerized with **Docker** and deployed locally using **Kubernetes (Minikube)**.

This project demonstrates core DevOps skills:
- Containerization with Docker  
- Local orchestration with Kubernetes  
- Health checks  
- Multi-stage Docker builds  
- Automated scripts  
- Clean folder structure  

---

## 📁 Project Structure

task-service/
│── app/
│ ├── main.py
│ ├── routers/...
│── k8s/
│ ├── namespace.yaml
│ ├── task-service.yaml
│── scripts/
│ ├── build.sh
│ ├── deploy.sh
│── Dockerfile
│── docker-compose.yml
│── requirements.txt

yaml
---

# 🐍 FastAPI Application

### **Health Check Endpoint**

GET /health

css

Expected Output:
```json
{"status": "ok"}
Used for:

Docker Healthcheck

Kubernetes Liveness Probe

Kubernetes Readiness Probe

🐳 Run Using Docker
Build the image:
bash

docker build -t task-service:latest .
Run container:
bash

docker run -p 8000:8000 task-service:latest
Test:
http://localhost:8000/health

http://localhost:8000/docs

🐙 Run Using Docker Compose
Start:

bash

docker compose up -d
Logs:

bash
Copy code
docker compose logs -f
Stop:

bash

docker compose down
☸ Deploying to Kubernetes (Minikube)
1️⃣ Make Minikube use Docker Environment
bash

eval $(minikube docker-env)
2️⃣ Build Image Inside Minikube Docker
bash

docker build -t task-service:latest .
3️⃣ Apply Kubernetes Manifests
bash

kubectl apply -f k8s/
4️⃣ Verify Everything is Running
bash

kubectl get pods -n task-service-ns
kubectl get svc -n task-service-ns
5️⃣ Access the Service
Get Minikube IP:

bash

minikube ip
Then open:

arduino

http://<minikube-ip>:30080/health
Example:

arduino

http://192.168.49.2:30080/health
⚙ Kubernetes Components Used
💠 Namespace
Isolates project resources.

💠 Deployment
Ensures:

Pod creation

Auto-restart

Rolling updates

💠 Service (NodePort)
Exposes FastAPI app outside the cluster.

📦 Dockerfile (Multi-Stage Build)
Stage 1 → Installs dependencies

Stage 2 → Runs lightweight production image

Uses non-root user (appuser)

Final image size ≈ 198MB

🧪 Useful Commands
View pod logs
bash

kubectl logs -n task-service-ns <pod-name>
Restart deployment
bash

kubectl rollout restart deployment task-service-deployment -n task-service-ns
Describe resources
bash

```
kubectl describe pod -n task-service-ns
kubectl describe svc -n task-service-ns
```

Mohammad Alhindi – DevOps Engineer
