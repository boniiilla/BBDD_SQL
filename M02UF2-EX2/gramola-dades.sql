USE gramola;

LOAD DATA LOCAL INFILE '/home/usuari/compartida/M02UF2-EX2/municipi_prov.csv' 
INTO TABLE provincia 
FIELDS TERMINATED BY '\t' 
IGNORE 1 LINES 
(@dummy, @dummy, @codip, @nomp) SET codiprov=@codip, nom_provincia=@nomp;

LOAD DATA LOCAL INFILE '/home/usuari/compartida/M02UF2-EX2/municipi_prov.csv' 
INTO TABLE municipi 
FIELDS TERMINATED BY '\t' 
IGNORE 1 LINES 
(@codim, @nomm, @codip) SET codimun=@codim, codiprov=@codip, nom_municipi=@nomm;

LOAD DATA LOCAL INFILE '/home/usuari/compartida/M02UF2-EX2/grups.csv' 
INTO TABLE genere 
FIELDS TERMINATED BY '\t' 
IGNORE 1 LINES 
(@dummy, nom_gen);

DROP TEMPORARY TABLE IF EXISTS grup_genere;
CREATE TEMPORARY TABLE IF NOT EXISTS grup_genere (
grup VARCHAR(100) PRIMARY KEY,
genere VARCHAR(100),
any INT(4)
);

LOAD DATA LOCAL INFILE '/home/usuari/compartida/M02UF2-EX2/grups.csv' 
INTO TABLE grup_genere 
FIELDS TERMINATED BY '\t' 
IGNORE 1 LINES 
(grup, genere, any);

LOAD DATA LOCAL INFILE '/home/usuari/compartida/M02UF2-EX2/grups.csv' 
INTO TABLE grups 
FIELDS TERMINATED BY '\t' 
IGNORE 1 LINES 
(nom_grup, @dummy, any_creacio);



