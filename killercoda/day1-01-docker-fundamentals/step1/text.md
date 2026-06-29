# Lab 1: Run Your First Container

Run an interactive Ubuntu container and explore it from the inside.

```bash
docker run -it ubuntu:latest
```

Inside the container:
```bash
cat /etc/hosts
exit
```

Back on the host:
```bash
# List running containers
docker ps

# List ALL containers including stopped
docker ps -a
```

**Key concept:** `docker run -it` = interactive terminal. When you `exit`, the container stops but is not deleted.

## Verify
```bash
docker ps -a | grep ubuntu
```
You should see the stopped Ubuntu container.
