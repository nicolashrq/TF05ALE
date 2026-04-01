# TF05 - Sistema de Monitoramento e Automação

## Aluno
- **Nome:** Nicolas Henrique de Souza Barbosa
- **RA:** 6324048
- **Curso:** Análise e Desenvolvimento de Sistemas

## Funcionalidades
- Healthchecks inteligentes (HTTP, TCP, Database)
- Dashboard de monitoramento em tempo real
- Sistema de alertas (email, webhook)
- Automação completa de deploy
- Rollback automático
- Scripts de manutenção
- Backup automatizado

## Como Executar

### Pré-requisitos
- Docker e Docker Compose
- Bash (para scripts de automação)

### Execução Completa
```bash
git clone [URL_DO_SEU_REPO]
cd TF05

# Build automatizado
./scripts/build.sh

# Deploy automatizado
./scripts/deploy.sh

# Acessar dashboard
open http://localhost:3000