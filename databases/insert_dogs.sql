DROP TEMPORARY TABLE IF EXISTS temp_pais;

CREATE TEMPORARY TABLE IF NOT EXISTS temp_pais LIKE pais;
LOAD DATA LOCAL INFILE '/home/usuari/dogs_breeds_columns.csv'
IGNORE INTO TABLE temp_pais 
FIELDS TERMINATED BY '\t' ENCLOSED BY '"' ESCAPED BY '"' LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@dummy, @dummy, @dummy, @dummy, nompais) SET idpais = NULL;

DROP TEMPORARY TABLE IF EXISTS 2pais;
CREATE TEMPORARY TABLE IF NOT EXISTS 2pais LIKE pais;

-- Ara inserirem de forma unitaria

INSERT IGNORE INTO 2pais
SELECT NULL, RTRIM(LTRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(nompais, ',', n), ',', -1))) AS Valor
FROM temp_pais
CROSS JOIN (
   SELECT 1 AS n UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5
) AS numbers
WHERE n <= 1 + LENGTH(nompais) - LENGTH(REPLACE(nompais, ',', ''))
AND nompais <> '';

-- Ara ja tindrem els insert ordenats alfabèticament amb la següent comanda

INSERT IGNORE INTO pais SELECT NULL, nompais FROM 2pais ORDER BY 2;

DROP TEMPORARY TABLE IF EXISTS temp_pais;
DROP TEMPORARY TABLE IF EXISTS 2pais;
