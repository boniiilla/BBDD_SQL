DROP FUNCTION IF EXISTS priv_usuari;
DELIMITER //
CREATE FUNCTION priv_usuari(nomuser TEXT) RETURNS TEXT DETERMINISTIC
BEGIN
    DECLARE privilegis_txt TEXT DEFAULT NULL;

    SELECT GROUP_CONCAT(privilege_type SEPARATOR ',')
    FROM INFORMATION_SCHEMA.USER_PRIVILEGES 
    WHERE GRANTEE LIKE CONCAT('%', nomuser, '%')
    GROUP BY GRANTEE
    INTO privilegis_txt;

    IF privilegis_txt IS NULL THEN
        SET privilegis_txt = CONCAT("L'usuari [ ", nomuser ," ] no existeix");
    END IF;

    RETURN privilegis_txt;
END; // 
DELIMITER ;