from flask import Flask, jsonify
import time
import yaml
import requests
import socket
import mysql.connector

app = Flask(__name__)

def load_config():
    with open('../config/healthchecks.yml') as f:
        return yaml.safe_load(f)

def http_check(cfg):
    start = time.time()
    try:
        r = requests.get(cfg['url'], timeout=5)
        response_time = (time.time() - start) * 1000

        return {
            "status": r.status_code == cfg.get('expected_status', 200),
            "response_time": response_time
        }
    except:
        return {"status": False, "response_time": None}

def tcp_check(cfg):
    try:
        s = socket.create_connection((cfg['host'], cfg['port']), timeout=5)
        s.close()
        return {"status": True}
    except:
        return {"status": False}

def db_check(cfg):
    try:
        conn = mysql.connector.connect(
            host="db",
            user="user",
            password="pass",
            database="app"
        )
        cursor = conn.cursor()
        cursor.execute("SELECT 1")
        return {"status": True}
    except:
        return {"status": False}

@app.route("/health/status")
def health():
    config = load_config()
    results = {}

    for name, cfg in config['healthchecks'].items():
        if cfg['type'] == 'http':
            results[name] = http_check(cfg)
        elif cfg['type'] == 'tcp':
            results[name] = tcp_check(cfg)
        elif cfg['type'] == 'database':
            results[name] = db_check(cfg)

    return jsonify(results)

@app.route("/metrics")
def metrics():
    # Simples mock (pode salvar no banco depois)
    return jsonify({
        "uptime": "99.9%",
        "response_time_avg": "120ms"
    })

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)