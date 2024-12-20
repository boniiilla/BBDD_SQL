DROP PROCEDURE IF EXISTS ciutats;
DELIMITER //
CREATE PROCEDURE IF NOT EXISTS ciutats()
BEGIN
    SELECT Name, Population FROM City;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS ciutats_lim;
DELIMITER //
CREATE PROCEDURE IF NOT EXISTS ciutats_lim(IN lon INT)
BEGIN
    SELECT Name, Population FROM City ORDER BY Name LIMIT lon;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS ciutats_lim2;
DELIMITER //
CREATE PROCEDURE IF NOT EXISTS ciutats_lim2(IN ini INT, IN lon INT)
BEGIN
    SELECT Name, Population FROM City ORDER BY Name LIMIT ini, lon;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS ciutats3;
DELIMITER //
CREATE PROCEDURE IF NOT EXISTS ciutats3(
    IN pais VARCHAR(28), OUT numciutats INT)
BEGIN
    SELECT COUNT(*) INTO numciutats
    FROM City WHERE CountryCode = (SELECT Code FROM Country WHERE Name = pais);
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS incPob;
DELIMITER //
CREATE PROCEDURE IF NOT EXISTS incPob(INOUT poblacio INT, IN percent FLOAT)
BEGIN
    SET poblacio = poblacio + (poblacio * percent / 100);
END //
DELIMITER ;

DELIMITER //
DROP PROCEDURE IF EXISTS catPob;
CREATE PROCEDURE IF NOT EXISTS catPob()
BEGIN
    SELECT City.ID, City.Name, City.Population,
        CASE
            WHEN City.Population > 1000000 THEN 'Megalópoli'
            WHEN City.Population BETWEEN 100000 AND 1000000 THEN 'Gran Ciutat'
            WHEN City.Population < 100000 THEN 'Poble'
            ELSE 'Desconeguda'
        END AS Categoria
    FROM City
    ORDER BY City.Name;
END //
DELIMITER ; 

DELIMITER //
DROP PROCEDURE IF EXISTS catPob2;
CREATE PROCEDURE IF NOT EXISTS catPob2()
BEGIN
    DECLARE fi INT DEFAULT 0;
    DECLARE codi INT;
    DECLARE nom VARCHAR(35);
    DECLARE poblacio INT;
    DECLARE cur_ciutats CURSOR FOR
        SELECT ID, Name, Population FROM City;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET fi = 1;

    CREATE TABLE IF NOT EXISTS ciutat (SELECT * FROM City);
    IF NOT EXISTS (
        SELECT * FROM information_schema.COLUMNS WHERE table_name = 'ciutat'
        AND column_name = 'Categoria' 
    ) THEN
      ALTER TABLE ciutat ADD COLUMN Categoria
        ENUM('Megalòpoli','Gran ciutat','Poble') DEFAULT NULL;
    END IF;

    OPEN cur_ciutats;
    ciutats_loop: LOOP
        FETCH cur_ciutats INTO codi, nom, poblacio;
        IF fi = 1 THEN
            LEAVE ciutats_loop;
        END IF;
       
        IF poblacio > 1000000 THEN
            SELECT codi, nom, poblacio, 'Mega' as Control;
            UPDATE ciutat SET Categoria = 'Megalòpoli' WHERE ID = codi;
        ELSEIF poblacio > 100000 THEN
            SELECT codi, nom, poblacio, 'Ciutat' as Control;
            UPDATE ciutat SET Categoria = 'Gran ciutat' WHERE ID = codi;
        ELSE
            SELECT codi, nom, poblacio, 'Poble' as Control;        
            UPDATE ciutat SET Categoria = 'Poble' WHERE ID = codi;
        END IF;
    END LOOP;

    CLOSE cur_ciutats;
END//
DELIMITER ;