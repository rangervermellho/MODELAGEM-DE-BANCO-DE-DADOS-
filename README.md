# Sistema de Biblioteca – Banco de Dados Relacional

## 1. Descrição do Projeto

Este projeto tem como objetivo o desenvolvimento de um banco de dados relacional para o gerenciamento de uma biblioteca, contemplando o controle de pessoas, livros, exemplares, empréstimos, reservas e multas.

O modelo foi desenvolvido a partir de um minimundo previamente definido e passou pelo processo de normalização, atendendo às formas normais **Primeira (1FN), Segunda (2FN) e Terceira Forma Normal (3FN)**, garantindo integridade, organização e eliminação de redundâncias.

---

## 2. Minimundo

O sistema de biblioteca permite:
- O cadastro de pessoas (usuários e funcionários);
- O cadastro de livros e seus respectivos exemplares;
- O controle de empréstimos de exemplares para pessoas;
- O registro de reservas de livros;
- O controle de multas associadas a empréstimos com atraso.

---

## 3. Modelo Lógico

O modelo lógico inclui as seguintes entidades:
- Pessoa
- Livro
- Exemplar
- Empréstimo
- Reserva
- Multa

Todos os relacionamentos possuem cardinalidade definida e estão de acordo com as regras de normalização.

---

## 4. Tecnologias Utilizadas

- MySQL 8.x
- SQL padrão
- GitHub para versionamento

---

## 5. Estrutura do Repositório

├── 01_create_tables.sql
├── 02_insert_dados.sql
├── 03_select_consultas.sql
├── 04_update_dados.sql
└── 05_delete_dados.sql


---

## 6. Instruções de Execução

1. Criar o banco de dados no MySQL:
   ```sql
   CREATE DATABASE biblioteca;
   USE biblioteca;

Executar os scripts na seguinte ordem:

01_create_tables.sql
02_insert_dados.sql
03_select_consultas.sql
04_update_dados.sql
05_delete_dados.sql



---
## 7. Autor

Projeto desenvolvido para fins acadêmicos.
  01_create_tables.sql

```sql
CREATE TABLE pessoa (
    id_pessoa INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf CHAR(14) NOT NULL UNIQUE,
    telefone CHAR(17),
    email VARCHAR(255),
    funcionario BOOLEAN DEFAULT FALSE
);

CREATE TABLE livro (
    id_livro INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    autor VARCHAR(255),
    editora VARCHAR(255),
    ano_publicado DATE,
    categoria VARCHAR(50),
    isbn VARCHAR(13),
    paginas INT
);

CREATE TABLE exemplar (
    id_exemplar INT AUTO_INCREMENT PRIMARY KEY,
    codigo_patrimonio VARCHAR(20),
    estado_exemplar VARCHAR(15),
    id_livro INT,
    FOREIGN KEY (id_livro) REFERENCES livro(id_livro)
);

CREATE TABLE emprestimo (
    id_emprestimo INT AUTO_INCREMENT PRIMARY KEY,
    data_emprestimo DATE NOT NULL,
    data_prevista DATE,
    data_devolucao DATE,
    id_pessoa INT,
    id_funcionario INT,
    id_exemplar INT,
    FOREIGN KEY (id_pessoa) REFERENCES pessoa(id_pessoa),
    FOREIGN KEY (id_funcionario) REFERENCES pessoa(id_pessoa),
    FOREIGN KEY (id_exemplar) REFERENCES exemplar(id_exemplar)
);
  

CREATE TABLE reserva (
    id_reserva INT AUTO_INCREMENT PRIMARY KEY,
    data_reserva DATE NOT NULL,
    status ENUM('ATIVA','CANCELADA','FINALIZADA'),
    id_pessoa INT,
    id_livro INT,
    FOREIGN KEY (id_pessoa) REFERENCES pessoa(id_pessoa),
    FOREIGN KEY (id_livro) REFERENCES livro(id_livro)
);

CREATE TABLE multa (
    id_multa INT AUTO_INCREMENT PRIMARY KEY,
    valor FLOAT,
    dias_atraso INT,
    id_emprestimo INT,
    FOREIGN KEY (id_emprestimo) REFERENCES emprestimo(id_emprestimo)
);

  📄 02_insert_dados.sql

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

  📄 03_select_consultas.sql

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


  📄 04_update_dados.sql

UPDATE exemplar
SET estado_exemplar = 'Disponível'
WHERE id_exemplar = 2;

UPDATE reserva
SET status = 'FINALIZADA'
WHERE id_reserva = 1;

UPDATE multa
SET valor = 20.00
WHERE id_multa = 1;

  📄 05_delete_dados.sql

DELETE FROM multa
WHERE dias_atraso < 1;

DELETE FROM reserva
WHERE status = 'CANCELADA';

DELETE FROM emprestimo
WHERE data_devolucao IS NOT NULL;
