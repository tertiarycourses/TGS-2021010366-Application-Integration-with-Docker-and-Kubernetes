# Lab 14: Namespaces

```bash
kubectl get namespaces

kubectl create namespace dev
kubectl run my-nginx --image=nginx -n dev
kubectl get pods -n dev
kubectl get pods --all-namespaces
kubectl describe pod my-nginx -n dev
kubectl delete namespace dev
```

## Declarative namespace

```bash
cat > namespace.yaml << 'EOF'
apiVersion: v1
kind: Namespace
metadata:
  name: staging
EOF

cat > pod-staging.yaml << 'EOF'
apiVersion: v1
kind: Pod
metadata:
  name: my-app
  namespace: staging
spec:
  containers:
    - name: nginx
      image: nginx
EOF

kubectl apply -f namespace.yaml
kubectl apply -f pod-staging.yaml
kubectl get pods -n staging
kubectl delete -f namespace.yaml
```

Deleting a namespace removes **everything** inside it.
