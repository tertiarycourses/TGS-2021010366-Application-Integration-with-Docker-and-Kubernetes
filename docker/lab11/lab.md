# Lab 11: Docker Compose with Multiple Services

Run a multi-service app (Flask + Redis) with Docker Compose.

```bash
# Start all services in the background
docker compose up -d

# List running compose services
docker compose ps

# Visit http://localhost:5001 — refresh to see the counter increment

# View logs from all services
docker compose logs

# Follow logs from just the web service
docker compose logs -f web

# Execute a command in a running service
docker compose exec web python -c "print('inside the container!')"

# Open a shell in the web service
docker compose exec web /bin/bash

# Stop all services
docker compose stop

# Start them again
docker compose start

# Stop and remove everything (containers, networks)
docker compose down
```
