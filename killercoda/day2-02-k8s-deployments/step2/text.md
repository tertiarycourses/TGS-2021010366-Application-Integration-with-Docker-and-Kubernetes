# Lab 15: Deployments — Declarative YAML

```bash
cat > deployment.yaml << 'EOF'
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
EOF

kubectl apply -f deployment.yaml
kubectl get deployments
kubectl get pods

# Scale by editing replicas in YAML
sed -i 's/replicas: 3/replicas: 5/' deployment.yaml
kubectl apply -f deployment.yaml
kubectl get pods

# Self-healing test
kubectl delete pod $(kubectl get pods -l app=my-app -o name | head -1 | cut -d/ -f2)
kubectl get pods

kubectl delete -f deployment.yaml
```
