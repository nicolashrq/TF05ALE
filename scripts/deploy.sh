#!/bin/bash
set -e

BACKUP_DIR="backups/$(date +%Y%m%d_%H%M%S)"

echo "Iniciando deploy..."

# Criar backup
echo "Criando backup..."
./scripts/backup.sh "$BACKUP_DIR"

# Health check pré-deploy
echo "Verificando saúde atual..."
./scripts/health-monitor.sh --pre-deploy

# Deploy com zero downtime
echo "Executando deploy..."
docker-compose up -d --no-deps --scale backend=2 backend-new
sleep 30

# Verificar saúde do novo serviço
if ./scripts/health-monitor.sh --check backend-new; then
    echo "Novo serviço saudável, finalizando deploy..."
    docker-compose stop backend
    docker-compose up -d --no-deps --scale backend-new=0 --scale backend=1
else
    echo "Falha no deploy, executando rollback..."
    ./scripts/rollback.sh "$BACKUP_DIR"
    exit 1
fi

echo "Deploy concluído com sucesso!"