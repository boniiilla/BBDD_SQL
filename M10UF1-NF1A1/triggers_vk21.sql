USE vk21;

DROP TRIGGER IF EXISTS after_insert_detall_stock;
DELIMITER //

CREATE TRIGGER after_insert_detall_stock
AFTER INSERT ON detall
FOR EACH ROW
BEGIN
    UPDATE productes
    SET stock = stock - NEW.quantitat -- Si hacemos el insert, sumar la nueva cantidad que hemos puesto en detall.
    WHERE id_producte = NEW.producte and id_fab = NEW.fab;
END//

DELIMITER ;

DROP TRIGGER IF EXISTS after_update_detall_stock;
DELIMITER //

CREATE TRIGGER after_update_detall_stock
AFTER UPDATE ON detall
FOR EACH ROW
BEGIN
    -- Si cambia el producto o el fabricante, modificamos los stocks de ambos productos
    IF OLD.producte != NEW.producte OR OLD.fab != NEW.fab THEN
        -- Reponer el stock del producto antiguo
        UPDATE productes
        SET stock = stock + OLD.quantitat
        WHERE id_producte = OLD.producte AND id_fab = OLD.fab;

        -- Reducir el stock del nuevo producto
        UPDATE productes
        SET stock = stock - NEW.quantitat
        WHERE id_producte = NEW.producte AND id_fab = NEW.fab;

    -- Si solo cambia la cantidad, pero el producto es el mismo.
    ELSEIF NEW.quantitat <> OLD.quantitat THEN
       UPDATE productes
        SET stock = stock - (NEW.quantitat - OLD.quantitat)
        WHERE id_producte = NEW.producte AND id_fab = NEW.fab;
    END IF;
END//

DELIMITER ;

DROP TRIGGER IF EXISTS after_delete_detall_stock;
DELIMITER //

CREATE TRIGGER after_delete_detall_stock
AFTER DELETE ON detall
FOR EACH ROW
BEGIN
    UPDATE productes
    SET stock = stock + OLD.quantitat -- El mas sencillo, restamos el valor de la antigua cantidad.
    WHERE id_producte = OLD.producte and id_fab = OLD.fab;
END//

DELIMITER ;