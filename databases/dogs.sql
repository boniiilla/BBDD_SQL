DROP DATABASE IF EXISTS `dogs`;
CREATE DATABASE IF NOT EXISTS `dogs`;
USE `dogs`;

CREATE TABLE `sub_grup` (
  id INT AUTO_INCREMENT COMMENT 'id de la sub grup' NOT NULL,
  desc_subgrup VARCHAR(50) COMMENT 'nom del sub grup',
  PRIMARY KEY(id)
 ) engine=innodb;
 
CREATE TABLE `grup` (
  id INT AUTO_INCREMENT COMMENT 'id de la grub' NOT NULL,
  desc_grup VARCHAR(20) COMMENT 'nom del grub',
  PRIMARY KEY(id)
) engine=innodb;
  
CREATE TABLE `grup_gos`(
  codi INT AUTO_INCREMENT COMMENT 'PK grup de les races totals' NOT NULL,
  id_grup INT COMMENT 'PK de races',
  id_subgrup INT COMMENT 'PK de les sub races',
  PRIMARY KEY (codi),
  FOREIGN KEY(id_grup) REFERENCES `grup`(id),
  FOREIGN KEY(id_subgrup) REFERENCES `sub_grup`(id)
) engine=innodb;

CREATE TABLE `gos` (
  codi INT AUTO_INCREMENT COMMENT 'clau primaria gos' UNIQUE NOT NULL,
  name VARCHAR(50) COMMENT 'nom en angles del gos' UNIQUE NOT NULL,
  nom VARCHAR(50) COMMENT 'nom en catala del cos',
  altura INT COMMENT 'altura del gos',
  longevitat INT COMMENT 'longevitat del gos',
  grup INT COMMENT 'grup del gos',
  PRIMARY KEY(codi),
  FOREIGN KEY(grup) REFERENCES `grup_gos`(codi)
) engine=innodb;

CREATE TABLE `documentacio` (
  codi_gos INT COMMENT 'PK del gos',
  short_url VARCHAR(99) COMMENT 'url corta',
  short_image VARCHAR(99) COMMENT 'url de la image del gos',
  short_pdf_es VARCHAR(99) COMMENT 'url del pdf del gos en espanyol',
  PRIMARY KEY(codi_gos),
  FOREIGN KEY(codi_gos) REFERENCES `gos`(codi)
) engine=innodb;

CREATE TABLE `color_pelatge` (
  color VARCHAR(20) COMMENT 'color del pelatge del gos' NOT NULL,
  PRIMARY KEY(color)
) engine=innodb;

CREATE TABLE `pelatge_gos` (
  codi_gos INT COMMENT 'PK del gos',
  color_pelatge VARCHAR(20) COMMENT 'PK del color del pelatge',
  PRIMARY KEY(codi_gos, color_pelatge),
  FOREIGN KEY(codi_gos) REFERENCES `gos`(codi),
  FOREIGN KEY(color_pelatge) REFERENCES `color_pelatge`(color)
) engine=innodb;

CREATE TABLE `color_ulls` (
  color VARCHAR(20) COMMENT 'color dels ulls del gos' NOT NULL,
  PRIMARY KEY(color)
) engine=innodb;

CREATE TABLE `ulls_gos` (
  codi_gos INT COMMENT 'PK del gos',
  color_ulls VARCHAR(20) COMMENT 'PK del color dels ulls',
  PRIMARY KEY(codi_gos, color_ulls),
  FOREIGN KEY(codi_gos) REFERENCES `gos`(codi),
  FOREIGN KEY(color_ulls) REFERENCES `color_ulls`(color)
) engine=innodb;

CREATE TABLE `salut` (
  codi INT AUTO_INCREMENT COMMENT 'codi dels problemes de salut' NOT NULL,
  problemes VARCHAR(99) COMMENT 'descripcio dels problemes',
  PRIMARY KEY(codi)
) engine=innodb;

CREATE TABLE `salut_gos` (
  codi_gos INT COMMENT 'PK del gos',
  codi_salut INT COMMENT 'PK de salut',
  PRIMARY KEY (codi_gos, codi_salut),
  FOREIGN KEY(codi_gos) REFERENCES `gos`(codi),
  FOREIGN KEY(codi_salut) REFERENCES `salut`(codi)
) engine=innodb;

CREATE TABLE `caracter` (
  codi INT AUTO_INCREMENT COMMENT 'codi dels caracters' NOT NULL,
  caracteristica VARCHAR(99) COMMENT 'descripcio dels caracters',
  PRIMARY KEY(codi)
) engine=innodb;

CREATE TABLE `caracter_gos` (
  codi_gos INT COMMENT 'PK del gos',
  codi_caracter INT COMMENT 'PK de caracter',
  PRIMARY KEY (codi_gos, codi_caracter),
  FOREIGN KEY(codi_gos) REFERENCES `gos`(codi),
  FOREIGN KEY(codi_caracter) REFERENCES `caracter`(codi)
) engine=innodb;


  
  
