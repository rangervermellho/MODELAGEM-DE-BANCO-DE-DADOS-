INSERT INTO pessoa (nome, cpf, telefone, email, funcionario) VALUES
('Ana Souza', '111.111.111-11', '11999999999', 'ana@email.com', FALSE),
('Carlos Lima', '222.222.222-22', '11888888888', 'carlos@email.com', TRUE);

INSERT INTO livro (titulo, autor, editora, ano_publicado, categoria, isbn, paginas) VALUES
('Banco de Dados', 'Elmasri', 'Pearson', '2018-01-01', 'Tecnologia', '1234567890123', 600);

INSERT INTO exemplar (codigo_patrimonio, estado_exemplar, id_livro) VALUES
('EX001', 'Disponível', 1),
('EX002', 'Emprestado', 1);

INSERT INTO emprestimo (data_emprestimo, data_prevista, data_devolucao, id_pessoa, id_funcionario, id_exemplar) VALUES
('2024-05-01', '2024-05-10', NULL, 1, 2, 2);

INSERT INTO reserva (data_reserva, status, id_pessoa, id_livro) VALUES
('2024-05-02', 'ATIVA', 1, 1);

INSERT INTO multa (valor, dias_atraso, id_emprestimo) VALUES
(15.00, 3, 1);
