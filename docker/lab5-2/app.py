import os

data_dir = "/app/data"
file_path = os.path.join(data_dir, "counter.txt")

# Read current count
if os.path.exists(file_path):
    with open(file_path) as f:
        count = int(f.read())
else:
    count = 0

count += 1

# Write updated count
with open(file_path, "w") as f:
    f.write(str(count))

print(f"Run count: {count}")
print(f"Data stored in: {file_path}")
