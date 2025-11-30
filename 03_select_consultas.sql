SELECT * FROM pessoa;

SELECT titulo, autor FROM livro ORDER BY titulo;

SELECT e.id_emprestimo, p.nome, l.titulo
FROM emprestimo e
JOIN pessoa p ON e.id_pessoa = p.id_pessoa
JOIN exemplar ex ON e.id_exemplar = ex.id_exemplar
JOIN livro l ON ex.id_livro = l.id_livro;

SELECT * FROM reserva WHERE status = 'ATIVA' LIMIT 5;

SELECT m.valor, m.dias_atraso
FROM multa m
JOIN emprestimo e ON m.id_emprestimo = e.id_emprestimo;
