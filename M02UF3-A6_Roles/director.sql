USE vendesk22;

-- Proba taula venedors --
SELECT * FROM venedors LIMIT 5;

DELETE FROM venedors WHERE num_ven = 101;

-- Proba taula comandes --
SELECT * FROM comandes LIMIT 5;

INSERT INTO comandes (descripcio, data_comanda, clie, ven, iva, dte) 
VALUES ('Comanda web', '2001-02-21', 2107, 102, 21, 15);

DELETE FROM comandes WHERE num_comanda = 113070;