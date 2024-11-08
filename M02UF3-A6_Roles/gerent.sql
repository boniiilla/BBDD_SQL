USE vendesk22;

-- Taula venedors --
SELECT * FROM venedors LIMIT 5;

DELETE FROM venedors WHERE num_ven = 103;

-- Taula comandes --
SELECT * FROM comandes LIMIT 5;

DELETE FROM comandes WHERE num_comanda = 113099;

-- Creacio taula Gerent --
CREATE TABLE gerent (
    id_gerent INT AUTO_INCREMENT PRIMARY KEY
);