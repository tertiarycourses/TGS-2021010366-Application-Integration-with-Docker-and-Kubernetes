# Lab 10: Docker Compose

Run a Flask app with Docker Compose.

```bash
# Start the service in the background
docker compose up -d

# List running compose services
docker compose ps

# Visit http://localhost:5001

# View logs
docker compose logs

# Follow logs
docker compose logs -f web

# Execute a command in the running service
docker compose exec web python -c "print('inside the container!')"

# Open a shell in the web service
docker compose exec web /bin/bash

# Stop the service
docker compose stop

# Start it again
docker compose start

# Stop and remove everything (containers, networks)
docker compose down
```
