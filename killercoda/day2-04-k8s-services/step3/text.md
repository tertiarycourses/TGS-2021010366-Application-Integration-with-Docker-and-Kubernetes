# Lab 17: Service + Deployment YAML

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
          image: nginx
          ports:
            - containerPort: 80
EOF

cat > service.yaml << 'EOF'
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
EOF

kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
kubectl get services
kubectl get endpoints my-app-svc
curl http://localhost:30080

kubectl delete -f service.yaml
kubectl delete -f deployment.yaml
```
