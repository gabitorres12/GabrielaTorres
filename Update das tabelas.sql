use db_netflix;

DELIMITER //

CREATE PROCEDURE sp_updatePais(IN id INT, IN nome_pais VARCHAR(45), IN codigo_pais CHAR(3))
BEGIN
    UPDATE tb_pais
    SET nome = nome_pais, codigo = codigo_pais
    WHERE id_pais = id;
END //

DELIMITER ;

CALL sp_updatePais(1, 'ANGOLA', 'NOV');


DELIMITER //

CREATE PROCEDURE sp_updateTipoPagamento(IN id INT, IN nome_tipo_pagamento VARCHAR(45))
BEGIN
    UPDATE tipo_pagamento
    SET nome = nome_tipo_pagamento
    WHERE id_tipo_pagamento = id;
END //

DELIMITER ;
CALL sp_updateTipoPagamento(1, 'Vale transporte');


DELIMITER //

CREATE PROCEDURE sp_update_Pagamento(
    IN p_id_pagamento INT,
    IN p_valor FLOAT(4,2),
    IN p_data_pagamento VARCHAR(45),
    IN p_id_tipo_pagamento INT
)
BEGIN
    UPDATE tb_Pagamento
    SET valor = p_valor,
        data_pagamento = p_data_pagamento,
        id_tipo_pagamento = p_id_tipo_pagamento
    WHERE id_pagamento = p_id_pagamento;
END //

DELIMITER ;

CALL sp_update_Pagamento(1, 10.50, '2023-06-15', 1);

select * from tb_pagamento;

DELIMITER //

CREATE PROCEDURE sp_update_endereco(
    IN p_id_endereco INT,
    IN p_id_pais INT,
    IN p_rua VARCHAR(100),
    IN p_numero VARCHAR(10),
    IN p_cidade VARCHAR(100),
    IN p_estado VARCHAR(100),
    IN p_cep VARCHAR(10)
)
BEGIN
    UPDATE tb_endereco
    SET id_pais = p_id_pais,
        rua = p_rua,
        numero = p_numero,
        cidade = p_cidade,
        estado = p_estado,
        cep = p_cep
    WHERE id_endereco = p_id_endereco;
END //

DELIMITER ;
CALL sp_update_endereco(1, 1, 'Rua A', '123', 'Cidade A', 'Estado A', '12345-678');
select * from tb_endereco;


DELIMITER //

CREATE PROCEDURE sp_update_usuario(
    IN p_id_usuario INT,
    IN p_senha VARCHAR(30),
    IN p_data DATE,
    IN p_nome VARCHAR(45),
    IN p_email VARCHAR(45),
    IN p_status ENUM('ativo', 'inativo', 'bloqueado'),
    IN p_data_nascimento DATE,
    IN p_data_cadastro DATETIME,
    IN p_sobrenome VARCHAR(45),
    IN p_nivel_acesso VARCHAR(45),
    IN p_id_endereco INT,
    IN p_data_vencimento DATE
)
BEGIN
    UPDATE tb_usuario
    SET senha = p_senha,
        data = p_data,
        nome = p_nome,
        email = p_email,
        status = p_status,
        data_nascimento = p_data_nascimento,
        data_cadastro = p_data_cadastro,
        sobrenome = p_sobrenome,
        nivel_acesso = p_nivel_acesso,
        id_endereco = p_id_endereco,
        data_vencimento = p_data_vencimento
    WHERE id_usuario = p_id_usuario;
END //

DELIMITER ;
CALL sp_update_usuario(
    6,
    'senha 6678',
    '2023-06-15',
    'Gabrilea',
    'gabi@example.com',
    'inativo',
    '1990-01-01',
    NOW(),
    'Novo Sobrenome',
    'admin',
    2,
    '2023-12-31'
);
select * from tb_usuario;

DELIMITER //

CREATE PROCEDURE sp_update_funcionario(
    IN p_id_funcionario INT,
    IN p_foto VARCHAR(45),
    IN p_id_usuario INT
)
BEGIN
    UPDATE tb_funcionario
    SET foto = p_foto,
        id_usuario = p_id_usuario
    WHERE id_funcionario = p_id_funcionario;
END //

DELIMITER ;

CALL sp_update_funcionario(
    8,
    'nova_foto.34jpg',
    8
);

select * from tb_funcionario;


DELIMITER //

CREATE PROCEDURE sp_update_cartao_credito(
    IN p_id_cartao INT,
    IN p_numero CHAR(19),
    IN p_data_vencimento CHAR(5),
    IN p_cod_seguranca INT,
    IN p_titular VARCHAR(45),
    IN p_id_funcionario INT
)
BEGIN
    UPDATE tb_cartao_credito
    SET numero = p_numero,
        data_vencimento = p_data_vencimento,
        cod_seguranca = p_cod_seguranca,
        titular = p_titular,
        id_funcionario = p_id_funcionario
    WHERE id_cartao = p_id_cartao;
END //

DELIMITER ;

CALL sp_update_cartao_credito(
    1,
    '1234567890123456789',
    '06/25',
    456,
    'Titular 1',
    11
);
select * from tb_cartao_credito;


DELIMITER //

CREATE PROCEDURE sp_update_ator(
    IN p_id_ator INT,
    IN p_foto VARCHAR(45),
    IN p_data_nascimento DATE,
    IN p_sobrenome VARCHAR(45),
    IN p_nome VARCHAR(45)
)
BEGIN
    UPDATE tb_ator
    SET foto = p_foto,
        data_nascimento = p_data_nascimento,
        sobrenome = p_sobrenome,
        nome = p_nome
    WHERE id_ator = p_id_ator;
END //

DELIMITER ;

CALL sp_update_ator(
    1,
    'foto.jpg34',
    '1990-01-01',
    'Silva',
    'João'
);

select * from tb_ator;


DELIMITER //

CREATE PROCEDURE sp_update_classificacao(
    IN p_id_classificacao INT,
    IN p_idade TINYINT,
    IN p_descricao VARCHAR(45)
)
BEGIN
    UPDATE tb_classificacao
    SET idade = p_idade,
        descricao = p_descricao
    WHERE id_classificacao = p_id_classificacao;
END //

DELIMITER ;
CALL sp_update_classificacao(
    1,
    18,
    'Classificação para maiores de 18 anos'
);


select * from tb_classificacao;

DELIMITER //

CREATE PROCEDURE sp_update_idioma(
    IN p_id_idioma INT,
    IN p_nome VARCHAR(45)
)
BEGIN
    UPDATE tb_idioma
    SET nome = p_nome
    WHERE id_idioma = p_id_idioma;
END //

DELIMITER ;

CALL sp_update_idioma(
    1,
    'Inglês'
);


DELIMITER //

CREATE PROCEDURE sp_update_catalogo(
    IN p_id_catalogo INT,
    IN p_pais_origem INT,
    IN p_imagem_capa VARCHAR(45),
    IN p_titulo VARCHAR(45),
    IN p_sinopse VARCHAR(45),
    IN p_ano_lancamento YEAR,
    IN p_duracao VARCHAR(45),
    IN p_avaliacao VARCHAR(45),
    IN p_numero VARCHAR(45),
    IN p_id_classificacao INT,
    IN p_id_idioma INT
)
BEGIN
    UPDATE tb_catalogo
    SET pais_origem = p_pais_origem,
        imagem_capa = p_imagem_capa,
        titulo = p_titulo,
        sinopse = p_sinopse,
        ano_lancamento = p_ano_lancamento,
        duracao = p_duracao,
        avaliacao = p_avaliacao,
        numero = p_numero,
        id_classificacao = p_id_classificacao,
        id_idioma = p_id_idioma
    WHERE id_catalogo = p_id_catalogo;
END //

DELIMITER ;

CALL sp_update_catalogo(
    1,
    1,
    'imagem.jpg',
    'A cabana',
    'Um homem vive atormentado após perder a sua filha mais nova, cujo corpo nunca foi encontrado, mas sinais de que ela teria sido violentada e assassinada são encontrados em uma cabana nas montanhas. Anos depois da tragédia, ele recebe um chamado misterioso para retornar a esse local, onde ele vai receber uma lição de vida.Sinopse do Filme',
    2019,
    '2h 30min',
    'Avaliação do Filme',
    '12345',
    1,
    1
);

select * from tb_catalogo;

DELIMITER //

CREATE PROCEDURE sp_update_temporada(
    IN p_id_temporada INT,
    IN p_titulo VARCHAR(45),
    IN p_descricao VARCHAR(45),
    IN p_id_serie INT
)
BEGIN
    UPDATE tb_temporada
    SET titulo = p_titulo,
        descricao = p_descricao,
        id_serie = p_id_serie
    WHERE id_temporada = p_id_temporada;
END //

DELIMITER ;


CALL sp_update_temporada(
    1,
    'viver',
    'Descrição da Temporada',
    1
);

select * from tb_temporada;


DELIMITER //

CREATE PROCEDURE sp_update_categoria(
    IN p_nome_categoria VARCHAR(45),
    IN p_id_categoria INT
)
BEGIN
    UPDATE tb_categoria
    SET nome = p_nome_categoria
    WHERE id_categoria = p_id_categoria;
END //

DELIMITER ;

CALL sp_update_categoria('DOCUMENTÁRIO', 1);

DELIMITER //

CREATE PROCEDURE sp_update_plano(
    IN p_valor FLOAT(4,2),
    IN p_descricao VARCHAR(45),
    IN p_duracao VARCHAR(45),
    IN p_nome VARCHAR(45),
    IN p_id_plano INT
)
BEGIN
    UPDATE tb_plano
    SET valor = p_valor,
        descricao = p_descricao,
        duracao = p_duracao,
        nome = p_nome
    WHERE id_plano = p_id_plano;
END //

DELIMITER ;

CALL sp_update_plano(9.99, 'sem comercial', '30 dias', 'unico', 1);

SELECT * FROM tb_plano;

DELIMITER //

CREATE PROCEDURE sp_update_cliente(
    IN p_id_usuario INT,
    IN p_id_cartao_credito INT,
    IN p_id_plano INT,
    IN p_id_cliente INT
)
BEGIN
    UPDATE tb_cliente
    SET id_usuario = p_id_usuario,
        id_cartao_credito = p_id_cartao_credito,
        id_plano = p_id_plano
    WHERE id_cliente = p_id_cliente;
END //

DELIMITER ;

CALL sp_update_cliente(1, 1, 1, 1);

