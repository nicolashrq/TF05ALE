#!/bin/bash
set -e

echo "Build iniciado..."

docker-compose build --no-cache

echo "Build finalizado!"