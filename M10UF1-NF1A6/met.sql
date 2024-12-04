DROP PROCEDURE IF EXISTS met;
DELIMITER //
CREATE PROCEDURE IF NOT EXISTS met(IN adn_id INT)
BEGIN
    DECLARE seq TEXT;
    DECLARE seq_len INT;
    DECLARE indx INT DEFAULT 1;
    DECLARE inici INT;
    DECLARE final INT;
    DECLARE triplete VARCHAR(3);
    DECLARE start_pos INT;
    DECLARE stop_pos INT;
    DECLARE cadena_amino TEXT DEFAULT "";
    DECLARE amino VARCHAR(1);


    SELECT arn, LENGTH(arn) FROM adn WHERE idgen=adn_id;
    SELECT arn, LENGTH(arn) FROM adn WHERE idgen=adn_id INTO seq, seq_len;

    SET start_pos = 1;

    bucle1: WHILE indx < seq_len DO
        SET triplete = SUBSTRING(seq, indx, 3);
        SET start_pos = LOCATE('AUG', seq, start_pos);

        IF start_pos = 0 THEN
            SELECT CONCAT('La cadena no conté Metionina (AUG)') AS missatge;
        END IF;
        
        IF LENGTH(triplete) = 3 THEN
            SELECT idaminoacid FROM codi_genetic WHERE idtrip=triplete INTO amino;
            IF amino IS NOT NULL THEN
                SET cadena_amino = CONCAT(cadena_amino, amino);
            END IF;
        END IF;
        
        SET indx = indx + 3;
   END WHILE;

   SELECT cadena_amino AS Cadena_Aminoacids;
END //
DELIMITER ; 