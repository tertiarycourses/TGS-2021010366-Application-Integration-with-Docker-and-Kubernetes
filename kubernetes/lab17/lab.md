# Lab 17: Services

Services expose your Pods to other Pods or to the outside world.

## Part A: Expose a Deployment with ClusterIP

ClusterIP is the default Service type — only accessible within the cluster.

```bash
# Create a Deployment
kubectl create deployment my-nginx --image=nginx --replicas=2

# Expose the Deployment as a ClusterIP Service
kubectl expose deployment my-nginx --port=80 --target-port=80

# List Services
kubectl get services

# Describe the Service
kubectl describe service my-nginx

# Test from inside the cluster using a temporary Pod
kubectl run test-pod --image=busybox --rm -it --restart=Never -- wget -O- my-nginx:80

# Clean up
kubectl delete service my-nginx
kubectl delete deployment my-nginx
```

## Part B: NodePort Service

NodePort exposes the Service on a port on every node — accessible from outside the cluster.

```bash
# Create a Deployment
kubectl create deployment my-nginx --image=nginx --replicas=2

# Expose as NodePort
kubectl expose deployment my-nginx --type=NodePort --port=80 --target-port=80

# Get the assigned NodePort
kubectl get service my-nginx

# Visit http://localhost:<NodePort> in your browser

# Clean up
kubectl delete service my-nginx
kubectl delete deployment my-nginx
```

## Part C: Expose a Pod with a Service

```bash
# Create a Pod with a label
kubectl run my-app --image=nginx --labels=app=my-app

# Expose the Pod as a Service
kubectl expose pod my-app --port=80 --target-port=80 --name=my-app-svc

# Verify the Service is linked to the Pod
kubectl get service my-app-svc
kubectl get endpoints my-app-svc

# Test the Service
kubectl run test-pod --image=busybox --rm -it --restart=Never -- wget -O- my-app-svc:80

# Clean up
kubectl delete service my-app-svc
kubectl delete pod my-app
```

## Part D: Declarative (YAML)

Create a file called `service.yaml`:

```yaml
apiVersion: v1
kind: Service
metadata:
  name: my-app-svc
spec:
  type: NodePort
  selector:
    app: my-app
  ports:
    - port: 80
      targetPort: 80
      nodePort: 30080
```

```bash
# Create the Deployment first
kubectl apply -f deployment.yaml

# Create the Service
kubectl apply -f service.yaml

# Verify
kubectl get services
kubectl get endpoints my-app-svc

# Visit http://localhost:30080 in your browser

# Clean up
kubectl delete -f service.yaml
kubectl delete -f deployment.yaml
```

## Service Types

| Type | Access | Use case |
|---|---|---|
| `ClusterIP` | Inside the cluster only | Service-to-service communication |
| `NodePort` | Outside via `<NodeIP>:<NodePort>` | Development, testing |
| `LoadBalancer` | External load balancer (cloud) | Production (AWS, GCP, Azure) |

## How Services Connect to Pods

```
Service (my-app-svc)
    │
    │  selector: app=my-app     ← matches Pods with label app=my-app
    │
    ├── Pod 1 (label: app=my-app)  port 80
    ├── Pod 2 (label: app=my-app)  port 80
    └── Pod 3 (label: app=my-app)  port 80
```

The Service uses `selector` to find Pods with matching labels and routes traffic to them.
