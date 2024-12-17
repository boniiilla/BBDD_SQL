DELIMITER //
DROP FUNCTION IF EXISTS arntoadn; -- arn to adn codificant
CREATE FUNCTION arntoadn(arn TEXT) RETURNS TEXT DETERMINISTIC
BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE arn_char CHAR(1);
    DECLARE adn_seq TEXT DEFAULT '';
    WHILE i <= CHAR_LENGTH(arn) DO
        SET arn_char = SUBSTRING(arn, i, 1);
        SET adn_seq = CONCAT(adn_seq,
            CASE arn_char
                WHEN 'U' THEN 'A'
                WHEN 'A' THEN 'T'
                WHEN 'C' THEN 'G'
                WHEN 'G' THEN 'C'
                ELSE ''
            END
        );
        SET i = i + 1;
    END WHILE;
    -- Retorna la seqüència ADN complementaria
    RETURN adn_seq;
END//
DELIMITER ;

DELIMITER //
DROP FUNCTION IF EXISTS adntoarn; -- arn to adn codificant
CREATE FUNCTION adntoarn(id_gen INT) RETURNS TEXT DETERMINISTIC
BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE adn_text TEXT;
    DECLARE adn_char CHAR(1);
    DECLARE arn_seq TEXT DEFAULT '';
    DECLARE arn_char CHAR(1);

    SELECT adn FROM adn WHERE idgen = id_gen INTO adn_text;

    IF adn_text IS NULL THEN
        RETURN 'Error: No existeix aquest gen';
    END IF;  
    
    WHILE i <= CHAR_LENGTH(adn_text) DO
        SET adn_char = SUBSTRING(adn_text, i, 1);
        SELECT idarn INTO arn_char FROM transcrip WHERE idadn = adn_char;
        SET arn_seq = CONCAT(arn_seq, arn_char);
        SET i = i + 1;
    END WHILE;
    -- Retorna la seqüència ADN complementaria
    RETURN arn_seq;
END//
DELIMITER ;