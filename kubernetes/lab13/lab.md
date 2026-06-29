# Lab 13: Kubernetes Pods

Learn to create, inspect, and delete Pods using both imperative commands and declarative YAML.

## Part A: Imperative (Commands)

```bash
# Create a Pod running Nginx
kubectl run my-nginx --image=nginx

# List all Pods
kubectl get pods

# Get more details (IP, node, status)
kubectl get pods -o wide

# Describe a Pod (events, containers, volumes)
kubectl describe pod my-nginx

# View Pod logs
kubectl logs my-nginx

# Execute a command inside the Pod
kubectl exec my-nginx -- cat /etc/hostname

# Open an interactive shell inside the Pod
kubectl exec -it my-nginx -- /bin/sh

# Delete the Pod
kubectl delete pod my-nginx
```

## Part B: Declarative (YAML)

Create a file called `pod.yaml`:

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: my-app
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
# Create the Pod from YAML
kubectl apply -f pod.yaml

# Verify the Pod is running
kubectl get pods

# Describe the Pod
kubectl describe pod my-app

# Delete the Pod using the YAML file
kubectl delete -f pod.yaml
```

