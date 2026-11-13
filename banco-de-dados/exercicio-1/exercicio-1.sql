-- Exercício 1 — SQL Básico

DROP TABLE IF EXISTS alunos;
DROP TABLE IF EXISTS cursos;

CREATE TABLE cursos (
    id SERIAL PRIMARY KEY,
    nome_curso VARCHAR(100) NOT NULL
);

CREATE TABLE alunos (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    curso_id INTEGER NOT NULL,
    CONSTRAINT fk_alunos_cursos FOREIGN KEY (curso_id) REFERENCES cursos (id)
);

INSERT INTO cursos (nome_curso) VALUES
    ('Desenvolvimento Web'),
    ('Ciência de Dados'),
    ('Design UX');

INSERT INTO alunos (nome, email, curso_id) VALUES
    ('João Silva', 'joao.silva@email.com', 1),
    ('Maria Souza', 'maria.souza@email.com', 1),
    ('Pedro Santos', 'pedro.santos@email.com', 2),
    ('Ana Oliveira', 'ana.oliveira@email.com', 2);

-- Teste da FK: deve falhar, pois o curso 99 não existe
INSERT INTO alunos (nome, email, curso_id) VALUES
    ('Aluno Fantasma', 'fantasma@email.com', 99);

SELECT * FROM alunos;