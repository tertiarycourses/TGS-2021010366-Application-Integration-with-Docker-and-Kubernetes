# Lab 3: Build and Run a Python Container

```bash
# Build the image
docker build -t lab3 .

# Run the container
docker run lab3

# List all containers (including stopped)
docker ps -a

# Remove the stopped container
docker rm <container_id>
```
