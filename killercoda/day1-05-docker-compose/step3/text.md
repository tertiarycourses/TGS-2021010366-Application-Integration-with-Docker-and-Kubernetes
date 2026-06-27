# Lab 12: Full Stack — Web + PostgreSQL + Redis

```bash
mkdir lab12 && cd lab12

cat > app.js << 'JSEOF'
const express = require("express");
const { Pool } = require("pg");
const redis = require("redis");
const app = express();
const pool = new Pool({ connectionString: process.env.DATABASE_URL });
const rc = redis.createClient({ url: process.env.REDIS_URL });
rc.connect();
app.get("/", async (req, res) => {
  const visits = await rc.incr("visits");
  res.send(`<h1>Visits: ${visits}</h1>`);
});
app.get("/db", async (req, res) => {
  const { rows } = await pool.query("SELECT NOW() as time");
  res.send(`<h1>DB time: ${rows[0].time}</h1>`);
});
app.get("/health", (req, res) => res.json({ status: "ok" }));
app.listen(3000, () => console.log("Listening on 3000"));
JSEOF

cat > package.json << 'PEOF'
{"name":"lab12","version":"1.0.0","main":"app.js","dependencies":{"express":"^4","pg":"^8","redis":"^4"}}
PEOF

cat > Dockerfile << 'DEOF'
FROM node:20-alpine
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
EXPOSE 3000
CMD ["node", "app.js"]
DEOF

cat > docker-compose.yml << 'YEOF'
services:
  web:
    build: .
    ports:
      - "3000:3000"
    environment:
      DATABASE_URL: postgresql://user:pass@db:5432/mydb
      REDIS_URL: redis://redis:6379
    depends_on:
      db:
        condition: service_healthy
      redis:
        condition: service_started
  db:
    image: postgres:16-alpine
    environment:
      POSTGRES_USER: user
      POSTGRES_PASSWORD: pass
      POSTGRES_DB: mydb
    healthcheck:
      test: ["CMD-SHELL", "pg_isready -U user -d mydb"]
      interval: 5s
      timeout: 5s
      retries: 5
    volumes:
      - pgdata:/var/lib/postgresql/data
  redis:
    image: redis:7-alpine
    volumes:
      - redisdata:/data
volumes:
  pgdata:
  redisdata:
YEOF

docker compose up -d
docker compose ps
curl http://localhost:3000
curl http://localhost:3000/db
curl http://localhost:3000/health
docker compose down -v
cd ..
```
