USE adn;

DROP TRIGGER IF EXISTS before_insert_adn;

DELIMITER //
CREATE TRIGGER before_insert_adn 
BEFORE INSERT ON adn
 FOR EACH ROW
  BEGIN
  	DECLARE lengthadn INT;
    DECLARE idx INT DEFAULT 1;
    DECLARE caracter VARCHAR(1);
    DECLARE arn TEXT DEFAULT '';

    SET NEW.adn = UPPER(NEW.adn);

    SET lengthadn = LENGTH(NEW.adn);
    IF lengthadn < 9 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "Error: Cadena massa curta";
    END IF;

    WHILE idx <= lengthadn DO
        SET caracter = SUBSTRING(NEW.adn, idx, 1);
        IF caracter != 'A' AND caracter != 'T' AND caracter != 'C' AND caracter != 'G' THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "Error: La cadena ADN és errònia. Només es permeten A, T, C o G.";
        END IF;
        SET idx = idx + 1;
    END WHILE;

    WHILE idx <= lengthadn DO
        SET caracter = SUBSTRING(NEW.adn, idx, 1);
        IF caracter = 'A' THEN 
            SET arn = CONCAT(arn, 'U');
        ELSEIF caracter = 'T' THEN
            SET arn = CONCAT(arn, 'A');
        ELSEIF caracter = 'C' THEN
            SET arn = CONCAT(arn, 'G');
        ELSEIF caracter = 'G' THEN
            SET arn = CONCAT(arn, 'C');
        END IF;
        SET idx = idx + 1;
    END WHILE;

    SET NEW.arn = arn;
END //
DELIMITER ;