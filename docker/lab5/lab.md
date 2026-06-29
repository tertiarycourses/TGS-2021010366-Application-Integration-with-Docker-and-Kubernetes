# Lab 5: Volumes

Persist data using named volumes and bind mounts.

## Part A: Named Volumes

```bash
# Create a named volume
docker volume create my-data

# List volumes
docker volume ls

# Inspect a volume
docker volume inspect my-data

# Run a container with a named volume mounted
docker run -d -p 5001:5000 --name my-app -v my-data:/app/data lab4

# Write a file to the volume from inside the container
docker exec my-app sh -c "echo 'hello volumes' > /app/data/test.txt"

# Verify the file exists
docker exec my-app cat /app/data/test.txt

# Stop and remove the container
docker stop my-app && docker rm my-app

# Run a NEW container with the same volume — data persists!
docker run -d -p 5001:5000 --name my-app2 -v my-data:/app/data lab4
docker exec my-app2 cat /app/data/test.txt

# Clean up
docker stop my-app2 && docker rm my-app2
```

## Part B: Bind Mounts

Bind mount maps a folder on your host machine directly into the container.
Changes on the host appear in the container instantly — and vice versa.

```bash
# Create a local folder with a file
mkdir -p myfiles
echo "hello from host" > myfiles/note.txt

# Bind mount the folder into a container
docker run --rm -v $(pwd)/myfiles:/data alpine cat /data/note.txt
# Output: hello from host

# Write a file FROM the container to the host
docker run --rm -v $(pwd)/myfiles:/data alpine sh -c "echo 'hello from container' > /data/reply.txt"

# Check it on your host — the file is there!
cat myfiles/reply.txt
# Output: hello from container

# Clean up
rm -rf myfiles
```

## Named Volume vs Bind Mount

| | Named Volume | Bind Mount |
|---|---|---|
| Syntax | `-v my-data:/app/data` | `-v $(pwd)/folder:/app/data` |
| Managed by | Docker | You (host filesystem) |
| Use case | Persist data (databases, logs) | Development (live code editing) |
| Portability | Works on any machine | Tied to host file path |

```bash
# Clean up volume
docker volume rm my-data
```
