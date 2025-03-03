DROP DATABASE IF EXISTS habitatge;
CREATE DATABASE IF NOT EXISTS habitatge;
USE habitatge;

CREATE TABLE `vivenda` (
    id_vivenda INT AUTO_INCREMENT PRIMARY KEY,
    tipus ENUM('Pis', 'Casa'),
    dormitoris VARCHAR(24),
    banys INT,
    superficie_vivenda DECIMAL(8, 2),
    superficie_terrassa DECIMAL(8, 2),
    any_construccio INT,
    estat_conservacio ENUM('Nova', 'Reformada', 'Cal Reformar'),
    preu_venda DECIMAL(10, 2),
    disponible_lloguer BOOLEAN,
    descripcio VARCHAR(140),
    data DATE
) ENGINE=InnoDB;

CREATE TABLE `casa` (
    id_vivenda INT AUTO_INCREMENT PRIMARY KEY,
    tipus ENUM(
        'Casa o chalet independi',
        'Chalet adosado',
        'Chalet pareado',
        'Finca rústica',
        'Casa o chalet',
        'Casa terrera',
        'Casa rural',
        'Masía',
        'Torre',
        'Casa de pueblo',
        'Palacio',
        'Caserón',
        'Castillo'
        ),
    num_plantes VARCHAR(48),
    superficie_garatge DECIMAL(8, 2),
    superficie_jardi DECIMAL(8, 2),
    FOREIGN KEY (id_vivenda) REFERENCES vivenda(id_vivenda)
) ENGINE=InnoDB;

CREATE TABLE `pis` (
    id_vivenda INT AUTO_INCREMENT PRIMARY KEY,
    tipus ENUM(
        'Piso',
        'Dúplex',
        'Estudio',
        'Ático'
    ),
    num_planta VARCHAR(48),
    FOREIGN KEY (id_vivenda) REFERENCES vivenda(id_vivenda)
) ENGINE=InnoDB;

CREATE TABLE `caracteristiques` (
    id_caracteristica INT AUTO_INCREMENT PRIMARY KEY,
    aire_condicionat BOOLEAN,
    ascensor BOOLEAN,
    armari_empotrat BOOLEAN,
    garatge BOOLEAN,
    jardi BOOLEAN,
    calefaccio BOOLEAN,
    piscina BOOLEAN,
    traster BOOLEAN,
    xemeneia BOOLEAN,
    terrassa BOOLEAN,
    balco BOOLEAN
) ENGINE=InnoDB;

CREATE TABLE `caracteristiques_vivendes` (
    id_vivenda INT,
    id_caracteristica INT AUTO_INCREMENT,
    PRIMARY KEY(id_vivenda, id_caracteristica),
    FOREIGN KEY (id_vivenda) REFERENCES vivenda(id_vivenda),
    FOREIGN KEY (id_caracteristica) REFERENCES caracteristiques(id_caracteristica)
) ENGINE=InnoDB;

CREATE TABLE `provincia` (
    id_provincia INT AUTO_INCREMENT PRIMARY KEY,
    nom_oficial VARCHAR(64) UNIQUE,
    nom_catala VARCHAR(64) UNIQUE
) ENGINE=InnoDB;

CREATE TABLE `comarca` (
    id_comarca INT AUTO_INCREMENT PRIMARY KEY,
    nom_comarca VARCHAR(100) UNIQUE
) ENGINE=InnoDB;

CREATE TABLE `municipi` (
    id_municipi INT AUTO_INCREMENT,
    id_provincia INT,
    nom_municipi VARCHAR(100),
    id_comarca INT,
    codi_INE CHAR(5),
    utmX VARCHAR(100),
    utmY VARCHAR(100),
    latitud DECIMAL(9,6),
    longitud DECIMAL(9,6),
    geo_referencia POINT,
    PRIMARY KEY(id_municipi, id_provincia),
    FOREIGN KEY (id_provincia) REFERENCES provincia(id_provincia),
    FOREIGN KEY (id_comarca) REFERENCES comarca(id_comarca)
) ENGINE=InnoDB;

CREATE TABLE `consum_energetic` (
    id_vivenda INT PRIMARY KEY,
    consum ENUM('A', 'B', 'C', 'D', 'E', 'F', 'G'),
    emisions ENUM('A', 'B', 'C', 'D', 'E', 'F', 'G'),
    FOREIGN KEY (id_vivenda) REFERENCES vivenda(id_vivenda)
) ENGINE=InnoDB;

CREATE TABLE `municipi_vivenda` (
    id_vivenda INT PRIMARY KEY,
    id_municipi INT,
    id_provincia INT,
    FOREIGN KEY (id_vivenda) REFERENCES vivenda(id_vivenda),
    FOREIGN KEY (id_municipi) REFERENCES municipi(id_municipi),
    FOREIGN KEY (id_provincia) REFERENCES municipi(id_provincia)
) ENGINE=InnoDB;
