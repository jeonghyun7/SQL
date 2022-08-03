----------기본 키 제약 조건-------------------------------------------
USE test;
DROP TABLE if EXISTS usertbl;
CREATE TABLE usertbl (
userID CHAR(8) NOT NULL,
userName VARCHAR(10) NOT NULL,
birthYear INT NOT NULL,
CONSTRAINT PRIMARY KEY PK_userTBL_userID (userID)
);
-----------------------------
USE test;
DROP TABLE if EXISTS usertbl;
CREATE TABLE usertbl (
	userID CHAR(8) NOT NULL,
	userName VARCHAR(10) NOT NULL,
	birthYear INT NOT NULL
);
ALTER TABLE usertbl
ADD CONSTRAINT PK_usertbl_userID
	PRIMARY KEY (userID);