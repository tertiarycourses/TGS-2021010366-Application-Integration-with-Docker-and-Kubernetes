# Lab 7: Port Mapping

Build the Flask image from Lab 4 first:

```bash
mkdir lab4 && cd lab4
cat > app.py << 'PYEOF'
from flask import Flask
app = Flask(__name__)
@app.route("/")
def home():
    return "<h1>Flask running!</h1>"
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
cd ..
```

```bash
# Map host 5001 -> container 5000
docker run -d -p 5001:5000 --name web1 lab4
curl http://localhost:5001

# Second instance on different port
docker run -d -p 5002:5000 --name web2 lab4
curl http://localhost:5002

# View port mappings
docker port web1
docker port web2

# Let Docker pick a random port
docker run -d -P --name web3 lab4
docker port web3

docker stop web1 web2 web3 && docker rm web1 web2 web3
```
