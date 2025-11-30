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
