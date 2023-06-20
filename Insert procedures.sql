use db_netflix;
DELIMITER //

CREATE PROCEDURE sp_insert_perfil(
    IN p_foto VARCHAR(100),
    IN p_nome VARCHAR(45),
    IN p_tipo ENUM('A', 'C'),
    IN p_id_cliente INT,
    IN p_data_atualizacao DATE
)
BEGIN
    INSERT INTO tb_perfil (foto, nome, tipo, id_cliente, data_atualizacao)
    VALUES (p_foto, p_nome, p_tipo, p_id_cliente, p_data_atualizacao);
END //

DELIMITER ;



CALL sp_insert_perfil('foto.png', 'M', 'A', 3, '2023-06-15');
select * from tb_perfil;


DELIMITER //

CREATE PROCEDURE sp_insert_catalogo_pais(
    IN p_id_catalogo INT,
    IN p_id_pais INT
)
BEGIN
    INSERT INTO tb_catalogo_pais (id_catalogo, id_pais)
    VALUES (p_id_catalogo, p_id_pais);
END //

DELIMITER ;


CALL sp_insert_catalogo_pais(1, 1);



DELIMITER //

CREATE PROCEDURE sp_insert_idioma_disponivel(
    IN p_id_idioma INT,
    IN p_id_catalogo INT
)
BEGIN
    INSERT INTO tb_idioma_disponivel (id_idioma, id_catalogo)
    VALUES (p_id_idioma, p_id_catalogo);
END //

DELIMITER ;


CALL sp_insert_idioma_disponivel(1, 1);



DELIMITER //

CREATE PROCEDURE sp_insert_elenco(
    IN p_id_ator INT,
    IN p_id_catalogo INT
)
BEGIN
    INSERT INTO tb_elenco (id_ator, id_catalogo)
    VALUES (p_id_ator, p_id_catalogo);
END //

DELIMITER ;

CALL sp_insert_elenco(1, 1);




DELIMITER //

CREATE PROCEDURE sp_insert_categoria_catalogo(
    IN p_id_categoria INT,
    IN p_id_catalogo INT
)
BEGIN
    INSERT INTO tb_categoria_catalogo (id_categoria, id_catalogo)
    VALUES (p_id_categoria, p_id_catalogo);
END //

DELIMITER ;

CALL sp_insert_categoria_catalogo(1, 1);

SELECT * FROM tb_catalogo;



DELIMITER //

CREATE PROCEDURE sp_insert_filme(
    IN p_nome VARCHAR(45),
    IN p_oscar TINYINT,
    IN p_id_catalogo INT
)
BEGIN
    INSERT INTO tb_filme (nome, oscar, id_catalogo)
    VALUES (p_nome, p_oscar, p_id_catalogo);
END //

DELIMITER ;
select * from tb_filme;

CALL sp_insert_filme('Panda', 0, 1);




DELIMITER //

CREATE PROCEDURE sp_insert_episodio(
    IN p_nome VARCHAR(45),
    IN p_numero TINYINT,
    IN p_id_serie INT,
    IN p_id_temporada INT
)
BEGIN
    INSERT INTO tb_episodio (nome, numero, id_serie, id_temporada)
    VALUES (p_nome, p_numero, p_id_serie, p_id_temporada);
END //

DELIMITER ;

CALL sp_insert_episodio('congratuluts', 1, 1, 1);

select * from tb_episodio; 





