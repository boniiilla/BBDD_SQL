DROP TRIGGER IF EXISTS before_insert_adn;
Delimiter //
CREATE TRIGGER before_insert_adn BEFORE INSERT ON adn
FOR EACH ROW
BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE adn_char CHAR(1);
    -- DECLARE arn_seq VARCHAR(255) DEFAULT '';
    DECLARE arn_seq TEXT DEFAULT '';
  SET NEW.adn = UPPER(NEW.adn);
  IF LENGTH(NEW.adn) < 9 THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Cadena massa curta';
  ELSEIF NEW.adn NOT REGEXP '^[ATCG]+$' THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'La cadena ADN és errònia. Només es permeten A, T, C o G.';
  ELSE
    WHILE i <= CHAR_LENGTH(NEW.adn) DO
      SET adn_char = SUBSTRING(NEW.adn, i, 1);
      SET arn_seq = CONCAT(arn_seq,
        (SELECT idarn FROM transcrip WHERE idadn = adn_char));
      SET i = i + 1;
    END WHILE;
--    SET @arn = arn_seq;
--    SET @cadena = NEW.adn;
  SET NEW.arn = arn_seq;
  END IF;

END//
Delimiter ;

