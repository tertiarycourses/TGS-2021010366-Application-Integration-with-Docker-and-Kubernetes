# Bind Mounts

Bind mounts map a host folder directly into the container — changes are instant in both directions.

```bash
mkdir -p myfiles
echo "hello from host" > myfiles/note.txt

# Read from host into container
docker run --rm -v $(pwd)/myfiles:/data alpine cat /data/note.txt

# Write from container to host
docker run --rm -v $(pwd)/myfiles:/data alpine \
  sh -c "echo 'hello from container' > /data/reply.txt"

cat myfiles/reply.txt
rm -rf myfiles
```

| | Named Volume | Bind Mount |
|---|---|---|
| Managed by | Docker | You (host path) |
| Use case | Persist data | Dev: live code sync |
| Syntax | `-v my-vol:/app` | `-v $(pwd)/dir:/app` |
