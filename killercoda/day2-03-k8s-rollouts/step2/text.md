# Lab 16: Rollbacks

```bash
# Rollback to previous (1.25)
kubectl rollout undo deployment my-nginx
kubectl describe deployment my-nginx | grep Image

# Rollback to specific revision (nginx 1.24)
kubectl rollout history deployment my-nginx
kubectl rollout undo deployment my-nginx --to-revision=1
kubectl describe deployment my-nginx | grep Image
```

## Declarative rollout + rollback

```bash
cat > deployment.yaml << 'EOF'
apiVersion: apps/v1
kind: Deployment
metadata:
  name: my-app
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
EOF

kubectl apply -f deployment.yaml
sed -i 's/nginx:1.24/nginx:1.25/' deployment.yaml
kubectl apply -f deployment.yaml
kubectl rollout status deployment my-app
kubectl rollout history deployment my-app
kubectl rollout undo deployment my-app

kubectl delete deployment my-nginx
kubectl delete -f deployment.yaml
```
