# Lab 18: PersistentVolume & PersistentVolumeClaim

```bash
cat > pv.yaml << 'EOF'
apiVersion: v1
kind: PersistentVolume
metadata:
  name: my-pv
spec:
  capacity:
    storage: 1Gi
  accessModes:
    - ReadWriteOnce
  hostPath:
    path: /tmp/k8s-data
EOF

cat > pvc.yaml << 'EOF'
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: my-pvc
spec:
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 500Mi
EOF

kubectl apply -f pv.yaml
kubectl apply -f pvc.yaml
kubectl get pv
kubectl get pvc
# Both should show Bound

cat > pod-with-pvc.yaml << 'EOF'
apiVersion: v1
kind: Pod
metadata:
  name: pvc-pod
spec:
  containers:
    - name: app
      image: busybox
      command: ["sh", "-c", "echo 'persistent data' > /data/file.txt && sleep 3600"]
      volumeMounts:
        - name: my-storage
          mountPath: /data
  volumes:
    - name: my-storage
      persistentVolumeClaim:
        claimName: my-pvc
EOF

kubectl apply -f pod-with-pvc.yaml
kubectl exec pvc-pod -- cat /data/file.txt

# Prove data survives pod deletion
kubectl delete pod pvc-pod
kubectl apply -f pod-with-pvc.yaml
kubectl exec pvc-pod -- cat /data/file.txt

kubectl delete pod pvc-pod
kubectl delete pvc my-pvc
kubectl delete pv my-pv
```
