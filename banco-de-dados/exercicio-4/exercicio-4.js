// Exercício 4 — MongoDB (Consultas Avançadas)

use("blog");

// Update: array de comentários
db.posts.updateOne(
  { titulo: "Meu primeiro post" },
  {
    $set: {
      comentarios: [
        { autor: "Ana Lima", texto: "Ótimo começo, continue!" },
        { autor: "Pedro Santos", texto: "Também estou aprendendo MongoDB." }
      ]
    }
  }
);

// Busca por tag
db.posts.find({ tags: "nosql" });

// Busca por autor
db.posts.find({ autor: "Maria Bovo" });

// Extra: busca dentro dos comentários
db.posts.find({ "comentarios.autor": "Ana Lima" });