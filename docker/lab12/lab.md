# Lab 12: Multi-Service App (Web + Database + Redis)

A full-stack setup with a Node.js web server, PostgreSQL database, and Redis cache.

## Architecture

- **web** — Node.js Express app (port 3000)
- **db** — PostgreSQL 16 (port 5432)
- **redis** — Redis 7 (port 6379)

All services are on a custom bridge network (`app-network`) and use named volumes for data persistence.

## Key Concepts

- `build.args` — pass build-time variables (NODE_ENV)
- `env_file` — load environment variables from a file
- `depends_on` with `condition: service_healthy` — wait for db to be ready
- `healthcheck` — define how Docker checks if a service is healthy
- `restart: unless-stopped` — auto-restart on failure
- `deploy.resources.limits` — limit CPU and memory usage
- `networks` — custom bridge network for service communication
- Named `volumes` — persist database and Redis data

```bash
# Start all services
docker compose up -d

# Check service health status
docker compose ps

# Visit http://localhost:3000 — shows visit count (Redis)
# Visit http://localhost:3000/db — shows database time (PostgreSQL)
# Visit http://localhost:3000/health — health check endpoint

# View logs from all services
docker compose logs

# View logs from a specific service
docker compose logs -f web
docker compose logs -f db

# Execute a command in the database
docker compose exec db psql -U user -d mydb -c "SELECT NOW();"

# Connect to Redis CLI
docker compose exec redis redis-cli
# Inside Redis: GET visits

# Check resource usage
docker stats

# Stop all services
docker compose stop

# Stop and remove everything (containers, networks)
docker compose down

# Stop and remove everything INCLUDING volumes (data reset)
docker compose down -v
```
