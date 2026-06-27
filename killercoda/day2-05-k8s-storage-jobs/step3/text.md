# Lab 19: Jobs

A Job runs one or more Pods to completion.

```bash
# Imperative
kubectl create job my-job --image=busybox -- echo "Hello from Job!"
kubectl get jobs
kubectl get pods
kubectl logs job/my-job
kubectl delete job my-job

# Declarative — 3 completions, 2 in parallel
cat > job.yaml << 'EOF'
apiVersion: batch/v1
kind: Job
metadata:
  name: countdown
spec:
  completions: 3
  parallelism: 2
  template:
    spec:
      containers:
        - name: counter
          image: busybox
          command: ["sh", "-c", "echo 'Processing...' && sleep 3 && echo 'Done!'"]
      restartPolicy: Never
EOF

kubectl apply -f job.yaml
kubectl get pods -w
kubectl get jobs
kubectl logs job/countdown
kubectl delete -f job.yaml
```

**Key concept:** `completions: 3` = 3 successful runs total. `parallelism: 2` = 2 Pods run at the same time.
