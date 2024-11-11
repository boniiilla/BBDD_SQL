DROP DATABASE IF EXISTS aula;
CREATE DATABASE aula;
use aula;

CREATE TABLE `classe` (
  codi INT AUTO_INCREMENT COMMENT 'clau primaria',
  nomgrup VARCHAR(20) COMMENT 'el nom del grup' UNIQUE NOT NULL,
  data_inici_curs DATE COMMENT 'quan comença el curs',
  descripcio VARCHAR(80) COMMENT 'petita informacio sobre el grup' DEFAULT 'Estanteria',
  PRIMARY KEY(codi)
);

CREATE TABLE `alumnat` (
  id INT AUTO_INCREMENT COMMENT 'clau primaria',
  nom VARCHAR(20) COMMENT 'EL nom del alumne',
  cognom1 VARCHAR(20) COMMENT 'El cognom del alumne' DEFAULT 'No te cognom',
  naixement DATE COMMENT 'Quan comença el curs',
  codi_classe INT COMMENT 'PK de la classe de alumnat',
  PRIMARY KEY(id),
  FOREIGN KEY (codi_classe) REFERENCES classe(codi)
);

CREATE TABLE 'modul' (
  codi CHAR(4),
  nom VARCHAR(20) NOT NULL,
  hores INT COMMENT 'Total hores del mòdul',
  PRIMARY KEY(codi)
) engine=innoDB;

CREATE TABLE 'nota' (
  id INT,
  codi CHAR(4),
  qualificacio TINYINT NOT NULL,
  PRIMARY KEY(id, codi),
  FOREIGN KEY (id) REFERENCES alumnat(id),
  FOREIGN KEY (codi) REFERENCES modul(codi)
) engine=innoDB;

INSERT INTO classe (codi, nomgrup, data_inici_curs, descripcio) VALUES (NULL, 'electronica','2022-12-24','Alguna cosa');

INSERT INTO classe (codi, nomgrup, data_inici_curs, descripcio) VALUES (105, 'musica','2023-01-12', DEFAULT);

INSERT INTO classe (nomgrup, data_inici_curs, descripcio) VALUES ('llibres','2005-06-30', 'Llibreria');

INSERT INTO classe (codi, nomgrup, data_inici_curs, descripcio) VALUES (NULL, 'informatica','2012-05-29', NULL);

INSERT INTO alumnat (id, nom, cognom1, naixement, codi_classe) VALUES (NULL, 'Pedro', DEFAULT, '2021-02-21',105);

INSERT INTO alumnat (nom, cognom1, naixement, codi_classe) VALUES ('Carlos','Bonilla','2005-09-25',1);

INSERT INTO alumnat (nom, cognom1) VALUES
('Sergi', 'Rodriguez'),
('Xavi', 'Richermberg'),
('Peter', 'Straus');

