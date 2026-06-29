# Lab 2: Running Nginx and Writing to a File

```bash
# Run an nginx container in the background
docker run -d --name my-nginx nginx:latest

# Print /etc/hosts to a text file inside the container
docker exec my-nginx sh -c "cat /etc/hosts > /tmp/hosts.txt"

# View the file
docker exec my-nginx cat /tmp/hosts.txt

# Copy the file from the container to your local machine
docker cp my-nginx:/tmp/hosts.txt ./hosts.txt

# View the local copy
cat hosts.txt

# Clean up
docker stop my-nginx && docker rm my-nginx
```
