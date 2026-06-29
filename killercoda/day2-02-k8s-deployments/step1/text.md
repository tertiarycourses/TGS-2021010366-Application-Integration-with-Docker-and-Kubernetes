# Lab 15: Deployments — Imperative

```bash
kubectl create deployment my-nginx --image=nginx
kubectl get deployments
kubectl get pods
kubectl describe deployment my-nginx

# Scale to 3 replicas
kubectl scale deployment my-nginx --replicas=3
kubectl get pods -w
# Ctrl+C when all 3 are Running

# Delete one Pod — Deployment recreates it automatically
kubectl delete pod $(kubectl get pods -l app=my-nginx -o name | head -1 | cut -d/ -f2)
kubectl get pods

# Scale down
kubectl scale deployment my-nginx --replicas=1
kubectl get pods
kubectl delete deployment my-nginx
```

**Key concept:** Deployments use a ReplicaSet to enforce the desired count. Delete a Pod and it is recreated within seconds.
