use db_netflix;


-- vw_catalogo - Esta visualização deve conter todos os dados do catalogo, identificando series e filmes, (não devem estar presente os episodios nesta view),
-- o idioma original e quantos idiomas são possíveis escolher,  classificação indicativa e suas categorias. --


CREATE VIEW view_catalogo AS
SELECT c.id_catalogo, c.imagem_capa, c.titulo, c.sinopse, c.ano_lancamento, c.duracao, c.avaliacao,
       c.numero, cl.descricao AS classificacao, COUNT(DISTINCT ic.id_idioma) AS qtd_idiomas, 
       GROUP_CONCAT(DISTINCT cat.nome SEPARATOR ', ') AS categorias
FROM tb_catalogo c
INNER JOIN tb_classificacao cl ON c.id_classificacao = cl.id_classificacao
LEFT JOIN tb_idioma_disponivel ic ON c.id_catalogo = ic.id_catalogo
LEFT JOIN tb_categoria_catalogo cc ON c.id_catalogo = cc.id_catalogo
LEFT JOIN tb_categoria cat ON cc.id_categoria = cat.id_categoria
LEFT JOIN tb_filme f ON c.id_catalogo = f.id_catalogo
LEFT JOIN tb_serie s ON c.id_catalogo = s.id_catalogo
WHERE f.id_filme IS NOT NULL OR (s.id_serie IS NOT NULL AND s.qtd_episodio = 0)
GROUP BY c.id_catalogo;

SELECT * FROM view_catalogo;




-- vw_usuario - Esta visualização deve conter os todos os dados de todos os usuários, deseja-se também saber quais são funcionários e quais são clientes, 
-- o endereço de cada um e seu pais de origem,  quantos perfis cada um tem e qual é o seu plano. --

CREATE VIEW vw_usuario AS
SELECT
    u.id_usuario,
    u.nome,
    u.sobrenome,
    u.email,
    u.data_nascimento,
    u.data_cadastro,
    u.data_vencimento,
    u.nivel_acesso,
    u.status,
    e.rua,
    e.numero,
    e.cidade,
    e.estado,
    p.nome AS pais,
    (SELECT COUNT(*) FROM tb_perfil WHERE id_cliente = c.id_cliente) AS qtd_perfis,
    pl.nome AS plano,
    CASE
        WHEN f.id_funcionario IS NOT NULL THEN 'Funcionário'
        WHEN c.id_cliente IS NOT NULL THEN 'Cliente'
        ELSE 'N/A'
    END AS tipo_usuario
FROM
    tb_usuario u
    LEFT JOIN tb_funcionario f ON f.id_usuario = u.id_usuario
    LEFT JOIN tb_cliente c ON c.id_usuario = u.id_usuario
    LEFT JOIN tb_endereco e ON e.id_endereco = u.id_endereco
    LEFT JOIN tb_pais p ON p.id_pais = e.id_pais
    LEFT JOIN tb_plano pl ON pl.id_plano = c.id_plano;

SELECT * FROM vw_usuario;


-- vw_episodio - Esta visualização deve conter todos os dados dos episódios, qual sua serie, e de qual temporada ele é. --


CREATE VIEW vw_episodio AS
SELECT e.*, s.titulo AS serie, t.titulo AS temporada
FROM tb_episodio e
INNER JOIN tb_serie s ON e.id_serie = s.id_serie
INNER JOIN tb_temporada t ON e.id_temporada = t.id_temporada;

SELECT *
FROM vw_episodio;

CREATE VIEW vw_temporada AS
SELECT t.*, s.titulo AS serie, COUNT(e.id_episodio) AS quantidade_episodios
FROM tb_temporada t
INNER JOIN tb_serie s ON t.id_serie = s.id_serie
LEFT JOIN tb_episodio e ON t.id_temporada = e.id_temporada
GROUP BY t.id_temporada;

CREATE VIEW vw_ator AS
SELECT
    a.*,
    COUNT(DISTINCT f.id_filme) AS quantidade_filmes,
    COUNT(DISTINCT s.id_serie) AS quantidade_series
FROM
    tb_ator a
LEFT JOIN
    tb_elenco e ON a.id_ator = e.id_ator
LEFT JOIN
    tb_catalogo c ON e.id_catalogo = c.id_catalogo
LEFT JOIN
    tb_filme f ON c.id_catalogo = f.id_catalogo
LEFT JOIN
    tb_serie s ON c.id_catalogo = s.id_catalogo
GROUP BY
    a.id_ator;

SELECT *
FROM vw_ator;



CREATE VIEW vw_perfil AS
SELECT p.id_perfil, p.foto, p.nome, p.tipo, c.id_cliente, c.id_usuario, c.id_cartao_credito, c.id_plano
FROM tb_perfil p
JOIN tb_cliente c ON p.id_cliente = c.id_cliente;


SELECT * FROM vw_perfil;


select * from tb_pais;








