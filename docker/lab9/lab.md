# Lab 9: Push the Tetris Game to Docker Hub

Push the Tetris game from Lab 3-2 to Docker Hub so anyone can pull and play it.

```bash
# Log in to Docker Hub
docker login

# Build the Tetris image from lab3-2
cd ../lab3-2/tetris-game
docker build -t tetris .

# Tag the image for Docker Hub (replace <your-username> with your Docker Hub username)
docker tag tetris <your-username>/tetris:v1

# Push the image
docker push <your-username>/tetris:v1

# Verify it on Docker Hub — visit https://hub.docker.com/r/<your-username>/tetris

# Now anyone can pull and run your Tetris game
docker pull <your-username>/tetris:v1
docker run -d -p 8080:80 <your-username>/tetris:v1

# Visit http://localhost:8080 to play Tetris!

# Clean up
docker stop $(docker ps -q --filter ancestor=<your-username>/tetris:v1)

# Log out when done
docker logout
```
