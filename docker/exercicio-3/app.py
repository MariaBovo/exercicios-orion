import os

import psycopg2
from flask import Flask, jsonify, request

app = Flask(__name__)


def conectar():
    return psycopg2.connect(
        host=os.environ["DB_HOST"],
        user=os.environ["DB_USER"],
        password=os.environ["DB_PASS"],
        dbname=os.environ["DB_NAME"],
    )


def executar(sql, parametros=None, buscar=False):
    conexao = conectar()
    try:
        with conexao, conexao.cursor() as cursor:
            cursor.execute(sql, parametros)
            if buscar:
                return cursor.fetchall()
    finally:
        conexao.close()


def criar_tabela():
    executar("CREATE TABLE IF NOT EXISTS itens (id SERIAL PRIMARY KEY, nome TEXT NOT NULL)")


@app.route("/health")
def health():
    return jsonify({"status": "ok"})


@app.route("/itens", methods=["GET"])
def listar_itens():
    linhas = executar("SELECT id, nome FROM itens ORDER BY id", buscar=True)
    return jsonify([{"id": id_, "nome": nome} for id_, nome in linhas])


@app.route("/itens", methods=["POST"])
def adicionar_item():
    nome = request.get_json()["nome"]
    executar("INSERT INTO itens (nome) VALUES (%s)", (nome,))
    return jsonify({"mensagem": f"'{nome}' adicionado!"}), 201


criar_tabela()