DROP PROCEDURE IF EXISTS tables_to_csv;
DELIMITER //

CREATE PROCEDURE tables_to_csv()
BEGIN
    DECLARE fi INT DEFAULT 0;
    DECLARE nom_taula VARCHAR(255) DEFAULT "";
    DECLARE select_tables CURSOR FOR SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = DATABASE();
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET fi = 1;

    OPEN select_tables;

    tables_loop: LOOP
        FETCH select_tables INTO nom_taula;

        IF fi THEN
            LEAVE tables_loop;
        END IF;

        SET @destino = CONCAT('/tmp/', DATE_FORMAT(NOW(), '%Y%m%d%H%i%s'), '_', nom_taula, '.csv');
        SELECT @destino;
        SET @query = CONCAT('SELECT * FROM ', nom_taula, ' INTO OUTFILE "', @destino, '"');
        
        PREPARE stmt FROM @query;
        EXECUTE stmt;
        DEALLOCATE PREPARE stmt;
    END LOOP;
    CLOSE select_tables;
END;
//
DELIMITER ;

SET GLOBAL event_scheduler = 1;
DROP EVENT IF EXISTS evtables_to_csv;
DELIMITER //
CREATE EVENT evtables_to_csv
ON SCHEDULE 
EVERY 30 SECOND
    STARTS CURRENT_TIMESTAMP + INTERVAL 1 SECOND
    ENDS CURRENT_TIMESTAMP + INTERVAL 3 MINUTE
    ON COMPLETION NOT PRESERVE
DO
    BEGIN
        CALL tables_to_csv();
END//
DELIMITER ;
