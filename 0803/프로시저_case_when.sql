--------스토어드 프로시저-----------------------------------------------------

-------------CASE WHEN------------------------------------------------------------

USE sqldb;
DELIMITER $$
CREATE PROCEDURE caseProc()
BEGIN
	DECLARE POINT INT;
	DECLARE credit CHAR(1);
	SET POINT =77;
	
	case
	when POINT >= 90 then
		SET credit = 'A';
	when POINT >= 80 then
		SET credit = 'B';
	when POINT >= 70 then
		SET credit = 'C';
	when POINT >= 60 then
		SET credit = 'D';
	ELSE
		SET credit = 'F';
	END case;
		SELECT CONCAT('취득점수==>', POINT), CONCAT('학점==>', credit);
END $$
DELIMITER ;

CALL caseProc();

-------------------------------------------

USE sqldb;
SELECT userID, SUM(price*amount) AS '총구매액'
	FROM buytbl
	GROUP BY userID
	ORDER BY SUM(price*amount) DESC;
---------------------------------------------	
USE sqldb;
SELECT B.userID, U.userName, SUM(price*amount) AS '총구매액'
	FROM buytbl B
		INNER JOIN usertbl U
			ON B.userID = U.userID
	GROUP BY B.userID, U.userName
	ORDER BY SUM(price*amount) DESC;
---------------------------------------------	
USE sqldb;
SELECT B.userID, U.userName, SUM(price*amount) AS '총구매액'
	FROM buytbl B
		RIGHT OUTER JOIN usertbl U
			ON B.userID = U.userID
	GROUP BY B.userID, U.userName
	ORDER BY SUM(price*amount) DESC;
---------------------------------------------	
USE sqldb;
SELECT U.userID, U.userName, SUM(price*amount) AS '총구매액'
	FROM buytbl b
		RIGHT OUTER JOIN usertbl U
			ON B.userID = U.userID
	GROUP BY U.userID, U.userName
	ORDER BY SUM(price*amount) DESC;
---------------------------------------------	
USE sqldb;
SELECT U.userID, U.userName, SUM(price*amount) AS '총구매액',
	case
		when (SUM(price*amount) >= 1500) then '최우수고객'
		when (SUM(price*amount) >= 1000) then '우수고객'
		when (SUM(price*amount) >= 1 ) then '일반고객'
		ELSE '유령고객'
	END AS '고객등급'
FROM buytbl B
	RIGHT OUTER JOIN usertbl U
		ON B.userID = U.userID
GROUP BY U.userID, U.userName
ORDER BY SUM(price*amount) DESC; 
----------------------------------------------
USE sqldb;
DELIMITER $$
CREATE PROCEDURE caseProc0()
BEGIN
	DECLARE SUM INT ;
	DECLARE credit VARCHAR(10);
	SET SUM = 1000 ;
	
	case
		when SUM >= 1500 then
			SET credit = '최우수고객';
		when SUM >= 1000 then
			SET credit = '우수고객';
		when SUM >= 1 then
			SET credit = '일반고객';
		ELSE
			SET credit = '유령고객';
	END case;
	SELECT CONCAT('구매금액==>', SUM), CONCAT('고객등급==>', credit);
END $$
DELIMITER ;

CALL caseProc0();