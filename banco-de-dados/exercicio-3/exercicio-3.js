// Exercício 3 — MongoDB (CRUD Básico)

use("blog");
db.posts.drop();

// Create
db.posts.insertOne({
  titulo: "Meu primeiro post",
  autor: "Maria Bovo",
  conteudo: "Começando a aprender MongoDB no bootcamp Orion!"
});

// Schema flexível: documento com o campo novo "tags"
db.posts.insertOne({
  titulo: "Por que NoSQL?",
  autor: "Ana Lima",
  conteudo: "No MongoDB, documentos da mesma coleção podem ter estruturas diferentes.",
  tags: ["nosql", "flexivel"]
});

// Read
db.posts.find();