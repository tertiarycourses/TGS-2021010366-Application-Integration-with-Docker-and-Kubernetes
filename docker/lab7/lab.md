# Lab 7: Port Mapping

Containers run in an isolated network. Port mapping exposes container ports to your host machine.

```bash
# Run Flask app — map host port 5001 to container port 5000
docker run -d -p 5001:5000 --name web1 lab4

# Visit http://localhost:5001 — this reaches the container's port 5000

# Run a second instance on a different host port
docker run -d -p 5002:5000 --name web2 lab4

# Visit http://localhost:5002 — same app, different port

# View port mappings
docker port web1
docker port web2

# Map a random available host port (Docker picks one for you)
docker run -d -P --name web3 lab4

# See which port Docker assigned
docker port web3

# Run without -p — container is NOT accessible from host
docker run -d --name web4 lab4

# This will fail — no port mapped
# curl http://localhost:5000

# But the container is still running internally
docker exec web4 curl -s http://localhost:5000

# Clean up
docker stop web1 web2 web3 web4 && docker rm web1 web2 web3 web4
```
