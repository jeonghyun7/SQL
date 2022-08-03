---------외래 키 제약조건-----------------------------------------------
USE test;
CREATE TABLE buytbl (
	num INT AUTO_INCREMENT NOT NULL PRIMARY KEY ,
	userID CHAR(8) NOT NULL,
	prodName CHAR(6) NOT NULL,
	FOREIGN KEY (userID) REFERENCES usertbl (userID)
);
----------------------------
DROP TABLE if EXISTS buytbl;
CREATE TABLE buytbl (
	num INT AUTO_INCREMENT NOT NULL PRIMARY KEY ,
	userID CHAR(8) NOT NULL,
	prodName CHAR(6) NOT NULL,
	CONSTRAINT FK_usertbl_buytbl FOREIGN KEY (userID) REFERENCES 
	usertbl(userID)
);
-----------------------------
USE test;
DROP TABLE if EXISTS buytbl;
CREATE TABLE buytbl (
	num INT AUTO_INCREMENT NOT NULL PRIMARY KEY ,
	userID CHAR(8) NOT NULL,
	prodName CHAR(6) NOT NULL
);
ALTER TABLE buytbl
	ADD CONSTRAINT FK_usertbl_buytbl
	FOREIGN KEY (userID)
	REFERENCES usertbl(userID);
	
SHOW INDEX FROM buytbl;

----외래키 제거----
ALTER TABLE buytbl
	DROP FOREIGN KEY FK_usertbl_buytbl;
	
----CASCADE 추가  외래키 생성-----
ALTER TABLE buytbl
	ADD CONSTRAINT FK_usertbl_buytbl
	FOREIGN KEY (userID)
	REFERENCES usertbl (userID)
	ON UPDATE CASCADE;
	