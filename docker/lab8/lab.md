# Lab 8: Environment Variables

Pass configuration to containers using environment variables.

The Dockerfile sets defaults with `ENV`:

```dockerfile
ENV MY_NAME=World
ENV MY_ENV=development
```

```bash
# Build the image
docker build -t lab8 .

# Run with default ENV values from Dockerfile
docker run lab8

# Override ENV values at runtime with -e
docker run -e MY_NAME=Alfred lab8

# Override multiple values
docker run -e MY_NAME=Alfred -e MY_ENV=production lab8

# Use an env file instead
# First create the file:
# echo "MY_NAME=Alfred" > .env
# echo "MY_ENV=production" >> .env
docker run --env-file .env lab8

# View all env variables inside a container
docker run lab8 env

# Clean up
docker system prune -f
```
