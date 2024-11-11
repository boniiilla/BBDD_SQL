DROP TEMPORARY TABLE IF EXISTS tempResult;
CREATE TEMPORARY TABLE IF NOT EXISTS tempResult (
	idgen INT,
	numamin INT,
	transcrip TEXT,
	es_proteina VARCHAR(36)
);

DELIMITER //
DROP TRIGGER IF EXISTS after_insert_adn;
CREATE TRIGGER IF NOT EXISTS after_insert_adn
AFTER INSERT ON adn
FOR EACH ROW
BEGIN
    DECLARE indx INT DEFAULT 1;
    DECLARE posicion INT DEFAULT 1;
    DECLARE triplete VARCHAR(3);
    DECLARE transcrip VARCHAR(1);
    DECLARE transcrip_final TEXT DEFAULT '';
    DECLARE es_proteina VARCHAR(36);

    WHILE posicion <= LENGTH(NEW.arn) DO
        SET triplete = SUBSTRING(NEW.arn, posicion, 3);

        IF LENGTH(triplete) > 2 THEN
            	SELECT idaminoacid INTO transcrip FROM codi_genetic
		WHERE idtrip = triplete;
		IF transcrip != '-' THEN
			SET transcrip_final = CONCAT(transcrip_final, transcrip, '');
			
			INSERT INTO triplearn(idgen, numtrip, idtrip, idaminoacid)
			VALUES (NEW.idgen, indx, triplete, transcrip);
			SET indx = indx + 1;
		END IF;
        END IF;
       
        SET posicion = posicion + 3;
    END WHILE;
    
    SET indx = indx - 1;
    
    IF LENGTH(transcrip_final) > 0 THEN
    	IF SUBSTRING(transcrip_final, 1, 1) = 'M' THEN
       		SET es_proteina = 'És proteïna';
       	ELSE
       		SET es_proteina = 'No és proteïna';
       	END IF;
	INSERT INTO tempResult
	VALUES(NEW.idgen, indx, transcrip_final, es_proteina);
    END IF;
END //
DELIMITER ;
