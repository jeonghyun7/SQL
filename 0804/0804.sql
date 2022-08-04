
-----------------------0804--------------------------------------------------------

------테이블압축-------------------------

CREATE DATABASE if NOT EXISTS compressdb;
USE compressdb;
CREATE TABLE normaltbl ( emp_no INT, first_name VARCHAR(14));
CREATE TABLE compresstbl ( emp_no INT, first_name VARCHAR(14)) ROW_FORMAT=COMPRESSED;

INSERT INTO normaltbl
		SELECT emp_no, first_name FROM employees.employees;
INSERT INTO compresstbl
		SELECT emp_no, first_name FROM employees.employees;
		
SHOW TABLE STATUS FROM compressdb;

USE mysql;
DROP DATABASE if EXISTS compressdb;

-----------------------------------

------임시 테이블------------------

USE employees;
CREATE TEMPORARY TABLE if NOT EXISTS temptbl (id INT, NAME CHAR(7));
CREATE TEMPORARY TABLE if NOT EXISTS employees (id INT, NAME CHAR(7));
DESCRIBE temptbl;
DESCRIBE employees;

INSERT INTO temptbl VALUES (1, 'This');
INSERT INTO employees VALUES (2, 'MariaDB');
SELECT * FROM temptbl;
SELECT * FROM employees;

USE employees;
SELECT * FROM temptbl;
SELECT * FROM employees;

DROP TABLE temptbl;

USE employees;
SELECT * FROM employees;

-----테이블 수정 alter문-----------------------

USE tabledb;
ALTER TABLE usertbl
ADD homepage VARCHAR(30)
DEFAULT 'http://www.hanbit.co.kr'
NULL;

ALTER TABLE usertbl
DROP COLUMN homepage;

ALTER TABLE usertbl
CHANGE COLUMN NAME uName VARCHAR(20) NULL ;

ALTER TABLE usertbl
MODIFY COLUMN uName VARCHAR(20) NOT NULL;

ALTER TABLE usertbl
DROP PRIMARY KEY;

--------------------------------------------------------------------------------
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
-----------트리거--------------------------------

USE sqldb;
CREATE TABLE if NOT EXISTS testtbl (id INT, txt VARCHAR(10));
INSERT INTO testtbl VALUES(1, '이엑스아이디');
INSERT INTO testtbl VALUES(2, '애프터스쿨');
INSERT INTO testtbl VALUES(3, '에이오에이');

DROP TRIGGER if EXISTS testTrg;
DELIMITER //
CREATE TRIGGER testTrg
	AFTER DELETE
	ON testTbl
	FOR EACH ROW
BEGIN
	SET @msg = '가수 그룹이 삭제됨';
END //
DELIMITER ;

SET @msg = '';
INSERT INTO testtbl VALUES(4, '나인뮤지스');
SELECT @msg;
UPDATE testtbl SET txt = '에이핑크' WHERE id = 3;
SELECT @msg;
DELETE FROM testtbl WHERE id = 4;
SELECT @msg;

----------------------------------------------------
---------트리거 적용 테이블 생성
USE sqlDB;

CREATE TABLE backup_usertbl (
	userID CHAR(8) NOT NULL PRIMARY KEY,
	userName VARCHAR(10) NOT NULL,
	birthYear INT NOT NULL,
	addr CHAR(2) NOT NULL,
	mobile1 CHAR(3),
	mobile2 CHAR(8),
	height SMALLINT,
	mDate DATE,
	modType CHAR(2),
	modDate DATE
);
---------업데이트시 트리거
USE sqldb;
DROP TRIGGER if EXISTS backUserTbl_UpdateTrg;
DELIMITER //
CREATE TRIGGER backUserTbl_UpdateTrg
	AFTER UPDATE
	ON usertbl
	FOR EACH ROW
BEGIN
	INSERT INTO backup_usertbl VALUES (OLD.userID, OLD.userName, OLD.birthYear,
		OLD.addr, OLD.mobile1, OLD.mobile2, OLD.height, OLD.mDate,
		'수정', CURDATE() );
END //
DELIMITER ;
----------삭제시 트리거
USE sqldb;
DROP TRIGGER if EXISTS backUserTbl_DeleteTrg;
DELIMITER //
CREATE TRIGGER backUserTbl_DeleteTrg
	AFTER DELETE
	ON usertbl
	FOR EACH row
BEGIN
	INSERT INTO backup_usertbl VALUES( OLD.userID, OLD.userName, OLD.birthYear,
		OLD.addr, OLD.mobile1, OLD.mobile2, OLD.height, OLD.mDate,
		'삭제', CURDATE() );
END //
DELIMITER ;
----------------------
USE sqldb;
UPDATE usertbl SET addr = '몽고' WHERE userID = 'JKW';
DELETE FROM usertbl WHERE height <= 168;

SELECT *FROM  backup_usertbl;

----------------트리거 예제----------------------------

CREATE DATABASE if NOT EXISTS triggerDB;
USE triggerdb;
CREATE TABLE ordertbl
	(orderNo INT AUTO_INCREMENT PRIMARY KEY,
	userID VARCHAR(5),
	prodName VARCHAR(5),
	orderamount INT );
CREATE TABLE prodtbl
	(prodName VARCHAR(5),
	account INT );
CREATE TABLE delivertbl
	(deliverNo INT AUTO_INCREMENT PRIMARY KEY,
	prodName VARCHAR(5),
	account INT UNIQUE);

USE triggerdb;
INSERT INTO prodtbl VALUES('사과', 100);
INSERT INTO prodtbl VALUES('배', 100);
INSERT INTO prodtbl VALUES('귤', 100);
----물품 테이블에서 개수를 감소시키는 트리거----
DROP TRIGGER if EXISTS orderTrg;
DELIMITER //
CREATE TRIGGER orderTrg
	AFTER INSERT 
	ON ordertbl
	FOR EACH row
BEGIN
	UPDATE prodtbl SET account = account - NEW.orderamount
		WHERE prodName = NEW.prodName ;
END //
DELIMITER ;
----배송테이블에 새 배송건을 입력하는 트리거----
DROP TRIGGER if EXISTS prodTrg;
DELIMITER //
CREATE TRIGGER prodTrg
	AFTER UPDATE
	ON prodtbl
	FOR EACH row
BEGIN
	DECLARE orderAmount INT;
	SET orderAmount = OLD.account - NEW.account;
	INSERT INTO delivertbl(prodName, account)
		VALUES(NEW.prodName, orderAmount);
END //
DELIMITER ;
-----------트리거 실행여부 확인해보기

USE triggerdb;
INSERT INTO ordertbl VALUES (NULL, 'JOHN', '배', 5);

SELECT * FROM ordertbl;
SELECT * FROM prodtbl;
SELECT * FROM delivertbl;

ALTER TABLE delivertbl CHANGE prodName productName VARCHAR(5);

INSERT INTO ordertbl VALUES (NULL, 'DANG', '사과', 9);

SELECT * FROM ordertbl;
SELECT * FROM prodtbl;
SELECT * FROM delivertbl;


-----------------------------------------------------------------
