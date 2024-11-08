DROP DATABASE IF EXISTS `geografia`;
CREATE DATABASE IF NOT EXISTS `geografia`;
USE geografia;

CREATE TABLE `distancia` (
    id INT AUTO_INCREMENT COMMENT 'id de la distancia de les ciutats' NOT NULL UNIQUE,
    ciutat1 VARCHAR(60) NOT NULL,
    ciutat2 VARCHAR(60) NOT NULL,
    km DOUBLE UNSIGNED,
    milles DOUBLE UNSIGNED
);

DROP TRIGGER IF EXISTS before_insert_distancia;
DELIMITER //

CREATE TRIGGER before_insert_distancia BEFORE INSERT ON distancia
    FOR EACH ROW
        BEGIN
            Declare kmi, mil double;
SET kmi = 0.621371;
SET mil = 1.609344;
    IF NEW.km > 0 THEN
        SET NEW.milles = ROUND((NEW.km * kmi),2);
    ELSEIF NEW.milles > 0 THEN
        SET NEW.km = ROUND((NEW.milles * mil),2);
    END IF;
        END //
DELIMITER ;

