DROP PROCEDURE if EXISTS ifProc;
DELIMITER $$
CREATE PROCEDURE ifProc()
	BEGIN
		DECLARE var1 INT;
		SET var1 = 100;
			IF var1 = 100 THEN
				SELECT '100입니다.';
			ELSE
				SELECT '100이 아닙니다.';
			END IF; 
	END $$
DELIMITER ;

CALL ifProc();