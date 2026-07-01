# Lab 18: emptyDir — Shared Temporary Storage

emptyDir is shared between containers in the same Pod and deleted when the Pod is removed.

```bash
cat > emptydir-pod.yaml << 'EOF'
apiVersion: v1
kind: Pod
metadata:
  name: shared-pod
spec:
  containers:
    - name: writer
      image: busybox
      command: ["sh", "-c", "echo 'hello from writer' > /data/message.txt && sleep 3600"]
      volumeMounts:
        - name: shared-data
          mountPath: /data
    - name: reader
      image: busybox
      command: ["sh", "-c", "sleep 5 && cat /data/message.txt && sleep 3600"]
      volumeMounts:
        - name: shared-data
          mountPath: /data
  volumes:
    - name: shared-data
      emptyDir: {}
EOF

kubectl apply -f emptydir-pod.yaml
kubectl get pod shared-pod
kubectl exec shared-pod -c reader -- cat /data/message.txt
kubectl logs shared-pod -c reader
kubectl delete pod shared-pod
```
