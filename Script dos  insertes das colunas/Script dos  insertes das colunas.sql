INSERT INTO tb_pais (nome, codigo) VALUES ('Brasil', 'BR');
INSERT INTO tb_pais (nome, codigo) VALUES ('Estados Unidos', 'US');
INSERT INTO tb_pais (nome, codigo) VALUES ('Canadá', 'CA');
INSERT INTO tb_pais (nome, codigo) VALUES ('Reino Unido', 'UK');
INSERT INTO tb_pais (nome, codigo) VALUES ('Alemanha', 'DE');



INSERT INTO tipo_pagamento (nome) VALUES ('Cartão de Crédito');
INSERT INTO tipo_pagamento (nome) VALUES ('Cartão de Débito');
INSERT INTO tipo_pagamento (nome) VALUES ('Transferência Bancária');
INSERT INTO tipo_pagamento (nome) VALUES ('Boleto Bancário');
INSERT INTO tipo_pagamento (nome) VALUES ('PayPal');
INSERT INTO tipo_pagamento (nome) VALUES ('Pix');


INSERT INTO tb_ator (foto, data_nascimento, sobrenome, nome) VALUES ('foto1.jpg', '1990-01-01', 'Sobrenome1', 'Nome1');
INSERT INTO tb_ator (foto, data_nascimento, sobrenome, nome) VALUES ('foto2.jpg', '1991-02-02', 'Sobrenome2', 'Nome2');
INSERT INTO tb_ator (foto, data_nascimento, sobrenome, nome) VALUES ('foto3.jpg', '1992-03-03', 'Sobrenome3', 'Nome3');
INSERT INTO tb_ator (foto, data_nascimento, sobrenome, nome) VALUES ('foto4.jpg', '1993-04-04', 'Sobrenome4', 'Nome4');
INSERT INTO tb_ator (foto, data_nascimento, sobrenome, nome) VALUES ('foto5.jpg', '1994-05-05', 'Sobrenome5', 'Nome5');
INSERT INTO tb_ator (foto, data_nascimento, sobrenome, nome) VALUES ('foto6.jpg', '1995-06-06', 'Sobrenome6', 'Nome6');


INSERT INTO tb_classificacao (id_classificacao, idade, descricao) VALUES (1, 12, 'Classificação 1');
INSERT INTO tb_classificacao (id_classificacao, idade, descricao) VALUES (2, 18, 'Classificação 2');
INSERT INTO tb_classificacao (id_classificacao, idade, descricao) VALUES (3, 16, 'Classificação 3');
INSERT INTO tb_classificacao (id_classificacao, idade, descricao) VALUES (4, 14, 'Classificação 4');
INSERT INTO tb_classificacao (id_classificacao, idade, descricao) VALUES (5, 10, 'Classificação 5');
INSERT INTO tb_classificacao (id_classificacao, idade, descricao) VALUES (6, 14, 'Classificação 6');



INSERT INTO tb_idioma (nome, id_idioma) VALUES ('Inglês', 1);
INSERT INTO tb_idioma (nome, id_idioma) VALUES ('Espanhol', 2);
INSERT INTO tb_idioma (nome, id_idioma) VALUES ('Francês', 3);
INSERT INTO tb_idioma (nome, id_idioma) VALUES ('Alemão', 4);
INSERT INTO tb_idioma (nome, id_idioma) VALUES ('Italiano', 5);
INSERT INTO tb_idioma (nome, id_idioma) VALUES ('Português', 6);


INSERT INTO tb_categoria (nome, id_categoria) VALUES ('Ação', 1);
INSERT INTO tb_categoria (nome, id_categoria) VALUES ('Comédia', 2);
INSERT INTO tb_categoria (nome, id_categoria) VALUES ('Drama', 3);
INSERT INTO tb_categoria (nome, id_categoria) VALUES ('Romance', 4);
INSERT INTO tb_categoria (nome, id_categoria) VALUES ('Ficção Científica', 5);
INSERT INTO tb_categoria (nome, id_categoria) VALUES ('Suspense', 6);


INSERT INTO tb_plano (id_plano, valor, descricao, duracao, nome) VALUES (1, 9.99, 'Plano Básico', '1 mês', 'Básico');
INSERT INTO tb_plano (id_plano, valor, descricao, duracao, nome) VALUES (2, 14.99, 'Plano Standard', '1 mês', 'Standard');
INSERT INTO tb_plano (id_plano, valor, descricao, duracao, nome) VALUES (3, 19.99, 'Plano Premium', '1 mês', 'Premium');
INSERT INTO tb_plano (id_plano, valor, descricao, duracao, nome) VALUES (4, 29.99, 'Plano Família', '1 mês', 'Família');
INSERT INTO tb_plano (id_plano, valor, descricao, duracao, nome) VALUES (5, 6.99, 'Plano Básico', '1 semana', 'Básico Semanal');
INSERT INTO tb_plano (id_plano, valor, descricao, duracao, nome) VALUES (6, 9.99, 'Plano Standard', '1 semana', 'Standard Semanal');



INSERT INTO tb_Pagamento (id_pagamento, valor, data_pagamento, id_tipo_pagamento) VALUES (1, 10.50, '2023-06-01', 1);
INSERT INTO tb_Pagamento (id_pagamento, valor, data_pagamento, id_tipo_pagamento) VALUES (2, 15.75, '2023-06-02', 2);
INSERT INTO tb_Pagamento (id_pagamento, valor, data_pagamento, id_tipo_pagamento) VALUES (3, 20.00, '2023-06-03', 1);
INSERT INTO tb_Pagamento (id_pagamento, valor, data_pagamento, id_tipo_pagamento) VALUES (4, 12.99, '2023-06-04', 3);
INSERT INTO tb_Pagamento (id_pagamento, valor, data_pagamento, id_tipo_pagamento) VALUES (5, 8.50, '2023-06-05', 2);
INSERT INTO tb_Pagamento (id_pagamento, valor, data_pagamento, id_tipo_pagamento) VALUES (6, 19.99, '2023-06-06', 1);



INSERT INTO tb_endereco (id_endereco, id_pais, rua, numero, cidade, estado, cep) VALUES (1, 1, 'Rua A', '123', 'Cidade A', 'Estado A', '12345');
INSERT INTO tb_endereco (id_endereco, id_pais, rua, numero, cidade, estado, cep) VALUES (2, 2, 'Rua B', '456', 'Cidade B', 'Estado B', '23456');
INSERT INTO tb_endereco (id_endereco, id_pais, rua, numero, cidade, estado, cep) VALUES (3, 3, 'Rua C', '789', 'Cidade C', 'Estado C', '34567');
INSERT INTO tb_endereco (id_endereco, id_pais, rua, numero, cidade, estado, cep) VALUES (4, 4, 'Rua D', '987', 'Cidade D', 'Estado D', '45678');
INSERT INTO tb_endereco (id_endereco, id_pais, rua, numero, cidade, estado, cep) VALUES (5, 5, 'Rua E', '654', 'Cidade E', 'Estado E', '56789');
INSERT INTO tb_endereco (id_endereco, id_pais, rua, numero, cidade, estado, cep) VALUES (6, 6, 'Rua F', '321', 'Cidade F', 'Estado F', '67890');



INSERT INTO tb_usuario (id_usuario, senha, data, nome, email, status, data_nascimento, data_cadastro, sobrenome, nivel_acesso, id_endereco, data_vencimento)
VALUES
(1, 'senha123', '2023-06-01', 'João', 'joao@example.com', 'ativo', '1990-01-10', '2023-06-01 09:00:00', 'Silva', 'admin', 1, '2023-07-01'),
(2, 'abc123', '2023-06-02', 'Maria', 'maria@example.com', 'ativo', '1985-05-20', '2023-06-02 10:30:00', 'Souza', 'user', 2, '2023-07-02'),
(3, 'qwerty', '2023-06-03', 'Pedro', 'pedro@example.com', 'inativo', '1992-08-15', '2023-06-03 14:45:00', 'Oliveira', 'user', 3, '2023-07-03'),
(4, 'senha456', '2023-06-04', 'Ana', 'ana@example.com', 'ativo', '1988-03-25', '2023-06-04 11:20:00', 'Santos', 'admin', 4, '2023-07-04'),
(5, '123456', '2023-06-05', 'Lucas', 'lucas@example.com', 'bloqueado', '1995-11-07', '2023-06-05 16:55:00', 'Ferreira', 'user', 5, '2023-07-05');




INSERT INTO tb_funcionario (id_funcionario, foto, id_usuario) VALUES (1, 'foto1.jpg', 1);
INSERT INTO tb_funcionario (id_funcionario, foto, id_usuario) VALUES (2, 'foto2.jpg', 2);
INSERT INTO tb_funcionario (id_funcionario, foto, id_usuario) VALUES (3, 'foto3.jpg', 3);
INSERT INTO tb_funcionario (id_funcionario, foto, id_usuario) VALUES (4, 'foto4.jpg', 4);
INSERT INTO tb_funcionario (id_funcionario, foto, id_usuario) VALUES (5, 'foto5.jpg', 5);
INSERT INTO tb_funcionario (id_funcionario, foto, id_usuario) VALUES (6, 'foto6.jpg', 6);

INSERT INTO tb_cartao_credito (id_cartao, numero, data_vencimento, cod_seguranca, titular, id_funcionario)
VALUES (1, '1234567890123456', '12/23', 123, 'Titular 1', 1);

INSERT INTO tb_cartao_credito (id_cartao, numero, data_vencimento, cod_seguranca, titular, id_funcionario)
VALUES (2, '2345678901234567', '01/24', 234, 'Titular 2', 2);

INSERT INTO tb_cartao_credito (id_cartao, numero, data_vencimento, cod_seguranca, titular, id_funcionario)
VALUES (3, '3456789012345678', '06/25', 345, 'Titular 3', 3);

INSERT INTO tb_cartao_credito (id_cartao, numero, data_vencimento, cod_seguranca, titular, id_funcionario)
VALUES (4, '4567890123456789', '03/23', 456, 'Titular 4', 4);

INSERT INTO tb_cartao_credito (id_cartao, numero, data_vencimento, cod_seguranca, titular, id_funcionario)
VALUES (5, '5678901234567890', '09/24', 567, 'Titular 5', 5);

INSERT INTO tb_cartao_credito (id_cartao, numero, data_vencimento, cod_seguranca, titular, id_funcionario)
VALUES (6, '6789012345678901', '04/25', 678, 'Titular 6', 6);






INSERT INTO tb_catalogo (pais_origem, id_catalogo, imagem_capa, titulo, sinopse, ano_lancamento, duracao, avaliacao, numero, id_classificacao, id_idioma)
VALUES (1, 1, 'imagem1.jpg', 'Filme 1', 'Sinopse do Filme 1', 2022, '2h30min', '4.5', '001', 1, 1);

INSERT INTO tb_catalogo (pais_origem, id_catalogo, imagem_capa, titulo, sinopse, ano_lancamento, duracao, avaliacao, numero, id_classificacao, id_idioma)
VALUES (2, 2, 'imagem2.jpg', 'Filme 2', 'Sinopse do Filme 2', 2019, '1h45min', '4.2', '002', 2, 2);

INSERT INTO tb_catalogo (pais_origem, id_catalogo, imagem_capa, titulo, sinopse, ano_lancamento, duracao, avaliacao, numero, id_classificacao, id_idioma)
VALUES (3, 3, 'imagem3.jpg', 'Filme 3', 'Sinopse do Filme 3', 2020, '2h15min', '4.8', '003', 3, 3);

INSERT INTO tb_catalogo (pais_origem, id_catalogo, imagem_capa, titulo, sinopse, ano_lancamento, duracao, avaliacao, numero, id_classificacao, id_idioma)
VALUES (4, 4, 'imagem4.jpg', 'Filme 4', 'Sinopse do Filme 4', 2018, '1h50min', '4.1', '004', 4, 4);

INSERT INTO tb_catalogo (pais_origem, id_catalogo, imagem_capa, titulo, sinopse, ano_lancamento, duracao, avaliacao, numero, id_classificacao, id_idioma)
VALUES (5, 5, 'imagem5.jpg', 'Filme 5', 'Sinopse do Filme 5', 2021, '2h05min', '4.6', '005', 5, 5);

INSERT INTO tb_catalogo (pais_origem, id_catalogo, imagem_capa, titulo, sinopse, ano_lancamento, duracao, avaliacao, numero, id_classificacao, id_idioma)
VALUES (6, 6, 'imagem6.jpg', 'Filme 6', 'Sinopse do Filme 6', 2017, '1h40min', '4.3', '006', 6, 6);



INSERT INTO tb_filme (nome, oscar, id_catalogo) VALUES
('Titanic', 1, 1),
('Jurassic Park', 0, 1),
('Harry Potter and the Philosopher\'s Stone', 0, 1),
('The Lion King', 2, 1),
('Avatar', 3, 2),
('Star Wars: Episode IV - A New Hope', 6, 2);


INSERT INTO tb_cliente (id_usuario, id_cartao_credito, id_plano)
VALUES
  (1, 1, 1),
  (2, 2, 1),
  (3, 3, 2),
  (4, 4, 3),
  (5, 5, 3),
  (6, 6, 4),
  (7, 7, 4),
  (8, 8, 5),
  (9, 9, 5);


















