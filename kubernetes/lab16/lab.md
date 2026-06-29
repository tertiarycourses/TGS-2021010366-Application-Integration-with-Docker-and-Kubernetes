# Lab 16: Rollouts and Rollbacks

Update a Deployment to a new version and rollback if something goes wrong.

## Part A: Create a Deployment

```bash
# Create a Deployment with nginx version 1.24
kubectl create deployment my-nginx --image=nginx:1.24 --replicas=3

# Verify the Deployment and Pods
kubectl get deployments
kubectl get pods

# Check the current image version
kubectl describe deployment my-nginx | grep Image
```

## Part B: Roll Out a New Version

```bash
# Update the image to nginx 1.25 (triggers a rolling update)
kubectl set image deployment my-nginx nginx=nginx:1.25

# Watch the rollout in progress
kubectl rollout status deployment my-nginx

# Verify the new image version
kubectl describe deployment my-nginx | grep Image

# Check rollout history
kubectl rollout history deployment my-nginx
```

## Part C: Roll Out Another Version

```bash
# Update to nginx 1.27
kubectl set image deployment my-nginx nginx=nginx:1.27

# Watch the rollout
kubectl rollout status deployment my-nginx

# Check history — now 3 revisions
kubectl rollout history deployment my-nginx
```

## Part D: Rollback

```bash
# Rollback to the previous version (1.25)
kubectl rollout undo deployment my-nginx

# Verify the image is back to 1.25
kubectl describe deployment my-nginx | grep Image

# Rollback to a specific revision (revision 1 = nginx 1.24)
kubectl rollout history deployment my-nginx
kubectl rollout undo deployment my-nginx --to-revision=1

# Verify the image is back to 1.24
kubectl describe deployment my-nginx | grep Image
```

## Part E: Declarative Rollout

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
          image: nginx:1.24
          ports:
            - containerPort: 80
```

```bash
# Create the Deployment
kubectl apply -f deployment.yaml

# Update — change image to nginx:1.25 in deployment.yaml, then:
kubectl apply -f deployment.yaml

# Watch the rollout
kubectl rollout status deployment my-app

# Check history
kubectl rollout history deployment my-app

# Rollback
kubectl rollout undo deployment my-app

# Clean up
kubectl delete -f deployment.yaml
kubectl delete deployment my-nginx
```

