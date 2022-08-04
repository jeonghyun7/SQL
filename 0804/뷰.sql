--------------------------------------------------------------------------------
-----------뷰--------------------------------

USE tabledb;
CREATE VIEW v_usertbl
AS 
	SELECT userID, userName, addr FROM usertbl;
	
SELECT * FROM v_usertbl;

------------
USE tabledb;
CREATE VIEW v_userbuytbl
AS
SELECT U.userID, U.userName, B.prodName, U.addr, CONCAT(U.mobile1, U.mobile2) AS '연락처'
FROM usertbl U
	INNER JOIN buytbl B
		ON U.userID = B.userID;
		
SELECT * FROM v_userbuytbl WHERE userName = '김범수'

-------------------------------------------------------
USE sqldb;
CREATE VIEW v_userbuytbl
AS 
	SELECT U.userID AS 'USER ID', U.userName AS 'USER NAME', B.prodName AS 'PRODUCT NAME',
		U.addr, CONCAT(U.mobile1, U.mobile2) AS 'MOBILE PHONE'
	FROM usertbl U
INNER JOIN buytbl B
ON U.userID = B.userID;

SELECT `USER ID`, `USER NAME` FROM v_userbuytbl;
SELECT * FROM v_userbuytbl;

------------------------------
USE sqldb;
CREATE VIEW v_userbuytbl
AS
	SELECT U.userID, U.userName, B.prodName, U.addr, CONCAT(U.mobile1, U.mobile2) AS 'mobile'
	FROM usertbl U
		INNER JOIN buytbl B
			ON U.userID = B.userID;

INSERT INTO v_userbuytbl
VALUES ('PKL', '박경리', '운동화', '경기', '0000000');


DROP TABLE if EXISTS buytbl, usertbl;

SELECT * FROM v_userbuytbl;

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------