# Lab 4: Flask App in Docker

Build and run a Flask web app in a container. Work through each section in order.

---

## Section 1: Building Images

```bash
# Build an image from the Dockerfile and tag it "lab4"
docker build -t lab4 .

# List all local images
docker images

# Tag an existing image with a new name
docker tag lab4 lab4:v1

# View image history (layers)
docker history lab4

# Inspect image details
docker image inspect lab4
```

**Try it:** Build the image, then run `docker images` to confirm it appears.

---

## Section 2: Running Containers

```bash
# Run a container in the foreground (Ctrl+C to stop)
docker run -p 5001:5000 lab4

# Run a container in the background (detached)
docker run -d -p 5001:5000 --name my-app lab4

# Run an interactive shell inside a new container
docker run -it lab4 /bin/bash

# Inside the container, run:
python main.py

# List running containers
docker ps

# List ALL containers (including stopped)
docker ps -a

# Stop a running container
docker stop my-app

# Start a stopped container
docker start my-app

# Restart a container
docker restart my-app

# Rename a container
docker rename my-app my-flask-app

# Remove a stopped container
docker stop my-flask-app
docker rm my-flask-app
```

**Try it:** Run the app in detached mode, visit http://localhost:5001 in your browser, then stop and remove it.

---

## Section 3: Inspecting Containers

First, start a container to inspect:

```bash
docker run -d -p 5001:5000 --name my-app lab4
```

Now try these commands:

```bash
# View container logs
docker logs my-app

# Follow logs in real time (Ctrl+C to exit)
docker logs -f my-app

# Show only the last 5 log lines
docker logs --tail 5 my-app

# Execute a command inside a running container
docker exec my-app ls /app

# Open an interactive shell in the running container
docker exec -it my-app /bin/bash

# View running processes inside the container
docker top my-app

# View detailed container metadata
docker inspect my-app

# View live resource usage (Ctrl+C to exit)
docker stats

# View port mappings
docker port my-app
```

**Try it:** Hit http://localhost:5001 a few times, then check `docker logs my-app` to see the request log entries.

Clean up:

```bash
docker stop my-app && docker rm my-app
```

