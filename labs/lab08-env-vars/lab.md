# Lab 8: Configuration with Environment Variables

> **Day 1 — Docker · Environment variables**  
> KillerCoda: https://killercoda.com/tertiary-labs/course/killercoda/day1-04-docker-config

**Goal:** Configure the SAME TaskBoard image for different environments without rebuilding. You'll set defaults with ENV in the Dockerfile, override per-container with `-e`, and load many values at once from an `--env-file`.

**What you'll build:** Configure TaskBoard (APP_ENV, APP_TITLE) via ENV, -e and --env-file — no rebuild.

### Three ways to pass configuration

TaskBoard reads `APP_ENV` and `APP_TITLE` at runtime. The image already ships sensible defaults; you override them per environment.

### 1. Defaults baked into the image (ENV)

```bash
docker run -d --name tb -p 8080:5000 taskboard:1.0
curl http://localhost:8080/health   # "env": "development"
docker rm -f tb
```

### 2. Override per container with -e

```bash
docker run -d --name tb -p 8080:5000 \
  -e APP_ENV=staging -e 'APP_TITLE=TaskBoard (Staging)' taskboard:1.0
curl http://localhost:8080/health   # "env": "staging"
docker rm -f tb
```

### 3. Load many values from an --env-file

Keep environment config in a file (`.env`) and load it all at once:

```bash
cat .env
docker run -d --name tb -p 8080:5000 --env-file .env taskboard:1.0
curl http://localhost:8080/health   # "env": "production"
docker rm -f tb
```

> **Note:** Never bake secrets into an image. Pass them at runtime with `-e` / `--env-file` (and in Kubernetes, with ConfigMaps and Secrets — Day 2).

> ✅ **Test it:** The `/health` endpoint reports `development`, then `staging`, then `production` as you change only the environment variables — the image is never rebuilt.
