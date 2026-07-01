# Lab 6: Custom Networks

Containers on the same custom network can reach each other by **name**.

```bash
docker network ls
docker network create my-net
docker network inspect my-net

docker run -d --name app1 --network my-net busybox sleep 3600
docker run -d --name app2 --network my-net busybox sleep 3600

# app1 pings app2 by name — no IP needed!
docker exec app1 ping -c 3 app2

# Disconnect app2
docker network disconnect my-net app2
docker exec app1 ping -c 2 app2  # fails

# Reconnect
docker network connect my-net app2
docker exec app1 ping -c 2 app2  # works again

docker stop app1 app2 && docker rm app1 app2
docker network rm my-net
```

**Key concept:** Custom bridge networks provide automatic DNS resolution by container name.
