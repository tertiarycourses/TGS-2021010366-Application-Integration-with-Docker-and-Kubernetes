# Lab 19: CronJobs

A CronJob creates Jobs on a cron schedule.

```bash
# Imperative — runs every minute
kubectl create cronjob my-cron \
  --image=busybox \
  --schedule="*/1 * * * *" \
  -- echo "Hello from CronJob!"

kubectl get cronjobs

# Wait 1-2 minutes then check
kubectl get jobs
kubectl logs job/$(kubectl get jobs --sort-by=.metadata.creationTimestamp -o jsonpath='{.items[-1].metadata.name}')
kubectl delete cronjob my-cron

# Declarative — runs every 2 minutes
cat > cronjob.yaml << 'EOF'
apiVersion: batch/v1
kind: CronJob
metadata:
  name: backup-job
spec:
  schedule: "*/2 * * * *"
  jobTemplate:
    spec:
      template:
        spec:
          containers:
            - name: backup
              image: busybox
              command: ["sh", "-c", "echo 'Backup at $(date)' && sleep 3 && echo 'Done!'"]
          restartPolicy: Never
EOF

kubectl apply -f cronjob.yaml
kubectl get cronjobs
# Wait 2-4 minutes
kubectl get jobs
kubectl delete -f cronjob.yaml
```

Cron format: `minute hour day-of-month month day-of-week`
