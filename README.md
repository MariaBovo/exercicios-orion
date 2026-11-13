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


## Banco de Dados

Pré-requisito: Docker Desktop instalado e rodando.

Para subir o PostgreSQL e o MongoDB:

```bash
cd banco-de-dados
docker compose up -d
```

### Exercícios 1 e 2 — SQL (PostgreSQL)
Criação das tabelas `cursos` e `alunos` com chave estrangeira, consultas com JOIN, WHERE, UPDATE e LEFT JOIN.

```bash
docker compose exec -T db_postgres psql -U orion_user -d orion_db < exercicio-1/exercicio-1.sql
docker compose exec -T db_postgres psql -U orion_user -d orion_db < exercicio-2/exercicio-2.sql
```

### Exercícios 3 e 4 — NoSQL (MongoDB)
Coleção `posts` com schema flexível, `updateOne` com array de documentos e consultas em arrays e documentos aninhados.

```bash
docker compose exec -T db_mongo mongosh "mongodb://orion_admin:orion_admin_pass@localhost:27017/" --quiet < exercicio-3/exercicio-3.js
docker compose exec -T db_mongo mongosh "mongodb://orion_admin:orion_admin_pass@localhost:27017/" --quiet < exercicio-4/exercicio-4.js
```
