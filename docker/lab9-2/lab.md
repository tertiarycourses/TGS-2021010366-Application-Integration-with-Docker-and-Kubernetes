# Lab 9-2: Push to Docker Hub

Share your image by pushing it to Docker Hub.

```bash
# Log in to Docker Hub
docker login

# Build the image
docker build -t lab4 .

# Tag the image for Docker Hub (replace <your-username> with your Docker Hub username)
docker tag lab4 <your-username>/lab4:v1

# Push the image
docker push <your-username>/lab4:v1

# Verify it on Docker Hub — visit https://hub.docker.com/r/<your-username>/lab4

# Now anyone can pull and run your image
docker pull <your-username>/lab4:v1
docker run -p 5001:5000 <your-username>/lab4:v1

# Tag as latest
docker tag lab4 <your-username>/lab4:latest
docker push <your-username>/lab4:latest

# Log out when done
docker logout
```
