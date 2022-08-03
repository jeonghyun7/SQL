--------스토어드 프로시저-----------------------------------------------------
--------------WHILE-------------------------------------------------------------

USE sqldb;
DELIMITER $$
CREATE PROCEDURE whileProc()
BEGIN
	DECLARE i INT;
	DECLARE hap INT;
		SET i = 1;
		SET hap = 0;
		
	while (i <= 100) DO
		SET hap = hap + i;
		SET i = i+1;
	END while;
	
	SELECT hap;
END $$
DELIMITER ;

CALL whileProc(); 
----------------------------------
USE sqldb;
DELIMITER $$
CREATE PROCEDURE whileProc2()
BEGIN
	DECLARE i INT;
	DECLARE hap INT;
	SET i = 1;
	SET hap = 0;
	
	myWhile: while (i <= 100) DO
		IF (i%7 = 0) then
			SET i = i+1;
			ITERATE myWhile;
		END IF;
		
		SET hap = hap + i;
		
		IF (hap > 1000) then
			LEAVE myWhile;
		END IF;
			
		SET i = i + 1;
		
	END while;
			
	SELECT hap;
	
END $$
DELIMITER ;

CALL whileProc2();
