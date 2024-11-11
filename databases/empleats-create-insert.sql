CREATE DATABASE empleats;

USE empleats;

CREATE TABLE edificis_emp
   ( edifici VARCHAR(40) PRIMARY KEY,
     supmitjadesp INT NOT NULL
   ) engine=InnoDB;

CREATE TABLE despatxos
   ( edifici VARCHAR(40),
     numero INT,
     superficie INT,
     PRIMARY KEY (edifici, numero),
     FOREIGN KEY (edifici) REFERENCES edificis_emp (edifici)
   ) engine=InnoDB;


CREATE TABLE empleats_adm
   ( dni INT,
     nom VARCHAR(30) NOT NULL,
     cognom VARCHAR(40) NOT NULL,   
     edificidesp VARCHAR(40),
     numerodesp INT,
     PRIMARY KEY (dni),
     FOREIGN KEY (edificidesp, numerodesp) REFERENCES despatxos (edifici, numero)
   ) engine=InnoDB;

CREATE TABLE empleats_prod
   ( dniemp INT,
     nomemp VARCHAR(30) NOT NULL,
     cognomemp VARCHAR(40) NOT NULL,   
     edificidesp VARCHAR(40),
     numerodesp INT,
     PRIMARY KEY (dniemp),
     FOREIGN KEY (edificidesp, numerodesp) REFERENCES despatxos (edifici, numero)
   ) engine=InnoDB;


INSERT INTO edificis_emp VALUES ('Marina', 15);
INSERT INTO edificis_emp VALUES ('Diagonal', 10);

INSERT INTO despatxos VALUES ('Marina', 120, 10);
INSERT INTO despatxos VALUES ('Marina', 230, 20);
INSERT INTO despatxos VALUES ('Diagonal', 120, 10);
INSERT INTO despatxos VALUES ('Diagonal', 440, 10);

INSERT INTO empleats_adm VALUES (40444255, 'Joan', 'Garcia', 'Marina', 120);
INSERT INTO empleats_adm VALUES (33567711, 'Marta', 'Roca', 'Marina', 120);

INSERT INTO empleats_prod VALUES (33567711, 'Marta', 'Roca', 'Marina', 120);
INSERT INTO empleats_prod VALUES (55898425, 'Carles', 'Bonmati', 'Diagonal', 120);
INSERT INTO empleats_prod VALUES (77232144, 'Elena', 'Pla', 'Marina', 230);
INSERT INTO empleats_prod VALUES (21335245, 'Jordi', 'Soler', NULL, NULL);
INSERT INTO empleats_prod VALUES (88999210, 'Pere', 'Gonzalez', NULL, NULL);

