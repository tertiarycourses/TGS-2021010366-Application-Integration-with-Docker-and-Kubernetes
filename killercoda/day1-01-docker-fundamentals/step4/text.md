# Lab 4: Flask App in Docker

```bash
mkdir lab4 && cd lab4

cat > app.py << 'PYEOF'
from flask import Flask
app = Flask(__name__)

@app.route("/")
def home():
    return "<h1>Hello from Flask in Docker!</h1>"

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
EXPOSE 5000
CMD ["python", "app.py"]
DEOF

docker build -t lab4 .
docker run -d -p 5001:5000 --name flask-app lab4
curl http://localhost:5001
docker stop flask-app && docker rm flask-app
cd ..
```

**Key concept:** `EXPOSE 5000` documents the port. `-p 5001:5000` maps host→container.
