# Lab 1: Running Your First Container

```bash
# Run an interactive Ubuntu container
docker run -it ubuntu:latest

# Inside the container — view the hosts file
cat etc/hosts

# Exit the container
exit

# List running containers
docker ps

# List all containers (including stopped)
docker ps -a
```
