CREATE DATABASE db_netflix;
COLLATE utf8mb4_general_ci
charset utf8mb4;

USE db_netflix;
CREATE TABLE IF NOT EXISTS tb_pais (
id_pais INT  AUTO_INCREMENT,
nome VARCHAR(45) NOT NULL,
codigo CHAR(3) NOT NULL,
PRIMARY KEY (id_pais))
AUTO_INCREMENT =1;


CREATE TABLE IF NOT EXISTS tipo_pagamento (
  id_tipo_pagamento INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(45) NOT NULL,
  PRIMARY KEY (id_tipo_pagamento)
);


CREATE TABLE IF NOT EXISTS tb_Pagamento (
  id_pagamento INT NOT NULL AUTO_INCREMENT,
  valor FLOAT(4,2) NULL,
  data_pagamento VARCHAR(45) NULL,
  id_tipo_pagamento INT NOT NULL,
  PRIMARY KEY (id_pagamento),
  CONSTRAINT fk_Pagamento_tipo_pagamento1 FOREIGN KEY (id_tipo_pagamento) REFERENCES tipo_pagamento (id_tipo_pagamento)
) AUTO_INCREMENT = 1;


CREATE TABLE IF NOT EXISTS tb_endereco (
  id_endereco INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  id_pais INT NOT NULL,
  rua VARCHAR(100) NOT NULL,
  numero VARCHAR(10) NOT NULL,
  cidade VARCHAR(100) NOT NULL,
  estado VARCHAR(100) NOT NULL,
  cep VARCHAR(10) NOT NULL,
  CONSTRAINT fk_endereco_Pais1 FOREIGN KEY (id_pais) REFERENCES tb_pais (id_pais)
) AUTO_INCREMENT = 1;


CREATE TABLE IF NOT EXISTS tb_usuario (
  id_usuario INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  senha VARCHAR(30) NOT NULL,
  data DATE NOT NULL,
  nome VARCHAR(45) NOT NULL,
  email VARCHAR(45) NOT NULL UNIQUE,
  status ENUM('ativo', 'inativo', 'bloqueado') NOT NULL,
  data_nascimento DATE NOT NULL,
  data_cadastro DATETIME NOT NULL,
  sobrenome VARCHAR(45) NOT NULL,
  nivel_acesso VARCHAR(45) NULL,
  id_endereco INT NOT NULL,
  data_vencimento DATE NOT NULL,
  CONSTRAINT uq_email UNIQUE (email),
  CONSTRAINT fk_usuario_endereco FOREIGN KEY (id_endereco) REFERENCES tb_endereco (id_endereco)
) AUTO_INCREMENT = 1;


CREATE TABLE IF NOT EXISTS tb_funcionario (
  id_funcionario INT NOT NULL AUTO_INCREMENT,
  foto VARCHAR(45) NOT NULL,
  id_usuario INT NOT NULL,
  PRIMARY KEY (id_funcionario),
  CONSTRAINT fk_funcionario_usuario FOREIGN KEY (id_usuario) REFERENCES tb_usuario (id_usuario)
) AUTO_INCREMENT = 1;
  

CREATE TABLE IF NOT EXISTS tb_cartao_credito (
  id_cartao INT NOT NULL AUTO_INCREMENT,
  numero CHAR(19) NOT NULL,
  data_vencimento CHAR(5) NOT NULL,
  cod_seguranca INT NOT NULL,
  titular VARCHAR(45) NOT NULL,
  id_funcionario INT NOT NULL,
  PRIMARY KEY (id_cartao),
  CONSTRAINT fk_cartao_credito_funcionario1 FOREIGN KEY (id_funcionario)
    REFERENCES tb_funcionario (id_funcionario)
) AUTO_INCREMENT = 1;


CREATE TABLE IF NOT EXISTS tb_ator (
  foto  VARCHAR(45) NOT NULL,
  data_nascimento DATE NULL,
  sobrenome VARCHAR(45) NULL,
  nome VARCHAR(45) NULL,
  id_ator INT NOT NULL  AUTO_INCREMENT,
  PRIMARY KEY (id_ator));


CREATE TABLE IF NOT EXISTS tb_classificacao (
  id_classificacao INT NOT NULL  AUTO_INCREMENT,
  idade TINYINT NOT NULL,
  descricao VARCHAR(45) NOT NULL,
  PRIMARY KEY (id_classificacao))
;
CREATE TABLE IF NOT EXISTS tb_idioma (
  nome VARCHAR(45) NOT NULL ,
  id_idioma INT NOT NULL  AUTO_INCREMENT,
  PRIMARY KEY (id_idioma))
;

CREATE TABLE IF NOT EXISTS tb_catalogo (
  pais_origem INT NULL,
  id_catalogo INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  imagem_capa VARCHAR(45) NULL,
  titulo VARCHAR(45) NOT NULL,
  sinopse VARCHAR(45) NULL,
  ano_lancamento YEAR NULL,
  duracao VARCHAR(45) NULL,
  avaliacao VARCHAR(45) NULL,
  numero VARCHAR(45) NULL,
  id_classificacao INT NOT NULL,
  id_idioma INT NOT NULL,
  CONSTRAINT fk_catalogo_classificacao1 FOREIGN KEY (id_classificacao) REFERENCES tb_classificacao (id_classificacao),
  CONSTRAINT fk_catalogo_idioma1 FOREIGN KEY (id_idioma) REFERENCES tb_idioma (id_idioma)
) AUTO_INCREMENT = 1;
  
  CREATE TABLE IF NOT EXISTS tb_serie (
  id_serie INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  titulo VARCHAR(45) NOT NULL,
  qtd_temporada TINYINT NOT NULL,
  qtd_episodio TINYINT NOT NULL,
  id_catalogo INT NOT NULL,
  CONSTRAINT fk_Serie_catalogo1 FOREIGN KEY (id_catalogo)
    REFERENCES tb_catalogo (id_catalogo)
) AUTO_INCREMENT = 1;

CREATE TABLE IF NOT EXISTS tb_temporada (
  id_temporada INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  titulo VARCHAR(45) NULL,
  descricao VARCHAR(45) NULL,
  id_serie INT NOT NULL,
  CONSTRAINT fk_temporada_serie1 FOREIGN KEY (id_serie)
    REFERENCES tb_serie (id_serie)
) AUTO_INCREMENT = 1;


CREATE TABLE IF NOT EXISTS tb_categoria (
  nome VARCHAR(45) NOT NULL,
  id_categoria INT NULL PRIMARY KEY AUTO_INCREMENT
 );

CREATE TABLE IF NOT EXISTS tb_plano (
  id_plano INT NOT NULL AUTO_INCREMENT,
  valor FLOAT(4,2) NOT NULL,
  descricao VARCHAR(45) NOT NULL,
  duracao VARCHAR(45) NOT NULL,
  nome VARCHAR(45) NOT NULL,
  PRIMARY KEY (id_plano)
);



CREATE TABLE IF NOT EXISTS tb_cliente (
  id_cliente INT NOT NULL AUTO_INCREMENT,
  id_usuario INT NOT NULL,
  id_cartao_credito INT NOT NULL,
  id_plano INT NOT NULL,
  PRIMARY KEY (id_cliente),
  CONSTRAINT fk_cliente_usuario1 FOREIGN KEY (id_usuario) REFERENCES tb_usuario (id_usuario),
  CONSTRAINT fk_cliente_cartao_credito1 FOREIGN KEY (id_cartao_credito) REFERENCES tb_cartao_credito (id_cartao),
  CONSTRAINT fk_cliente_plano1 FOREIGN KEY (id_plano) REFERENCES tb_plano (id_plano)
) AUTO_INCREMENT = 1;

CREATE TABLE IF NOT EXISTS tb_perfil (
  id_perfil INT NOT NULL AUTO_INCREMENT,
  foto VARCHAR(100) NOT NULL,
  nome VARCHAR(45) NOT NULL,
  tipo ENUM('A', 'C') NOT NULL,
  id_cliente INT NOT NULL,
  data_atualizacao DATE NOT NULL,
  PRIMARY KEY (id_perfil),
  CONSTRAINT fk_perfil_cliente1 FOREIGN KEY (id_cliente) REFERENCES tb_cliente (id_cliente)
) AUTO_INCREMENT = 1;

CREATE TABLE IF NOT EXISTS tb_catalogo_pais (
  id_catalogo INT NOT NULL,
  id_pais INT NOT NULL,
  id_catalogo_pais INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (id_catalogo_pais),
  CONSTRAINT fk_catalogo_pais_catalogo1 FOREIGN KEY (id_catalogo) REFERENCES tb_catalogo (id_catalogo),
  CONSTRAINT fk_catalogo_pais_pais1 FOREIGN KEY (id_pais) REFERENCES tb_pais (id_pais)
) AUTO_INCREMENT = 1;

CREATE TABLE IF NOT EXISTS tb_idioma_disponivel (
  id_idioma INT NOT NULL,
  id_catalogo INT NOT NULL,
  id_idioma_disponivel INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (id_idioma_disponivel),
  CONSTRAINT fk_idioma_disponivel_idioma1 FOREIGN KEY (id_idioma) REFERENCES tb_idioma (id_idioma),
  CONSTRAINT fk_idioma_disponivel_catalogo1 FOREIGN KEY (id_catalogo) REFERENCES tb_catalogo (id_catalogo)
) AUTO_INCREMENT = 1;

CREATE TABLE IF NOT EXISTS tb_elenco (
  id_ator INT NOT NULL,
  id_catalogo INT NOT NULL,
  id_elenco INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (id_elenco),
  CONSTRAINT fk_elenco_ator1 FOREIGN KEY (id_ator) REFERENCES tb_ator (id_ator),
  CONSTRAINT fk_elenco_catalogo1 FOREIGN KEY (id_catalogo) REFERENCES tb_catalogo (id_catalogo)
) AUTO_INCREMENT = 1;

CREATE TABLE IF NOT EXISTS tb_categoria_catalogo (
  id_categoria INT NOT NULL,
  id_catalogo INT NOT NULL,
  id_categoria_catalogo INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (id_categoria_catalogo),
  CONSTRAINT fk_categoria_catalogo_categoria1 FOREIGN KEY (id_categoria) REFERENCES tb_categoria (id_categoria),
  CONSTRAINT fk_categoria_catalogo_catalogo1 FOREIGN KEY (id_catalogo) REFERENCES tb_catalogo (id_catalogo)
) AUTO_INCREMENT = 1;

CREATE TABLE IF NOT EXISTS tb_filme (
  id_filme INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(45) NOT NULL,
  oscar TINYINT NOT NULL,
  id_catalogo INT NOT NULL,
  PRIMARY KEY (id_filme),
  CONSTRAINT fk_filme_catalogo1 FOREIGN KEY (id_catalogo) REFERENCES tb_catalogo (id_catalogo)
) AUTO_INCREMENT = 1;

CREATE TABLE IF NOT EXISTS tb_episodio (
  id_episodio INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(45) NOT NULL,
  numero TINYINT NOT NULL,
  id_serie INT NOT NULL,
  id_temporada INT NOT NULL,
  PRIMARY KEY (id_episodio),
  CONSTRAINT fk_episodio_serie1 FOREIGN KEY (id_serie) REFERENCES tb_serie (id_serie),
  CONSTRAINT fk_episodio_temporada1 FOREIGN KEY (id_temporada) REFERENCES tb_temporada (id_temporada)
) AUTO_INCREMENT = 1;
















  

   













