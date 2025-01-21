DROP PROCEDURE IF EXISTS userpriv;
DELIMITER //
CREATE PROCEDURE IF NOT EXISTS userpriv()
BEGIN
    DECLARE user TEXT;
    DECLARE clean_user TEXT;
    DECLARE fi_cursor BOOLEAN DEFAULT FALSE;

    DECLARE SELECTS CURSOR FOR
    SELECT GRANTEE
    FROM INFORMATION_SCHEMA.USER_PRIVILEGES
    GROUP BY GRANTEE;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET fi_cursor = TRUE;

    OPEN SELECTS;

    RECORRER_PRIVILEGIOS: LOOP
        FETCH SELECTS INTO user;
        SET clean_user = REPLACE(SUBSTRING_INDEX(user, '@', 1), "'", "");

        IF fi_cursor THEN
            LEAVE RECORRER_PRIVILEGIOS;
        END IF;

        SET @query = CONCAT('SELECT"' ,clean_user,'" AS Usuari, privilegis("',user,'") AS Privilegis');
        PREPARE stmt FROM @query;
        EXECUTE stmt;
        DEALLOCATE PREPARE stmt;
    END LOOP;

    CLOSE SELECTS;
END; // 
DELIMITER ;