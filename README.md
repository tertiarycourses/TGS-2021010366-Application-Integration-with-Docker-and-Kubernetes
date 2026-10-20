# Application Integration with Docker and Kubernetes

Hands-on labs and courseware for the WSQ course **Application Integration with Docker and
Kubernetes** by [Tertiary Infotech Academy Pte Ltd](https://www.tertiarycourses.com.sg/).

| Course detail | Information |
|---|---|
| Course code | `TGS-2021010366` |
| Programme | WSQ |
| Duration | 2 days / 16 hours, including 2 hours of assessment |
| Skills Framework | Applications Integration — `ICT-DIT-3003-1.1` |
| Registration | [View course details and register](https://www.tertiarycourses.com.sg/wsq-application-integration-with-docker-and-kubernetes.html) |
| Funding | Up to 70% WSQ course-fee funding for eligible learners and employers. Eligibility and terms apply; see the course page. |

## About the course

Throughout the course you build and deploy one realistic application — **TaskBoard**, a Flask
task-tracker backed by Redis and PostgreSQL — taking it from a single container, to a
multi-service Docker Compose stack, to a scalable Kubernetes deployment. The shared app lives
in [`labs/app/`](labs/app/).

## Learning outcomes

- **LO1:** Perform application assessment and connection using Docker containers.
- **LO2:** Integrate functions and support API integration using Docker containers.
- **LO3:** Perform test and verifications across multiple platforms using Kubernetes.
- **LO4:** Perform troubleshooting and upgrade on Kubernetes.

## Topics covered

**Day 1 — Docker:** fundamentals & commands · Dockerfile & image build · CMD vs ENTRYPOINT ·
storage (volumes & bind mounts) · networking · configuration · Docker Hub · Docker Compose.

**Day 2 — Kubernetes:** Pods · Namespaces · Deployments · rolling updates & rollbacks ·
Services · storage (PV/PVC) · Jobs & CronJobs.

## Day 1 — Docker labs

| Lab | Topic | What you build |
|-----|-------|----------------|
| [01](labs/lab01-docker-commands/) | Docker commands | Run & manage an nginx web server (run/ps/logs/exec/stop/rm) |
| [02](labs/lab02-images-and-inspect/) | Docker commands | Pull images, `docker cp` a served file, inspect a container |
| [03](labs/lab03-build-image/) | Docker build / Dockerfile | Build the TaskBoard Flask image |
| [04](labs/lab04-dockerfile-best-practices/) | Dockerfile best practices | `.dockerignore` + cache-friendly layer ordering |
| [05](labs/lab05-cmd-entrypoint/) | CMD vs ENTRYPOINT | Package `taskboard-cli` (fixed ENTRYPOINT, overridable CMD) |
| [06](labs/lab06-volumes/) | Storage | Persist TaskBoard data with a named volume + bind mount |
| [07](labs/lab07-networking/) | Networking | TaskBoard ↔ Redis by DNS on a custom bridge network |
| [08](labs/lab08-env-vars/) | Environment variables | Configure TaskBoard via ENV / `-e` / `--env-file` |
| [09](labs/lab09-docker-hub/) | Docker Hub | Tag, push and pull the TaskBoard image |
| [10](labs/lab10-compose-single/) | Docker Compose | TaskBoard as a single Compose service |
| [11](labs/lab11-compose-redis/) | Docker Compose | TaskBoard + Redis (visit counter) |
| [12](labs/lab12-compose-fullstack/) | Docker Compose | TaskBoard + PostgreSQL + Redis with healthchecks |

## Day 2 — Kubernetes labs

| Lab | Topic | What you build |
|-----|-------|----------------|
| [13](labs/lab13-pods/) | Pods | Create/inspect Pods imperatively & declaratively |
| [14](labs/lab14-namespaces/) | Namespaces | Isolate a `dev` environment |
| [15](labs/lab15-deployments/) | Deployments | Scale and self-heal a Deployment |
| [16](labs/lab16-rollouts/) | Rolling updates & rollbacks | Zero-downtime update, then roll back |
| [17](labs/lab17-services/) | Services | ClusterIP (internal) + NodePort (external) |
| [18](labs/lab18-storage/) | Storage | emptyDir + PersistentVolume / PVC |
| [19](labs/lab19-jobs-cronjobs/) | Jobs & CronJobs | Batch Job + scheduled CronJob |

Each lab folder has a step-by-step `lab.md` plus its working files. Every lab also runs in the
browser on **KillerCoda** (link at the top of each `lab.md`). Practical assessments are in
[`labs/assessments/`](labs/assessments/).

## Courseware

The [`courseware/`](courseware/) folder holds the generated deliverables — all kept 100% in
sync from one source:

- **Slides** — `Application-Integration-with-Docker-and-Kubernetes-v21.pptx` / `.pdf`
- **Lesson Plan** — `LP-Application-Integration-with-Docker-and-Kubernetes.docx` / `.pdf`
- **Learner Guide** — `LG-Application-Integration-with-Docker-and-Kubernetes.docx` / `.pdf`
  (and the Markdown mirror [`LG-Application-Integration-with-Docker-and-Kubernetes.md`](LG-Application-Integration-with-Docker-and-Kubernetes.md))

The slides, labs, Lesson Plan and Learner Guide are all generated from a single canonical
content module so they never drift apart. The build pipeline is the **`courseware-build`**
skill ([.claude/skills/courseware-build/](.claude/skills/courseware-build/)) — edit
`labs_data.py` and re-run the generators to update everything.

## Getting started

```bash
# Start with Docker lab 1
cd labs/lab01-docker-commands
# follow the steps in lab.md — or open the KillerCoda link in your browser
```

## Prerequisites

- [Docker Desktop](https://www.docker.com/products/docker-desktop/) (Docker Engine + Compose)
- [kubectl](https://kubernetes.io/docs/tasks/tools/) and a local cluster (minikube / kind) for Day 2 — or just use KillerCoda
- A free [Docker Hub](https://hub.docker.com/) account (Lab 9)

## Distribution boundary

This repository publishes the learner-facing courseware and labs. The assessment answer keys
(`assessment/`), source references (`reference/`), and the Facilitator Guide and Assessment Plan
are trainer-only and are not pushed to GitHub. Learners download the course material from the LMS
at https://lms-tms.tertiaryinfotech.com.

## Provider

Developed and delivered by [Tertiary Infotech Academy Pte Ltd](https://www.tertiarycourses.com.sg/) (UEN 201200696W).
