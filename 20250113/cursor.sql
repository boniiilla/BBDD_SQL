DROP PROCEDURE IF EXISTS mostrar_selects_adn;
DELIMITER //
CREATE PROCEDURE IF NOT EXISTS mostrar_selects_adn(
    IN nomdb VARCHAR(48)
)
BEGIN
    DECLARE nomtaula VARCHAR(64);
    DECLARE query TEXT;
    DECLARE fi_cursor BOOLEAN DEFAULT FALSE;

    DECLARE selects CURSOR FOR
    SELECT TABLE_NAME FROM INFORMATION_SCHEMA.COLUMNS 
    WHERE TABLE_SCHEMA=nomdb GROUP BY TABLE_NAME;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET fi_cursor = TRUE;

    OPEN selects;

    hacer_selects: LOOP
        FETCH selects INTO nomtaula;

        IF fi_cursor THEN
            LEAVE hacer_selects;
        END IF;

        SET @query = CONCAT('SELECT * FROM ', nomtaula, ' LIMIT 1');
        PREPARE stmt FROM @query;
        EXECUTE stmt;
        DEALLOCATE PREPARE stmt;
    END LOOP;

    CLOSE selects;
END; // 
DELIMITER ;