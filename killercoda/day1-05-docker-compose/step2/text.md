# Lab 11: Flask + Redis

```bash
mkdir lab11 && cd lab11

cat > app.py << 'PYEOF'
from flask import Flask
import redis
app = Flask(__name__)
r = redis.Redis(host="redis", port=6379)

@app.route("/")
def home():
    count = r.incr("visits")
    return f"<h1>Visit count: {count}</h1>"

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
PYEOF

printf "flask\nredis\n" > requirements.txt

cat > Dockerfile << 'DEOF'
FROM python:3.11-slim
WORKDIR /app
COPY requirements.txt .
RUN pip install -r requirements.txt
COPY . .
CMD ["python", "app.py"]
DEOF

cat > docker-compose.yml << 'YEOF'
services:
  web:
    build: .
    ports:
      - "5001:5000"
    depends_on:
      - redis
  redis:
    image: redis:7-alpine
YEOF

docker compose up -d
docker compose ps
curl http://localhost:5001
curl http://localhost:5001
curl http://localhost:5001
docker compose down
cd ..
```

Each request increments the visit counter stored in Redis.
