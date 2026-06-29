import os
from flask import Flask, request

app = Flask(__name__)

DATA_DIR = os.getenv("DATA_DIR", "/app/data")
APP_PORT = int(os.getenv("APP_PORT", "5000"))


@app.route("/")
def home():
    notes = read_notes()
    return f"Notes App - {len(notes)} notes stored\n"


@app.route("/add", methods=["POST"])
def add_note():
    note = request.form.get("note", "")
    if note:
        filepath = os.path.join(DATA_DIR, "notes.txt")
        with open(filepath, "a") as f:
            f.write(note + "\n")
        return f"Note added: {note}\n"
    return "No note provided\n"


@app.route("/notes")
def list_notes():
    notes = read_notes()
    if notes:
        return "\n".join(notes) + "\n"
    return "No notes yet\n"


def read_notes():
    filepath = os.path.join(DATA_DIR, "notes.txt")
    if os.path.exists(filepath):
        with open(filepath) as f:
            return [line.strip() for line in f if line.strip()]
    return []


if __name__ == "__main__":
    os.makedirs(DATA_DIR, exist_ok=True)
    app.run(host="0.0.0.0", port=APP_PORT)
