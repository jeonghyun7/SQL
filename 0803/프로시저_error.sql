--------스토어드 프로시저-----------------------------------------------------
------------ERROR 프로시저----------------------------------------------------------

USE sqldb;
DELIMITER $$
CREATE PROCEDURE errorProc()
BEGIN
	DECLARE CONTINUE HANDLER FOR 1146 SELECT '테이블이 없어요 !!' AS '메시지';
	
	SELECT * FROM noTable;
END $$
DELIMITER ;

CALL errorProc();

---------------------------------------------------------------------------------