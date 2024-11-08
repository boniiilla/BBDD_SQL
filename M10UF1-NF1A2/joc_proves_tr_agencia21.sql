# \P cat | tee -a /tmp/agencia21.out | less -n -i -S
# Select 'per pasar a la següent consulta' AS "Prem la tecla 'q'" ;
# mysql -u root -p -sN ag -- Sense linies (-s) ni capçalera (-N)
SET AUTOCOMMIT=0;
pager cat | tee -a /tmp/agencia21.out
Select '/tmp/agencia21.out' AS "L'arxiu resultant es troba al directori" ;

TRUNCATE mysql.general_log;
SELECT @@general_log into @gen_log;
SELECT @@log_output into @log_out;

SET GLOBAL general_log=1;
SET GLOBAL log_output='TABLE';

SELECT current_timestamp();
DELETE FROM Viatges where Codi = 31;
DELETE FROM Reserves_Viatges where Codi_Viatge=25 AND NIF_Client='39101006V';

SELECT current_timestamp(3);
INSERT INTO Viatges VALUES (31, 'Barcelona', 'New York', 20241110, 20241115, 1200, 10);
Select * From Viatges;
SELECT SLEEP(1);

SELECT current_timestamp(3);
INSERT INTO Reserves_Viatges VALUES(31, '40810975M', 5);

SELECT '[ RESPOSTA -1- Error Viatge realitzat ]' AS 'TRIGGER';
SELECT current_timestamp(3);
INSERT INTO Reserves_Viatges VALUES(25, '39101006V', 2);
SELECT SLEEP(1);

SELECT '[ RESPOSTA -2- Error núm places ]' AS 'TRIGGER';
SELECT current_timestamp(3);
INSERT INTO Reserves_Viatges VALUES(31, '40810975M', 7);
-- Select * From Viatges;
-- Select * From Reserves_Viatges;
SELECT SLEEP(1);

SELECT '[ -3- NO RESPOSTA Error Places ]' AS 'TRIGGER';
SELECT current_timestamp(3);
UPDATE Reserves_Viatges SET N_Places=8 WHERE Codi_Viatge = 31 AND NIF_Client = '40810975M';
Select * From Viatges;
SELECT SLEEP(1);
Select * From Reserves_Viatges;
SELECT SLEEP(1);

SELECT '[ RESPOSTA -4- Error Supera límit de Places ]' AS 'TRIGGER';
SELECT current_timestamp(3);
UPDATE Reserves_Viatges SET N_Places=50 WHERE Codi_Viatge = 31 AND NIF_Client = '40810975M';
Select * From Viatges;
SELECT SLEEP(1);
Select * From Reserves_Viatges;
SELECT SLEEP(1);

SELECT '[ RESPOSTA -5- Error viatge realitzat no es pot eliminar ]' AS 'TRIGGER';
SELECT current_timestamp(3);
DELETE From Reserves_Viatges where Codi_Viatge = 25 and NIF_Client = '35191937M';
SELECT SLEEP(1);
Select * From Viatges;
Select * From Reserves_Viatges;
SELECT 'Joc de Proves' AS '----------------------- Finalitzacio ---------------------------';


SELECT event_time, CAST(argument AS CHAR(10000) CHARACTER SET utf8)  as arg  FROM mysql.general_log ORDER BY event_time;

nopager
notee

SET GLOBAL general_log=@gen_log;
SET GLOBAL log_output=@log_out;
ROLLBACK;
SET AUTOCOMMIT=1;

