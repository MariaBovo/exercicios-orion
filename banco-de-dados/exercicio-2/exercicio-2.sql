-- Exercício 2 — JOINs e Filtros

-- Nome do aluno e nome do curso (INNER JOIN)
SELECT alunos.nome, cursos.nome_curso
FROM alunos
INNER JOIN cursos
    ON alunos.curso_id = cursos.id;

-- Apenas os alunos de Desenvolvimento Web (JOIN + WHERE)
SELECT alunos.nome, cursos.nome_curso
FROM alunos
INNER JOIN cursos
    ON alunos.curso_id = cursos.id
WHERE cursos.nome_curso = 'Desenvolvimento Web';

--  Mover a Maria Souza para Ciência de Dados (curso id 2)
UPDATE alunos
SET curso_id = 2
WHERE nome = 'Maria Souza';

SELECT alunos.nome, cursos.nome_curso
FROM alunos
INNER JOIN cursos
    ON alunos.curso_id = cursos.id;

-- Extra: cursos sem nenhum aluno matriculado
SELECT cursos.nome_curso
FROM cursos
LEFT JOIN alunos
    ON alunos.curso_id = cursos.id
WHERE alunos.id IS NULL;