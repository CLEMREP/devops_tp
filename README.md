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

```shell
minikube image build -t vote-app/seed ./seed-data
minikube image build -t vote-app/result ./result
minikube image build -t vote-app/nginx ./nginx
minikube image build -t vote-app/vote ./vote
minikube image build -t vote-app/worker ./worker
```

```shell
kubectl apply -k k8s/overlays/production
```

```shell
kubectl apply -k k8s/overlays/dev01
```

```shell
kubectl port-forward -n production svc/db 5432:5432
````

````
kubectl port-forward -n dev01 svc/db 5433:5432
````



# TP Kubernetes + Ansible

```shell
cd tp_ansible
```

```