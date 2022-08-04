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