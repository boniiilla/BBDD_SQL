DROP DATABASE IF EXISTS `aula`;
CREATE DATABASE IF NOT EXISTS `aula`;
USE aula;

CREATE TABLE `classe` (
  codi INT AUTO_INCREMENT COMMENT 'Clau primària',
  nom VARCHAR(32) COMMENT 'A qui pertany la classe' UNIQUE NOT NULL,
  data_reforma DATE COMMENT 'Data de la darrera reforma',
  descripció VARCHAR(80) COMMENT 'Petita info darrera reforma' DEFAULT 'Petits treballs de pintura',
  PRIMARY KEY(codi)
) engine=innoDB auto_increment=100 COMMENT 'Aquesta taula serveix per control de actuacions';

CREATE TABLE `alumnat` (
  id INT AUTO_INCREMENT,
  nom VARCHAR(20) NOT NULL,
  cognom1 VARCHAR(32) NOT NULL,
  codi_classe INT COMMENT 'PK de la classe del alumnat',
  PRIMARY KEY(id),
  FOREIGN KEY(codi_classe) REFERENCES classe(codi)
) engine=innoDB; 

CREATE TABLE `modul` (
  codi CHAR(4),
  nom VARCHAR(20) NOT NULL,
  hores INT COMMENT 'Total hores del mòdul',
  PRIMARY KEY(codi)
) engine=innoDB; 

CREATE TABLE `nota` (
  id INT,
  codi CHAR(4),
  qualificacio TINYINT NOT NULL,
  PRIMARY KEY(id, codi),
  FOREIGN KEY(id) REFERENCES `alumnat`(id),
  FOREIGN KEY(codi) REFERENCES `modul`(codi)  
) engine=innoDB; 


INSERT INTO classe (codi, nom, data_reforma, descripció) VALUES (NULL, 'ASIX', '2023-12-11', 'Pintura general');
INSERT INTO classe (codi, nom, data_reforma, descripció) VALUES (NULL, 'Laboratori de química', 20231211, DEFAULT);

INSERT INTO classe (nom, data_reforma, descripció) VALUES ('DAW', '2023-12-18', 'Canvi de switch');

INSERT INTO alumnat (id, nom, cognom1, codi_classe) VALUES (NULL, 'Alex', 'García', 100);

INSERT INTO alumnat (nom, cognom1) VALUES ('David', 'Pérez');

INSERT INTO alumnat (nom, cognom1) VALUES 
('Sergi', 'Rodríguez'),
('Xavi', 'Mateo'),
('Joan', 'Richermberg'),
('Peter', 'Straus');

