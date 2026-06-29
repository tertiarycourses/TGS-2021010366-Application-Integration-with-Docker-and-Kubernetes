# Lab 19: Jobs and CronJobs

Jobs run a task to completion. CronJobs run Jobs on a schedule.

## Part A: Job (Imperative)

```bash
# Create a Job that prints a message
kubectl create job my-job --image=busybox -- echo "Hello from Job!"

# List Jobs
kubectl get jobs

# List the Pod created by the Job
kubectl get pods

# View the Job output
kubectl logs job/my-job

# Describe the Job
kubectl describe job my-job

# Delete the Job
kubectl delete job my-job
```

## Part B: Job (Declarative)

Create a file called `job.yaml`:

```yaml
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
          command: ["sh", "-c", "echo 'Processing item...' && sleep 5 && echo 'Done!'"]
      restartPolicy: Never
```

```bash
# Create the Job
kubectl apply -f job.yaml

# Watch Pods — 2 run in parallel, 3 total completions
kubectl get pods -w

# Check Job status
kubectl get jobs

# View logs from all Pods
kubectl logs job/countdown

# Clean up
kubectl delete -f job.yaml
```

## Part C: CronJob (Imperative)

```bash
# Create a CronJob that runs every minute
kubectl create cronjob my-cron --image=busybox --schedule="*/1 * * * *" -- echo "Hello from CronJob!"

# List CronJobs
kubectl get cronjobs

# Wait 1-2 minutes, then check the Jobs it created
kubectl get jobs

# View the logs from the latest Job
kubectl logs job/$(kubectl get jobs --sort-by=.metadata.creationTimestamp -o jsonpath='{.items[-1].metadata.name}')

# Delete the CronJob
kubectl delete cronjob my-cron
```

## Part D: CronJob (Declarative)

Create a file called `cronjob.yaml`:

```yaml
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
              command: ["sh", "-c", "echo 'Backup started at $(date)' && sleep 3 && echo 'Backup complete!'"]
          restartPolicy: Never
```

```bash
# Create the CronJob
kubectl apply -f cronjob.yaml

# List CronJobs
kubectl get cronjobs

# Wait 2-4 minutes, then check the Jobs
kubectl get jobs

# View logs
kubectl logs job/$(kubectl get jobs --sort-by=.metadata.creationTimestamp -o jsonpath='{.items[-1].metadata.name}')

# Clean up
kubectl delete -f cronjob.yaml
```

## Cron Schedule Format

```
┌───────────── minute (0-59)
│ ┌───────────── hour (0-23)
│ │ ┌───────────── day of month (1-31)
│ │ │ ┌───────────── month (1-12)
│ │ │ │ ┌───────────── day of week (0-6, Sun=0)
│ │ │ │ │
* * * * *
```

| Schedule | Meaning |
|---|---|
| `*/1 * * * *` | Every minute |
| `*/5 * * * *` | Every 5 minutes |
| `0 * * * *` | Every hour |
| `0 0 * * *` | Every day at midnight |
| `0 9 * * 1` | Every Monday at 9am |

## Job vs CronJob

| | Job | CronJob |
|---|---|---|
| Runs | Once | On a schedule |
| Use case | One-time task (migration, backup) | Recurring task (cleanup, reports) |
| Creates | Pods directly | Jobs on schedule |
