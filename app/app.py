from flask import Flask
from prometheus_client import Counter, start_http_server
import random
import time

app = Flask(__name__)

REQUEST_COUNT = Counter('request_count', 'Total number of requests')

@app.route('/')
def hello():
    REQUEST_COUNT.inc()  # Increment request counter
    return "Hello, World!"

if __name__ == "__main__":
    start_http_server(8000)  # Expose Prometheus metrics on port 8000
    app.run(host='0.0.0.0', port=5000)
