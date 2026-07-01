# Lab 17: ClusterIP Service

```bash
kubectl create deployment my-nginx --image=nginx --replicas=2
kubectl expose deployment my-nginx --port=80 --target-port=80
kubectl get services
kubectl describe service my-nginx
kubectl get endpoints my-nginx

# Test from inside the cluster
kubectl run test-pod --image=busybox --rm -it --restart=Never \
  -- wget -O- my-nginx:80

kubectl delete service my-nginx
kubectl delete deployment my-nginx
```

**Key concept:** ClusterIP provides a stable virtual IP and DNS name. The Service load-balances across all matching Pods.
