DROP DATABASE IF EXISTS `gramola`;
CREATE DATABASE IF NOT EXISTS `gramola`
DEFAULT CHARACTER SET utf8
DEFAULT COLLATE utf8_general_ci;
USE gramola

--

CREATE TABLE genere (
id_gen INT AUTO_INCREMENT PRIMARY KEY,
nom_gen VARCHAR(24) UNIQUE
);

CREATE TABLE grups (
codi_grup INT AUTO_INCREMENT PRIMARY KEY,
nom_grup VARCHAR(24) UNIQUE,
id_gen INT,
any_creacio INT(4),
FOREIGN KEY (id_gen) REFERENCES genere(id_gen)
);

CREATE TABLE discografia (
NIF VARCHAR(10) PRIMARY KEY,
nom VARCHAR(24) UNIQUE,
email VARCHAR(64),
web VARCHAR(100)
);

CREATE TABLE contractes (
    id_contracte INT AUTO_INCREMENT PRIMARY KEY,
    NIF_discografia VARCHAR(10),
    codi_grup INT,
    data_inici DATE,
    data_final DATE,
    FOREIGN KEY (NIF_discografia) REFERENCES discografia(NIF),
    FOREIGN KEY (codi_grup) REFERENCES grups(codi_grup)
);

CREATE TABLE discos (
    codi_grup INT,
    titol VARCHAR(64),
    any INT(4),
    durada TIME,
    pressupost FLOAT,
    PRIMARY KEY (codi_grup, any),
    FOREIGN KEY (codi_grup) REFERENCES grups(codi_grup)
);

CREATE TABLE provincia (
codiprov INT(2) UNSIGNED ZEROFILL,
nom_provincia VARCHAR(24) UNIQUE,
PRIMARY KEY(codiprov)
);

CREATE TABLE municipi (
codimun INT(4) UNSIGNED ZEROFILL,
codiprov INT(2) UNSIGNED ZEROFILL,
nom_municipi VARCHAR(44),
PRIMARY KEY(codimun, codiprov),
INDEX `fk_municipi_1_idx` (`codiprov`),
FOREIGN KEY(codiprov) REFERENCES provincia(codiprov) ON DELETE NO ACTION ON UPDATE CASCADE
);

CREATE TABLE concerts (
    id_concert INT AUTO_INCREMENT PRIMARY KEY,
    codi_grup INT,
    data DATE,
    hora TIME,
    codimun INT(4) UNSIGNED ZEROFILL,
    preu_pista FLOAT,
    preu_grada FLOAT,
    FOREIGN KEY (codi_grup) REFERENCES grups(codi_grup),
    FOREIGN KEY (codimun) REFERENCES municipi(codimun)
);