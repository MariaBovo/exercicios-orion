# Exercícios Orion

Exercícios do bootcamp Orion.

# Docker

Pré-requisito: Docker Desktop instalado e rodando.

Nos exercícios que usam banco de dados, crie o arquivo `.env` a partir do modelo antes de subir:

```bash
cp .env.example .env
```

### Exercício 1 — Hello Container
Aplicação Flask simples rodando em container.

```bash
cd docker/exercicio-1
docker compose up --build
```
Acesse: http://localhost:3000

### Exercício 2 — API + Banco de Dados
API Flask conectada a um PostgreSQL, com volume para persistência e healthcheck.

```bash
cd docker/exercicio-2
docker compose up --build -d
```
- Listar itens: `GET http://localhost:3000/itens`
- Adicionar item: `curl -X POST http://localhost:3000/itens -H "Content-Type: application/json" -d '{"nome": "arroz"}'`

### Exercício 3 — Ambientes Dev e Prod
Dockerfile multi-stage (`dev` com live reload, `prod` com gunicorn e usuário sem privilégios).

```bash
cd docker/exercicio-3
docker compose -f docker-compose.dev.yml up --build -d    # http://localhost:3000
docker compose -f docker-compose.prod.yml up --build -d   # http://localhost:8000
```

### Desafio Extra — Aplicação Completa
API + PostgreSQL + Adminer, com network e volume nomeados e healthchecks.

```bash
cd docker/exercicio-extra
docker compose up --build -d
```
- API: http://localhost:3000/health
- Adminer: http://localhost:8080 (Sistema: PostgreSQL, Servidor: `db`, dados do `.env`)
