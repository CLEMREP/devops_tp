# TP Docker

```shell
cd tp_docker
```

```
docker-compose up -d
```


# TP Kubernetes

```shell
cd tp_kubernetes
```

```
minikube image build -t vote-app/seed ./seed-data
minikube image build -t vote-app/result ./result
minikube image build -t vote-app/nginx ./nginx
minikube image build -t vote-app/vote ./vote
minikube image build -t vote-app/worker ./worker
```

```
kubectl apply -f ./k8s
```

# TP Kubernetes + Ansible

```shell
cd tp_ansible
```

```