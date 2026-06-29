import os

name = os.getenv("MY_NAME")
env = os.getenv("MY_ENV")

print(f"Hello, {name}!")
print(f"Environment: {env}")
