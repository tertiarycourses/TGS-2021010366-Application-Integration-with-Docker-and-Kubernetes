# Lab 8: Environment Variables

```bash
mkdir lab8 && cd lab8

cat > main.py << 'PYEOF'
import os
name = os.environ.get("MY_NAME", "World")
env  = os.environ.get("MY_ENV",  "development")
print(f"Hello, {name}! Environment: {env}")
PYEOF

cat > Dockerfile << 'DEOF'
FROM python:3.11-slim
WORKDIR /app
ENV MY_NAME=World
ENV MY_ENV=development
COPY main.py .
CMD ["python", "main.py"]
DEOF

docker build -t lab8 .

# Run with Dockerfile defaults
docker run lab8

# Override at runtime
docker run -e MY_NAME=Alfred lab8
docker run -e MY_NAME=Alfred -e MY_ENV=production lab8

# Use an env file
cat > .env << 'ENVEOF'
MY_NAME=Student
MY_ENV=staging
ENVEOF
docker run --env-file .env lab8

# List all env vars inside the container
docker run lab8 env

cd ..
docker system prune -f
```

**Key concept:** `ENV` in Dockerfile sets defaults. `-e` or `--env-file` overrides at runtime. Never hardcode secrets in images.
