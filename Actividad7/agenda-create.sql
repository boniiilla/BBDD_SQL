DROP DATABASE IF EXISTS agenda;
CREATE DATABASE IF NOT EXISTS agenda;
USE agenda;

CREATE TABLE `contacte` (
  mobil VARCHAR(9) COMMENT 'Clau primaria, telefon mobil del contacte',
  nom VARCHAR(24) COMMENT 'Nom del contacte',
  cognom1 VARCHAR(24) COMMENT 'Cognom del contacte',
  cognom2 VARCHAR(24) COMMENT ' Segon cognom del contacte',
  data_naix DATE COMMENT 'Data de naixement',
  email VARCHAR(56) COMMENT 'correu electronic del contacte',
  PRIMARY KEY(mobil)
) engine=innoDB;

CREATE TABLE `tipusvincle` (
  id INT AUTO_INCREMENT COMMENT 'id del tipus de vincle',
  nom VARCHAR(46) COMMENT 'nom del tipus de vincle' UNIQUE NOT NULL,
  descripcio TEXT COMMENT 'descripcio del vincle',
  PRIMARY KEY(id)
) engine=innoDB;

CREATE TABLE `relacio` (
  id INT AUTO_INCREMENT COMMENT 'id de la relacio dels contactes',
  contacte1 VARCHAR(9) COMMENT 'mobil del primer contacte',
  contacte2 VARCHAR(9) COMMENT 'mobil del segon contacte',
  id_tipusvincle INT COMMENT 'id del tipus de vincle dels contactes',
  PRIMARY KEY(id),
  FOREIGN KEY(contacte1) REFERENCES `contacte`(mobil),
  FOREIGN KEY(contacte2) REFERENCES `contacte`(mobil),
  FOREIGN KEY(id_tipusvincle) REFERENCES `tipusvincle`(id)
) engine=innoDB;

CREATE TABLE `reunions` (
  id INT AUTO_INCREMENT COMMENT 'id reunion',
  contacte1 VARCHAR(9) COMMENT 'mobil del primer contacte',
  contacte2 VARCHAR(9) COMMENT 'mobil del segon contacte',
  tipus_reunion ENUM('Presencial', 'Telematica') COMMENT 'tipus de la reunion',
  inici_reunion DATETIME COMMENT 'data de inici de la reunio',
  durada_hores INT COMMENT 'durada de la reunio en hores',
  estat INT COMMENT 'valor del estado de la reunion',
  descripcio TEXT GENERATED ALWAYS AS (
      CASE WHEN estat = 0 THEN 'No realitzat'
           WHEN estat = 1 THEN 'Realitzat'
           ELSE 'Pendent'
      END ) STORED COMMENT 'descripcio del estat de la reunio',
  data_registre TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT 'la data de registre de la reunio',
  PRIMARY KEY(id),
  FOREIGN KEY(contacte1) REFERENCES `contacte`(mobil),
  FOREIGN KEY(contacte2) REFERENCES `contacte`(mobil)
) engine= innoDB;
