# Labs for WSQ Application Integration with Docker and Kubernetes

Hands-on Docker and Kubernetes labs for the [WSQ Application Integration with Docker and Kubernetes](https://www.tertiarycourses.com.sg/wsq-application-integration-docker-kubernetes.html) course by Tertiary Infotech Academy Pte. Ltd.

**Course Code:** TGS-2021010366 | **Skills Framework:** Applications Integration (ICT-DIT-3003-1.1) under ICT Skills Framework

## Docker Labs

| Lab | Topic | Description |
|-----|-------|-------------|
| lab1 | First Container | Run an interactive Ubuntu container |
| lab2 | Nginx | Run Nginx and write /etc/hosts to a file |
| lab3 | Python Container | Build and run a simple Python print app |
| lab3-2 | Tetris Game | Run a static web app (Tetris) with Nginx |
| lab4 | Flask App | Build a Flask web app with Docker |
| lab5 | Volumes | Persist data with named volumes and bind mounts |
| lab5-2 | Dockerfile Volumes | VOLUME instruction in Dockerfile |
| lab6 | Networks | Container networking and DNS |
| lab7 | Port Mapping | Host vs container ports |
| lab8 | Environment Variables | ENV in Dockerfile and runtime overrides |
| lab9 | Docker Hub | Push the Tetris game to Docker Hub |
| lab9-2 | Docker Hub | Push and pull images |
| lab10 | Docker Compose | Single service with Compose |
| lab11 | Multi-Service Compose | Flask + Redis with Compose |
| lab12 | Full-Stack Compose | Web + PostgreSQL + Redis with healthchecks |

## Kubernetes Labs

| Lab | Topic | Description |
|-----|-------|-------------|
| lab13 | Pods | Create, inspect, and delete Pods (imperative and declarative) |
| lab14 | Namespaces | Create and manage namespaces |
| lab15 | Deployments | Replicas, scaling, and self-healing |
| lab16 | Rollouts & Rollbacks | Rolling updates and version rollback |
| lab17 | Services | ClusterIP, NodePort, and exposing Pods |
| lab18 | Volumes | emptyDir, Persistent Volumes, and PVCs |
| lab19 | Jobs & CronJobs | One-time and scheduled tasks |

## Tests

| Test | Description |
|------|-------------|
| test1 | Practical test covering Docker labs 1–9 (Dockerfile, build, run, push) |
| test2 | Practical test covering Docker labs 10–12 (WordPress with Docker Compose) |
| test3 | Practical test on Kubernetes core concepts (Pods, namespaces) |
| test4 | Practical test on Kubernetes volumes and services |

## Getting Started

```bash
# Start with Docker lab1
cd docker/lab1
# Follow the instructions in lab.md
```

Each lab folder contains a `lab.md` with step-by-step commands to follow.

## Prerequisites

- [Docker Desktop](https://www.docker.com/products/docker-desktop/)
- [kubectl](https://kubernetes.io/docs/tasks/tools/) (for Kubernetes labs)
