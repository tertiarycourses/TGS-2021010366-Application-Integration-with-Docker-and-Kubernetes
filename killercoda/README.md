# KillerCoda Scenarios ? 2-Day Docker & Kubernetes Course

Interactive browser-based labs for the **Application Integration with Docker and Kubernetes** course.
No local installation needed ? everything runs in the browser.

---

## Before You Start ? Important Notes for Students

### Docker Compose syntax
KillerCoda uses the older Docker Compose v1. Always use **`docker-compose`** (with a hyphen), not `docker compose`:
```bash
# Correct
docker-compose up -d
docker-compose ps
docker-compose down

# Wrong ? will not work on KillerCoda
docker compose up -d
```

### Exclamation mark `!` in bash
Bash on KillerCoda treats `!` as a special character. If a command contains `!` inside double quotes, you will see:
```
bash: !': event not found
```
**Fix:** Use single quotes around the Python string, or remove the `!`:
```bash
# This will fail
docker-compose exec web python -c "print('hello!')"

# Use this instead
docker-compose exec web python -c "print('hello')"
```

### Each lab session is fresh
Every time you start a KillerCoda scenario, you get a brand new environment. You need to re-run the setup commands each time. This is normal.

---

## Day 1 ? Docker

| Scenario | Labs | Topics |
|---|---|---|
| [day1-01-docker-fundamentals](day1-01-docker-fundamentals/) | 1?4 | Run containers, build images, Flask app |
| [day1-02-docker-storage](day1-02-docker-storage/) | 5 | Named volumes, bind mounts |
| [day1-03-docker-networking](day1-03-docker-networking/) | 6?7 | Custom networks, port mapping |
| [day1-04-docker-config](day1-04-docker-config/) | 8 | Environment variables |
| [day1-05-docker-compose](day1-05-docker-compose/) | 10?12 | Compose, multi-service, full-stack |

## Day 2 ? Kubernetes

| Scenario | Labs | Topics |
|---|---|---|
| [day2-01-k8s-pods-namespaces](day2-01-k8s-pods-namespaces/) | 13?14 | Pods, Namespaces |
| [day2-02-k8s-deployments](day2-02-k8s-deployments/) | 15 | Deployments, scaling, self-healing |
| [day2-03-k8s-rollouts](day2-03-k8s-rollouts/) | 16 | Rolling updates, rollbacks |
| [day2-04-k8s-services](day2-04-k8s-services/) | 17 | ClusterIP, NodePort |
| [day2-05-k8s-storage-jobs](day2-05-k8s-storage-jobs/) | 18?19 | PV/PVC, Jobs, CronJobs |

---

## How to Access the Labs

Your trainer will share a direct link to each scenario. Click the link, wait for the environment to load (about 30 seconds), then follow the step-by-step instructions.
