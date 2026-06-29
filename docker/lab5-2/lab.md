# Lab 5-2: Volume Defined in Dockerfile

The `VOLUME` instruction in a Dockerfile declares a mount point. Docker automatically creates an anonymous volume for it.

```dockerfile
VOLUME /app/data
```

```bash
# Build the image
docker build -t lab5-2 .

# Run — Docker auto-creates an anonymous volume for /app/data
docker run --name my-app lab5-2

# Run again — count resets because each run gets a NEW anonymous volume
docker run --rm lab5-2

# To persist data, use a named volume that maps to the same path
docker volume create my-data
docker run --rm -v my-data:/app/data lab5-2
docker run --rm -v my-data:/app/data lab5-2
docker run --rm -v my-data:/app/data lab5-2
# Count increments each time!

# Inspect the anonymous volume created by VOLUME instruction
docker inspect my-app --format '{{json .Mounts}}'

# Clean up
docker rm my-app
docker volume rm my-data
docker volume prune -f
```
