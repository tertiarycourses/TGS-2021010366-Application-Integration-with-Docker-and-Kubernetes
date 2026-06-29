# Lab 3-2: Run a Tetris Game in Docker

Build and run a static web app (Tetris) using Nginx in a container.

```bash
# Build the image
cd tetris-game
docker build -t tetris .

# Run the container
docker run -d -p 8080:80 --name tetris tetris

# Visit http://localhost:8080 to play Tetris!

# Stop and remove
docker stop tetris && docker rm tetris
```
