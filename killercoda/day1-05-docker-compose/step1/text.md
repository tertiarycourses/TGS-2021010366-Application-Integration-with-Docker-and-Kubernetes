# Lab 10: Single Service Compose

```bash
mkdir lab10 && cd lab10

cat > app.py << 'PYEOF'
from flask import Flask
app = Flask(__name__)
@app.route("/")
def home():
    return "<h1>Hello from Docker Compose!</h1>"
if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
PYEOF

echo "flask" > requirements.txt

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
YEOF

docker-compose up -d
docker-compose ps
curl http://localhost:5001
docker-compose logs
docker-compose exec web python -c "print('Running inside the container')"
docker-compose stop
docker-compose start
docker-compose down
cd ..
```
