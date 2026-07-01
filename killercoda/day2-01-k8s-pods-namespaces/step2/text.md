# Lab 13: Pods — Declarative YAML

```bash
cat > pod.yaml << 'EOF'
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
EOF

kubectl apply -f pod.yaml
kubectl get pods
kubectl describe pod my-app
kubectl delete -f pod.yaml
kubectl get pods
```

**Key concept:** `kubectl apply -f` is idempotent — safe to run multiple times. Always prefer YAML for production.
