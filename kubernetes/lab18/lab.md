# Lab 18: Volumes in Kubernetes

Persist and share data using ephemeral volumes, Persistent Volumes (PV), and Persistent Volume Claims (PVC).

## Part A: Ephemeral Volume (emptyDir)

`emptyDir` creates a temporary volume that lives as long as the Pod. Useful for sharing data between containers in the same Pod.

Create a file called `emptydir-pod.yaml`:

```yaml
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
```

```bash
# Create the Pod
kubectl apply -f emptydir-pod.yaml

# Check both containers are running
kubectl get pod shared-pod

# Read the message written by the writer container
kubectl exec shared-pod -c reader -- cat /data/message.txt

# Check the reader's logs
kubectl logs shared-pod -c reader

# Delete the Pod — the emptyDir data is gone
kubectl delete pod shared-pod
```

## Part B: Persistent Volume (PV)

A Persistent Volume is storage provisioned by an admin. It exists independently of any Pod.

Create a file called `pv.yaml`:

```yaml
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
```

```bash
# Create the Persistent Volume
kubectl apply -f pv.yaml

# List Persistent Volumes
kubectl get pv

# Describe the PV
kubectl describe pv my-pv
```

## Part C: Persistent Volume Claim (PVC)

A PVC is a request for storage. Kubernetes binds it to a matching PV.

Create a file called `pvc.yaml`:

```yaml
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
```

```bash
# Create the PVC — it will bind to my-pv
kubectl apply -f pvc.yaml

# Verify the PVC is bound
kubectl get pvc
kubectl get pv

# The STATUS should show "Bound" for both PV and PVC
```

## Part D: Use PVC in a Pod

Create a file called `pod-with-pvc.yaml`:

```yaml
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
```

```bash
# Create the Pod
kubectl apply -f pod-with-pvc.yaml

# Verify data is written
kubectl exec pvc-pod -- cat /data/file.txt

# Delete the Pod
kubectl delete pod pvc-pod

# Recreate the Pod — data persists because PVC still exists
kubectl apply -f pod-with-pvc.yaml
kubectl exec pvc-pod -- cat /data/file.txt

# Clean up
kubectl delete pod pvc-pod
kubectl delete pvc my-pvc
kubectl delete pv my-pv
```

## Comparison

| Type | Lifetime | Use case |
|---|---|---|
| `emptyDir` | Deleted when Pod is deleted | Temp files, sharing between containers |
| PersistentVolume (PV) | Exists independently of Pods | Admin-provisioned storage |
| PersistentVolumeClaim (PVC) | Bound to a PV | Pod requests storage from PV |

## How PV and PVC Work Together

```
Admin creates:          User creates:           User creates:
PV (1Gi storage)  ←──  PVC (500Mi request)  ←──  Pod (mounts PVC)
     │                       │                        │
     └── Bound ──────────────┘                        │
                             └── Mounted ─────────────┘
```
