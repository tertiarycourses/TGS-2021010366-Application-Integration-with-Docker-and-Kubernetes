# Lab 14: Namespaces

Namespaces provide isolation between resources in a Kubernetes cluster.

## Part A: Imperative (Commands)

```bash
# List all namespaces
kubectl get namespaces

# Create a namespace
kubectl create namespace dev

# Run a Pod in the dev namespace
kubectl run my-nginx --image=nginx -n dev

# List Pods in the dev namespace
kubectl get pods -n dev

# List Pods in all namespaces
kubectl get pods --all-namespaces

# Describe the Pod in dev namespace
kubectl describe pod my-nginx -n dev

# Delete the Pod in dev namespace
kubectl delete pod my-nginx -n dev

# Delete the namespace (deletes everything inside it)
kubectl delete namespace dev
```

## Part B: Declarative (YAML)

Create a file called `namespace.yaml`:

```yaml
apiVersion: v1
kind: Namespace
metadata:
  name: staging
```

Create a file called `pod-in-namespace.yaml`:

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: my-app
  namespace: staging
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
# Create the namespace from YAML
kubectl apply -f namespace.yaml

# Create the Pod in the staging namespace
kubectl apply -f pod-in-namespace.yaml

# Verify
kubectl get pods -n staging

# Clean up — delete the namespace (removes all resources inside)
kubectl delete -f namespace.yaml
```

## Default Namespaces

| Namespace | Purpose |
|---|---|
| `default` | Where Pods go if no namespace is specified |
| `kube-system` | Kubernetes system components |
| `kube-public` | Publicly accessible resources |
| `kube-node-lease` | Node heartbeat tracking |
