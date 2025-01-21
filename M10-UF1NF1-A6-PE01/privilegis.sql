DROP FUNCTION IF EXISTS privilegis;
DELIMITER //
CREATE FUNCTION privilegis(nomuser TEXT) RETURNS TEXT DETERMINISTIC
BEGIN
    DECLARE num_privilegis INT DEFAULT 0;

    SELECT COUNT(GRANTEE)
    FROM INFORMATION_SCHEMA.USER_PRIVILEGES 
    WHERE GRANTEE LIKE CONCAT('%', nomuser, '%')
    GROUP BY GRANTEE
    INTO num_privilegis;

    RETURN num_privilegis;
END; // 
DELIMITER ;