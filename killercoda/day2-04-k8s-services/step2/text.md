# Lab 17: NodePort Service

```bash
kubectl create deployment my-nginx --image=nginx --replicas=2

kubectl expose deployment my-nginx \
  --type=NodePort \
  --port=80 \
  --target-port=80

kubectl get service my-nginx
# Note the NodePort value (30xxx)

kubectl get nodes -o wide
# Use the node IP and NodePort to test

curl http://$(kubectl get nodes -o jsonpath='{.items[0].status.addresses[0].address}'):$(kubectl get svc my-nginx -o jsonpath='{.spec.ports[0].nodePort}')

kubectl delete service my-nginx
kubectl delete deployment my-nginx
```
