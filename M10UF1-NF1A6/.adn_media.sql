DELIMITER //

CREATE PROCEDURE met(IN seq_id INT)
BEGIN
    DECLARE seq TEXT;
    DECLARE seq_len INT;
    DECLARE start_pos INT;
    DECLARE stop_pos INT;
    DECLARE found_stop BOOLEAN;
    DECLARE triplet TEXT;
    DECLARE amino_acids TEXT;
    DECLARE done INT DEFAULT 0;
    
    -- Processar la seqüència
    SET seq_len = CHAR_LENGTH(seq);
    SET start_pos = 1;
    SET amino_acids = '';

    WHILE start_pos <= seq_len DO
        -- Cercar el primer AUG
        SET start_pos = LOCATE('AUG', seq, start_pos);
        IF start_pos = 0 THEN
            SELECT CONCAT('La cadena no conté Metionina (AUG)') AS missatge;
            LEAVE PROCEDURE;
        END IF;

        -- Cercar STOP després d'AUG
        SET found_stop = FALSE;
        SET stop_pos = start_pos + 3;

        WHILE stop_pos + 2 <= seq_len DO
            SET triplet = SUBSTRING(seq, stop_pos, 3);
            IF triplet IN ('UAA', 'UAG', 'UGA') THEN
                SET found_stop = TRUE;
                LEAVE WHILE;
            END IF;
            SET stop_pos = stop_pos + 3;
        END WHILE;

        -- Obtenir la subseqüència
        IF found_stop THEN
            SET stop_pos = stop_pos + 2; -- Incloure el STOP
        ELSE
            SET stop_pos = seq_len; -- Fins al final si no hi ha STOP
        END IF;

        -- Mostrar la informació
        SELECT seq AS cadena,
               CHAR_LENGTH(SUBSTRING(seq, start_pos, stop_pos - start_pos + 1)) AS longitud,
               start_pos AS inici,
               SUBSTRING(seq, start_pos, stop_pos - start_pos + 1) AS subsequencia;

        -- Avançar per buscar més seqüències
        SET start_pos = stop_pos + 1;
    END WHILE;
END //

DELIMITER ;

