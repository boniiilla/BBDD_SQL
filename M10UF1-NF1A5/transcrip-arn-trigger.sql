DELIMITER //

CREATE TRIGGER transcribir_arn
BEFORE INSERT ON secuencias
FOR EACH ROW
BEGIN
    DECLARE posicion INT DEFAULT 1;
    DECLARE triplete VARCHAR(3);
    DECLARE transcripcion_triplete VARCHAR(3);
    DECLARE transcripcion_final TEXT DEFAULT '';

    -- Bucle para recorrer la cadena de ARN en grupos de 3 nucleótidos
    WHILE posicion <= LENGTH(NEW.cadena_arn) DO
        -- Extraer el triplete de 3 nucleótidos
        SET triplete = SUBSTRING(NEW.cadena_arn, posicion, 3);

        -- Verificar si el triplete es de menos de 3 caracteres y detener si es así
        IF LENGTH(triplete) < 3 THEN
            LEAVE;
        END IF;

        -- Buscar la transcripción del triplete en la tabla codi_genetic
        SELECT transcripcion INTO transcripcion_triplete 
        FROM codi_genetic
        WHERE triplete = triplete;

        -- Si el triplete no tiene transcripción o la transcripción es '-', detener el proceso
        IF transcripcion_triplete IS NULL OR transcripcion_triplete = '-' THEN
            LEAVE;
        END IF;

        -- Concatenar la transcripción del triplete al resultado final
        SET transcripcion_final = CONCAT(transcripcion_final, transcripcion_triplete, ' ');

        -- Avanzar a la siguiente posición
        SET posicion = posicion + 3;
    END WHILE;

    -- Asignar la transcripción final a la columna transcripcion
    SET NEW.transcripcion = TRIM(transcripcion_final);
END //

DELIMITER ;
