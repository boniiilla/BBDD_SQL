! clear;
pager cat | tee -a /home/usuari/compartida/M02UF3-A6_Roles/profe_root.txt

SELECT 'CREATE USER profe@localhost IDENTIFIED BY P@ssw0rd4;' AS 'QUERY 1'\G

CREATE USER 'profe'@'localhost' IDENTIFIED BY 'P@ssw0rd4';

SELECT 'GRANT gerent TO profe@localhost;' AS 'QUERY 2'\G
GRANT gerent TO profe@localhost;

SELECT user,host FROM mysql.user;

 /*
 --
 --
 */

nopager
notee