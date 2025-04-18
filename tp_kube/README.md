

Pas de nginx car gestion avec kubernetes


Build images on minikube 

```bash
minikube image build -t vote-app/seed ./seed-data
minikube image build -t vote-app/result ./result
minikube image build -t vote-app/nginx ./nginx
minikube image build -t vote-app/vote ./vote
minikube image build -t vote-app/worker ./worker
```