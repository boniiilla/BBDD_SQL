DROP PROCEDURE IF EXISTS MostrarColumnes;
DELIMITER //
CREATE PROCEDURE IF NOT EXISTS MostrarColumnes(
    IN nomdb VARCHAR(48),
    IN nomtaula VARCHAR(36)
)
BEGIN
    DECLARE col_nom VARCHAR(64);
    DECLARE col_tipus VARCHAR(64);

    DECLARE fi_cursor BOOLEAN DEFAULT FALSE;

    DECLARE columnes_cursor CURSOR FOR
    SELECT COLUMN_NAME, DATA_TYPE
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = nomdb AND TABLE_NAME = nomtaula;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET fi_cursor = TRUE;

    OPEN columnes_cursor;

    llegir_columnes: LOOP
        FETCH columnes_cursor INTO col_nom, col_tipus;

        IF fi_cursor THEN
            LEAVE llegir_columnes;
        END IF;

        SELECT CONCAT('Nom columna: ', col_nom, ', Tipus de dada: ', col_tipus) AS Informació;
    END LOOP;

    CLOSE columnes_cursor;
END; // 
DELIMITER ;
