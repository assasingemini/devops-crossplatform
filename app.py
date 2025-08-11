# app.py
from flask import Flask
import os, platform

app = Flask(__name__)

@app.get("/")
def hello():
    return (
        "Hello from Linux container!\n"
        f"OS={platform.platform()}\n"
        f"Commit={os.getenv('CODEBUILD_RESOLVED_SOURCE_VERSION','local')}\n"
    ), 200, {"Content-Type": "text/plain; charset=utf-8"}

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8080)
