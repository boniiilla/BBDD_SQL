USE instadb;

DROP TRIGGER IF EXISTS after_insert_photouser;

DELIMITER //
CREATE TRIGGER after_insert_photouser
AFTER INSERT ON photouser
FOR EACH ROW
BEGIN
    DECLARE tag VARCHAR(100);
    DECLARE inici INT DEFAULT 1;
    DECLARE final INT;
    DECLARE longitud INT;

    SET longitud = LENGTH(NEW.descripcio);

    WHILE inici <= longitud DO
        SET inici = LOCATE('#', NEW.descripcio, inici);
        
        IF inici = 0 THEN
            SET inici = longitud + 1;
        ELSE
            SET final = LOCATE(' ', NEW.descripcio, inici + 1);
        
            IF final = 0 THEN
                SET final = longitud + 1;  
            END IF;

            SET tag = SUBSTRING(NEW.descripcio, inici, final - inici);
            SET tag = TRIM(tag);
            SET tag = SUBSTRING(tag, 2);

            INSERT INTO tagphoto (idphoto, nomuser, tag) VALUES (NEW.idphoto, NEW.nomuser, tag);

            SET inici = final + 1; 
        END IF;
    END WHILE;
END;
//
DELIMITER ;


DROP TRIGGER IF EXISTS after_update_photouser;

DELIMITER //

CREATE TRIGGER after_update_photouser
AFTER UPDATE ON photouser
FOR EACH ROW
BEGIN
    DECLARE tag VARCHAR(100);
    DECLARE inici INT DEFAULT 1;
    DECLARE final INT;
    DECLARE longitud INT;

    SET longitud = LENGTH(NEW.descripcio);

    DELETE FROM tagphoto WHERE idphoto = NEW.idphoto AND nomuser = NEW.nomuser;

    WHILE inici <= longitud DO
        SET inici = LOCATE('#', NEW.descripcio, inici);
        
        IF inici = 0 THEN
            SET inici = longitud + 1;
        ELSE
            SET final = LOCATE(' ', NEW.descripcio, inici + 1);
        
            IF final = 0 THEN
                SET final = longitud + 1;  
            END IF;

            SET tag = SUBSTRING(NEW.descripcio, inici, final - inici);
            SET tag = TRIM(tag);
            SET tag = SUBSTRING(tag, 2);

            INSERT INTO tagphoto (idphoto, nomuser, tag) VALUES (NEW.idphoto, NEW.nomuser, tag);

            SET inici = final + 1; 
        END IF;
    END WHILE;
END;
//
DELIMITER ;