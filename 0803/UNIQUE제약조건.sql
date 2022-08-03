---------UNIQUE 제약 조건-------------------------------------------------------
USE test;
DROP TABLE IF EXISTS buytbl, usertbl;
CREATE TABLE usertbl (
	userID CHAR(8) NOT NULL PRIMARY KEY,
	userName VARCHAR(10) NOT NULL,
	birthYear INT NOT NULL,
	email CHAR(30) NULL UNIQUE 
);
DROP TABLE IF EXISTS usertbl;
CREATE TABLE usertbl (
	userID CHAR(8) NOT NULL PRIMARY KEY,
	userName VARCHAR(10) NOT NULL,
	birthYear INT NOT NULL,
	email CHAR(30) NULL,
	CONSTRAINT AK_email UNIQUE (email)
);