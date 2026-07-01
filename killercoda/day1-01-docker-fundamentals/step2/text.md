# Lab 2: Run Nginx and Copy a File Out

Run Nginx in the background, then copy a file from the container to the host.

```bash
docker run -d --name my-nginx nginx:latest
docker ps
docker cp my-nginx:/usr/share/nginx/html/index.html ./index.html
cat index.html
```

## Inspect and clean up
```bash
docker logs my-nginx
docker stop my-nginx
docker rm my-nginx
```

**Key concept:** `docker cp` works in both directions — host→container and container→host. The container does not need to be running.
