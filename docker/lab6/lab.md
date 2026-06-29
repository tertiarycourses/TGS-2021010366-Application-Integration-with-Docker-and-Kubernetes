# Lab 6: Networks

```bash
# List networks
docker network ls

# Create a custom bridge network
docker network create my-net

# Inspect a network
docker network inspect my-net

# Run two containers on the same network (busybox has ping built-in)
docker run -d --name app1 --network my-net busybox sleep 3600
docker run -d --name app2 --network my-net busybox sleep 3600

# Containers on the same network can reach each other by name
docker exec app1 ping -c 2 app2

# Disconnect a container from a network
docker network disconnect my-net app2

# Ping again — this will fail because app2 is no longer on the network
docker exec app1 ping -c 2 app2

# Connect it back
docker network connect my-net app2

# Ping again — works now
docker exec app1 ping -c 2 app2

# Clean up
docker stop app1 app2 && docker rm app1 app2
docker network rm my-net
```
