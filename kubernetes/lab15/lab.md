# Lab 15: Deployments

Deployments manage replicas of your Pods and handle rolling updates.

## Part A: Imperative (Commands)

```bash
# Create a Deployment with 1 replica
kubectl create deployment my-nginx --image=nginx

# List Deployments
kubectl get deployments

# List Pods created by the Deployment
kubectl get pods

# Describe the Deployment
kubectl describe deployment my-nginx

# Scale to 3 replicas
kubectl scale deployment my-nginx --replicas=3

# Watch the Pods scale up
kubectl get pods -w

# Delete one Pod — the Deployment will recreate it automatically
kubectl delete pod <pod-name>

# Verify a new Pod is created (still 3 running)
kubectl get pods

# Scale down to 1 replica
kubectl scale deployment my-nginx --replicas=1

# Verify Pods are terminated
kubectl get pods

# Delete the Deployment
kubectl delete deployment my-nginx
```

## Part B: Declarative (YAML)

Create a file called `deployment.yaml`:

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: my-app
  labels:
    app: my-app
spec:
  replicas: 3
  selector:
    matchLabels:
      app: my-app
  template:
    metadata:
      labels:
        app: my-app
    spec:
      containers:
        - name: nginx
          image: nginx
          ports:
            - containerPort: 80
```

```bash
# Create the Deployment from YAML
kubectl apply -f deployment.yaml

# Verify 3 replicas are running
kubectl get deployments
kubectl get pods

# Update replicas — change replicas to 5 in deployment.yaml, then:
kubectl apply -f deployment.yaml

# Verify 5 Pods are now running
kubectl get pods

# Delete one Pod — Deployment recreates it
kubectl delete pod <pod-name>
kubectl get pods

# Clean up
kubectl delete -f deployment.yaml
```

## How Replicas Work

```
Deployment (my-app, replicas: 3)
    │
    ├── Pod 1 (my-app-abc12)  ── running
    ├── Pod 2 (my-app-def34)  ── running
    └── Pod 3 (my-app-ghi56)  ── running

Delete Pod 2 → Deployment detects only 2 Pods → creates Pod 4 automatically
    │
    ├── Pod 1 (my-app-abc12)  ── running
    ├── Pod 3 (my-app-ghi56)  ── running
    └── Pod 4 (my-app-jkl78)  ── running  (new)
```

