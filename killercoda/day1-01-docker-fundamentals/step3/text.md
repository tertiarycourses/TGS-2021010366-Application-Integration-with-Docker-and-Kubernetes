# Lab 3: Build a Python Image

```bash
mkdir lab3 && cd lab3

cat > main.py << 'PYEOF'
print("Hello from inside Docker!")
PYEOF

cat > Dockerfile << 'DEOF'
FROM python:3.11-slim
WORKDIR /app
COPY main.py .
CMD ["python", "main.py"]
DEOF

docker build -t lab3 .
docker run lab3
```

Expected: `Hello from inside Docker!`

```bash
docker images | grep lab3
docker ps -a | grep lab3
cd ..
```

**Key concept:** Each line in a Dockerfile is a cached layer. Only changed layers rebuild.
