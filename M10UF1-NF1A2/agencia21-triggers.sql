USE agencia21;

DROP TRIGGER IF EXISTS before_insert_Reserves_Viatges;

DELIMITER //
CREATE TRIGGER before_insert_Reserves_Viatges BEFORE INSERT ON Reserves_Viatges
 FOR EACH ROW
  BEGIN
  	DECLARE places_disponibles INT;
  	DECLARE data_sortida DATE;
    	
	SELECT N_Places, Data_Sortida INTO places_disponibles, data_sortida 
        FROM Viatges 
        WHERE Codi = NEW.Codi_Viatge 
        LIMIT 1;

    IF NEW.N_Places > places_disponibles THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "Error: Supera el límit de places";
    END IF;

    IF data_sortida <= CURDATE() THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "Error: El viatge està realitzat i no admet reserves";
    END IF;
END //
DELIMITER ;

DROP TRIGGER IF EXISTS after_insert_Reserves_Viatges;

DELIMITER //
CREATE TRIGGER after_insert_Reserves_Viatges AFTER INSERT ON Reserves_Viatges
 FOR EACH ROW
  BEGIN
    UPDATE Viatges 
    SET N_Places = N_Places - NEW.N_Places 
    WHERE Codi = NEW.Codi_Viatge;
END //
DELIMITER ;

DROP TRIGGER IF EXISTS before_update_Reserves_Viatges;

DELIMITER //
CREATE TRIGGER before_update_Reserves_Viatges
BEFORE UPDATE ON Reserves_Viatges
FOR EACH ROW
BEGIN

    DECLARE places_disponibles INT;
    DECLARE data_sortida DATE;

    SELECT N_Places, Data_Sortida INTO places_disponibles, data_sortida 
        FROM Viatges 
        WHERE Codi = NEW.Codi_Viatge 
        LIMIT 1;

    IF NEW.N_Places > places_disponibles THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = "Error: Supera el límit de places";
    END IF;

    IF data_sortida <= CURDATE() THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = "Error: El viatge està realitzat i no admet reserves";
    END IF;

END //
DELIMITER ;

DROP TRIGGER IF EXISTS before_delete_Reserves_Viatges;

DELIMITER //
CREATE TRIGGER before_delete_Reserves_Viatges
BEFORE DELETE ON Reserves_Viatges
FOR EACH ROW
BEGIN

    DECLARE data_sortida DATE;

    SELECT Data_Sortida INTO data_sortida 
        FROM Viatges 
        WHERE Codi = OLD.Codi_Viatge 
        LIMIT 1;

    IF data_sortida <= CURDATE() THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = "Error: Viatge realitzat no es pot eliminar";
    END IF;

END //
DELIMITER ;