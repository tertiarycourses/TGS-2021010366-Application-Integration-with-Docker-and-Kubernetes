# Test 2: Docker Compose Practical Test

Set up a WordPress site using Docker Compose with a MySQL database.

---

## Part A: Write a docker-compose.yml

Create a `docker-compose.yml` with two services:

### 1. db (MySQL)
- Use image `mysql:8.0`
- Set these environment variables:
  - `MYSQL_ROOT_PASSWORD` = `rootpass`
  - `MYSQL_DATABASE` = `wordpress`
  - `MYSQL_USER` = `wpuser`
  - `MYSQL_PASSWORD` = `wppass`
- Use a named volume `db-data` mounted to `/var/lib/mysql`

### 2. wordpress (WordPress)
- Use image `wordpress:latest`
- Map port `8080` on your host to port `80` in the container
- Set these environment variables:
  - `WORDPRESS_DB_HOST` = `db`
  - `WORDPRESS_DB_USER` = `wpuser`
  - `WORDPRESS_DB_PASSWORD` = `wppass`
  - `WORDPRESS_DB_NAME` = `wordpress`
- Depends on `db`

---

## Part B: Run and Verify

1. Start all services with `docker compose up -d`
2. Run `docker compose ps` to check both services are running
3. Visit http://localhost:8080 to see the WordPress setup page
