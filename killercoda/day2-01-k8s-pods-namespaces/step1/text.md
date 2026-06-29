# Lab 13: Pods — Imperative

```bash
kubectl run my-nginx --image=nginx
kubectl get pods
kubectl get pods -o wide
kubectl describe pod my-nginx
kubectl logs my-nginx
kubectl exec my-nginx -- cat /etc/hostname
kubectl exec -it my-nginx -- /bin/sh
# Inside: ls /usr/share/nginx/html && exit
kubectl delete pod my-nginx
kubectl get pods
```

**Key concept:** Pods are mortal. Delete one and it is gone forever. Deployments keep Pods alive automatically.
