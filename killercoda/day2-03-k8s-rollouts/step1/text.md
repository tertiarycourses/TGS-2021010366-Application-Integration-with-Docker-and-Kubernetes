# Lab 16: Rolling Updates

```bash
kubectl create deployment my-nginx --image=nginx:1.24 --replicas=3
kubectl get deployments
kubectl describe deployment my-nginx | grep Image

# Update to 1.25
kubectl set image deployment my-nginx nginx=nginx:1.25
kubectl rollout status deployment my-nginx
kubectl describe deployment my-nginx | grep Image

# Update to 1.27
kubectl set image deployment my-nginx nginx=nginx:1.27
kubectl rollout status deployment my-nginx

# View history — 3 revisions
kubectl rollout history deployment my-nginx
```
