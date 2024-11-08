USE vendesk22;

-- PROBA TAULA comandes --
SELECT * FROM comandes LIMIT 5;

INSERT INTO comandes (descripcio, data_comanda, clie, ven, iva, dte) 
VALUES ('Autoservei', '1999-07-23', 2102, 102, 16, 0);

UPDATE comandes
SET iva = 21
WHERE num_comanda = 112885;

-- PROBA TAULA detall --
SELECT * FROM detall LIMIT 5;

INSERT INTO detall (num_comanda, fab, producte, quantitat, preu)
VALUES (113103, 'bio', '112', 10, 450);

UPDATE detall
SET quantitat = 5
WHERE num_comanda = 112885;

-- PROBA TAULA productes --
SELECT * FROM productes LIMIT 5;

INSERT INTO productes(id_fab, id_producte, descrpicio, preu, stock, datamod, imatge)
VALUES ('aci', 41005, 'Articulo Tipo 5', 175, 1000, 2024-05-20, NULL);