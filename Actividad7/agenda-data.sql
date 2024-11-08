LOAD DATA LOCAL INFILE '/home/usuari/compartida/Actividad7/agenda-contacte.csv'
INTO TABLE contacte
FIELDS TERMINATED BY '\t'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(nom, cognom1, cognom2, mobil, @data_naix, email)
SET data_naix = STR_TO_DATE(@data_naix, '%Y-%m-%d');

INSERT INTO `tipusvincle`(nom, descripcio) VALUES('Comercial', 'Compra-venda de productes');
INSERT INTO `tipusvincle`(nom, descripcio) VALUES('Departament', 'Treballen al mateix departament');
INSERT INTO `tipusvincle`(nom, descripcio) VALUES('Transport', 'Relació amb enviament de mercaderies');
INSERT INTO `tipusvincle`(nom, descripcio) VALUES('Assessorament', 'De formació');
INSERT INTO `tipusvincle`(nom, descripcio) VALUES('Altres', 'Relació genèrica o encara no definida');

-- Crear 100 inserts aleatorios -- 

INSERT INTO `relacio`(contacte1, contacte2, id_tipusvincle)
SELECT cnt1.mobil AS contacte1, cnt2.mobil AS contacte2,
    (SELECT id FROM tipusvincle ORDER BY RAND() LIMIT 1) AS id_tipusvincle 
FROM contacte cnt1 JOIN contacte cnt2 ON cnt1.mobil < cnt2.mobil
ORDER BY RAND()
LIMIT 100;

INSERT INTO `reunions`(contacte1, contacte2, tipus_reunion, inici_reunion, durada_hores, estat)
SELECT cnt1.mobil AS contacte1, cnt2.mobil AS contacte2,
    IF(RAND() < 0.5, 'Presencial', 'Telematica') AS tipus_reunion,
    DATE_ADD(NOW(), INTERVAL FLOOR(RAND() * 2 - 1) MONTH) + INTERVAL FLOOR(RAND() * 16 - 8) HOUR AS inici_reunion,
    FLOOR(RAND() * 8) + 1 AS durada_hores,
    0 AS estat
FROM relacio r
    JOIN contacte cnt1 ON r.contacte1 = cnt1.mobil
    JOIN contacte cnt2 ON r.contacte2 = cnt2.mobil
ORDER BY RAND()
LIMIT 100;




