# Test 1: Docker Practical Test

You are given a simple Flask note-taking app (`app.py` and `requirements.txt`). Complete the tasks below.

---

## Part A: Write a Dockerfile

Create a `Dockerfile` that:

1. Uses `python:3.12-slim` as the base image
2. Sets the working directory to `/app`
3. Copies `requirements.txt` and installs dependencies using `pip install --no-cache-dir`
4. Copies the rest of the application code
5. Sets these default environment variables:
   - `DATA_DIR` = `/app/data`
   - `APP_PORT` = `5000`
6. Declares `/app/data` as a volume
7. Exposes port `5000`
8. Runs the app with `python app.py`

---

## Part B: Build and Run

1. Build the image and tag it as `notes-app`
2. Run the container with port mapped to `5001` on your host
3. Add a note using: `curl -X POST -d "note=Hello Docker" http://localhost:5001/add`
4. View the notes: `curl http://localhost:5001/notes`

---

## Part C: Push to Docker Hub

1. Tag your image for Docker Hub: `<your-username>/notes-app:v1`
2. Push the image to Docker Hub
3. What command would someone else run to pull and use your image?

---

## Part D: Conceptual Questions

1. Why do we `COPY requirements.txt` and `RUN pip install` before `COPY . .`?
2. What is the difference between `EXPOSE 5000` and `-p 5001:5000`?
3. What is the difference between a named volume and an anonymous volume?
4. How many layers does your Dockerfile create? Which instructions create layers?
5. What happens to data inside a container when you `docker rm` it?
