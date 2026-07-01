# Lab 5: CMD vs ENTRYPOINT

```bash
mkdir lab5 && cd lab5

cat > Dockerfile << 'DEOF'
FROM alpine:3.18
# ENTRYPOINT = the fixed tool (always runs)
ENTRYPOINT ["ping", "-c", "3"]
# CMD = the default argument (replaced when you pass args to docker run)
CMD ["localhost"]
DEOF

docker build -t pinger .

# Default: CMD kicks in — pings localhost
docker run --rm pinger

# Override CMD — same image, different target
docker run --rm pinger 8.8.8.8

docker run --rm pinger google.com

# Even ENTRYPOINT can be overridden with --entrypoint
docker run --rm --entrypoint sh pinger -c "echo I replaced the entrypoint"

cd ..
```

**Key concept:** `ENTRYPOINT` locks in the tool; `CMD` is the default argument — pass args to `docker run` to override `CMD` without changing the image. Use `--entrypoint` to override even the tool itself.
