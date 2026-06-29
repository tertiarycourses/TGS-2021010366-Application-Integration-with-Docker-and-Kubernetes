import os
from flask import Flask

app = Flask(__name__)


@app.route("/")
def hello():
    import redis
    r = redis.Redis(host=os.getenv("REDIS_HOST", "redis"), port=6379, decode_responses=True)
    count = r.incr("hits")
    return f"Hello from Docker! This page has been viewed {count} times."


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
