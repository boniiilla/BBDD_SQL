use vk21;
DELIMITER $$

DROP PROCEDURE IF EXISTS userpriv;
CREATE PROCEDURE userpriv()
BEGIN
  DECLARE done INT DEFAULT 0;
  DECLARE user_name VARCHAR(255);
  DECLARE num_privilegios INT;

  -- Cursor para recorrer los usuarios
  DECLARE user_cursor CURSOR FOR
    SELECT DISTINCT GRANTEE
    FROM information_schema.user_privileges
    GROUP BY GRANTEE;

  -- Manejador para finalizar el cursor cuando no haya más datos
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;


  OPEN user_cursor;
 
  -- Recorremos los usuarios
  read_loop: LOOP

    FETCH user_cursor INTO user_name;

    IF done THEN
      LEAVE read_loop;
    END IF;
   
    SET num_privilegios = privilegis(user_name);
    SET user_name = REPLACE(SUBSTRING_INDEX(user_name, '@', 1), "'", "")

    SELECT user_name AS 'Usuari', num_privilegios AS 'Nombre de Privilegis';
  END LOOP;

  CLOSE user_cursor;

END $$

DELIMITER ;