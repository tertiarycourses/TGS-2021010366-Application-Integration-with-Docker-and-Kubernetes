# Named Volumes

Named volumes are managed by Docker and survive container removal.

```bash
docker volume create my-data
docker volume ls
docker volume inspect my-data

docker run -d --name app1 -v my-data:/data alpine sleep 3600
docker exec app1 sh -c "echo 'hello from app1' > /data/test.txt"
docker exec app1 cat /data/test.txt

# Remove container — data stays in the volume
docker stop app1 && docker rm app1

# New container, same volume — data is still there!
docker run -d --name app2 -v my-data:/data alpine sleep 3600
docker exec app2 cat /data/test.txt

docker stop app2 && docker rm app2
docker volume rm my-data
```

**Key concept:** Named volumes outlive containers. Use them for databases and any persistent data.
