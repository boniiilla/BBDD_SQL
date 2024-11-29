DROP PROCEDURE IF EXISTS MostrarColumnes;
DELIMITER //
CREATE PROCEDURE IF NOT EXISTS MostrarColumnes(
    IN nomdb VARCHAR(48),
    IN nomtaula VARCHAR(36)
)
BEGIN
    -- Variables per emmagatzemar els resultats del cursor
    DECLARE col_nom VARCHAR(64);
    DECLARE col_tipus VARCHAR(64);

    -- Variable per gestionar el final del cursor
    DECLARE fi_cursor BOOLEAN DEFAULT FALSE;

    -- Definir un cursor per obtenir la informació de les columnes
    DECLARE columnes_cursor CURSOR FOR
    SELECT COLUMN_NAME, DATA_TYPE
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = nomdb AND TABLE_NAME = nomtaula;

    -- Handler per capturar quan el cursor arriba al final
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET fi_cursor = TRUE;

    -- Obrir el cursor
    OPEN columnes_cursor;

    -- Bucle per recórrer els resultats del cursor
    llegir_columnes: LOOP
        FETCH columnes_cursor INTO col_nom, col_tipus;

        -- Verificar si hem arribat al final
        IF fi_cursor THEN
            LEAVE llegir_columnes;
        END IF;

        -- Mostrar els resultats
        SELECT CONCAT('Nom columna: ', col_nom, ', Tipus de dada: ', col_tipus) AS Informació;
    END LOOP;

    -- Tancar el cursor
    CLOSE columnes_cursor;
END;
//

DELIMITER ;
