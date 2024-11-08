USE empresa;
LOAD DATA LOCAL INFILE '/home/usuari/compartida/M02UF3-EX/clients.csv' INTO TABLE clients
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n'
IGNORE 1 LINES
(codi_cli, nom_cli, nif, adreca, ciutat, telefon);

LOAD DATA LOCAL INFILE '/home/usuari/compartida/M02UF3-EX/departaments.csv' 
INTO TABLE departaments
FIELDS TERMINATED BY ':' ENCLOSED BY '"' LINES TERMINATED BY '\n'
IGNORE 1 LINES
(nom_dpt, ciutat_dpt, telefon);

LOAD DATA LOCAL INFILE '/home/usuari/compartida/M02UF3-EX/projectes.csv' 
INTO TABLE projectes
FIELDS TERMINATED BY '\t' ENCLOSED BY '"' LINES TERMINATED BY '\n'
IGNORE 1 LINES
(codi_proj, nom_proj, preu, data_inici, data_prev_fi, data_fi, codi_client);


LOAD DATA LOCAL INFILE '/home/usuari/compartida/M02UF3-EX/empleats.csv' 
INTO TABLE empleats
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n'
IGNORE 1 LINES
(codi_empl, nom_empl, cognom_empl, sou, nom_dpt, ciutat_dpt, num_proj);
