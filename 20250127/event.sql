SET GLOBAL event_scheduler = 1;
DROP EVENT IF EXISTS ev_test;
DELIMITER //
CREATE EVENT ev_test
ON SCHEDULE 
EVERY 2 SECOND
    STARTS CURRENT_TIMESTAMP + INTERVAL 1 SECOND
    ENDS CURRENT_TIMESTAMP + INTERVAL 30 SECOND
    ON COMPLETION NOT PRESERVE
DO
    BEGIN
        INSERT INTO chk.chk VALUES();
END//
DELIMITER ;

