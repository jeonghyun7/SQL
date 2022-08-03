----CH08. 테이블과 뷰------------------------------------------------------------

USE tabledb;
CREATE TABLE usertbl (
	userID CHAR(8) NOT NULL PRIMARY KEY,
	name VARCHAR(10) NOT NULL,
	birthYear INT NOT NULL,
	addr CHAR(2) NOT NULL,
	mobile1 CHAR(3) NULL,
	mobile2 CHAR(8) NULL,
	height SMALLINT NULL,
	mDate DATE NULL
);

INSERT INTO usertbl VALUES ('LSG', '이승기', 1987, '서울', '011', '11111111', 182, '2008-8-8');
INSERT INTO usertbl VALUES ('KBS', '김범수', 1979, '경남', '011', '22222222', 173, '2012-4-4');
INSERT INTO usertbl VALUES ('KKH', '김경호', 1971, '전남', '019', '33333333', 177, '2007-7-7');
INSERT INTO usertbl VALUES ('JYP', '조용필', 1950, '경기', '011', '44444444', 166, '2009-4-4');
INSERT INTO usertbl VALUES ('SSK', '성시경', 1979, '서울', NULL, NULL, 186, '2013-12-12');
INSERT INTO usertbl VALUES ('LJB', '임재범', 1963, '서울', '016', '66666666', 182, '2009-9-9');
INSERT INTO usertbl VALUES ('YJS', '윤종신', 1969, '경남', NULL, NULL, 170, '2005-5-5');
INSERT INTO usertbl VALUES ('EJW', '은지원', 1978, '경북', '011', '88888888', 174, '2014-3-3');
INSERT INTO usertbl VALUES ('JKW', '조관우', 1965, '경기', '018', '99999999', 172, '2013-5-5');
INSERT INTO usertbl VALUES ('BBK', '바비킴', 1973, '서울', '010', '00000000', 176, '2013-5-5');


USE tabledb;
CREATE TABLE buytbl (
	num INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
	userID CHAR(8) NOT NULL,
	prodName CHAR(6) NOT NULL,
	groupName CHAR(4) NULL,
	price INT NOT NULL,
	amount SMALLINT NOT null
	, FOREIGN KEY (userID) REFERENCES usertbl (userID)
);

INSERT INTO buytbl VALUES (NULL, 'KBS', '운동화', NULL, 30, 2);
INSERT INTO buytbl VALUES (NULL, 'KBS', '노트북', '전자', 1000, 1);
INSERT INTO buytbl VALUES (NULL, 'JYP', '모니터', '전자', 200, 1);
INSERT INTO buytbl VALUES (NULL, 'BBK', '모니터', '전자', 200, 5);
INSERT INTO buytbl VALUES (NULL, 'KBS', '청바지', '의류', 50, 3);
INSERT INTO buytbl VALUES (NULL, 'BBK', '메모리', '전자', 80, 10);
INSERT INTO buytbl VALUES (NULL, 'SSK', '책', '서적', 15, 5);
INSERT INTO buytbl VALUES (NULL, 'EJW', '책', '서적', 15, 2);
INSERT INTO buytbl VALUES (NULL, 'EJW', '청바지', '의류', 50, 1);
INSERT INTO buytbl VALUES (NULL, 'BBK', '운동화', NULL, 30, 2);
INSERT INTO buytbl VALUES (NULL, 'EJW', '책', '서적', 15, 1);
INSERT INTO buytbl VALUES (NULL, 'BBK', '운동화', NULL, 30, 2);

---CHECK제약조건 추가했음---
USE tabledb;
ALTER TABLE usertbl
ADD CONSTRAINT AK_email
UNIQUE (email);


USE tabledb;
ALTER TABLE usertbl
ADD CONSTRAINT CK_name
CHECK (name IS NOT NULL);

USE tabledb;
ALTER TABLE usertbl
ADD CONSTRAINT CK_birth
CHECK (birthYear >= 1900 AND birthYear <= 2020);

USE tabledb;
ALTER TABLE usertbl
ADD CONSTRAINT CK_mobile1
CHECK (mobile1 IN ('010','011','016','017','018','019'));

--------------------------------------------------------------------
--------SQL로 테이블생성-------------------------------------------
USE test;
DROP TABLE if EXISTS usertbl;
CREATE TABLE usertbl (
	userID CHAR(8) NOT NULL PRIMARY KEY,
	name VARCHAR(10) NOT NULL,
	birthYear INT NOT NULL,
	addr CHAR(2) NOT NULL,
	mobile1 CHAR(3) NULL,
	mobile2 CHAR(8) NULL,
	height SMALLINT NULL,
	mDate DATE NULL
);

USE test;
INSERT INTO usertbl VALUES ('LSG', '이승기', 1987, '서울', '011', '11111111', 182, '2008-8-8');
INSERT INTO usertbl VALUES ('KBS', '김범수', 1979, '경남', '011', '22222222', 173, '2012-4-4');
INSERT INTO usertbl VALUES ('KKH', '김경호', 1971, '전남', '019', '33333333', 177, '2007-7-7');
INSERT INTO usertbl VALUES ('JYP', '조용필', 1950, '경기', '011', '44444444', 166, '2009-4-4');
INSERT INTO usertbl VALUES ('SSK', '성시경', 1979, '서울', NULL, NULL, 186, '2013-12-12');
INSERT INTO usertbl VALUES ('LJB', '임재범', 1963, '서울', '016', '66666666', 182, '2009-9-9');
INSERT INTO usertbl VALUES ('YJS', '윤종신', 1969, '경남', NULL, NULL, 170, '2005-5-5');
INSERT INTO usertbl VALUES ('EJW', '은지원', 1978, '경북', '011', '88888888', 174, '2014-3-3');
INSERT INTO usertbl VALUES ('JKW', '조관우', 1965, '경기', '018', '99999999', 172, '2013-5-5');
INSERT INTO usertbl VALUES ('BBK', '바비킴', 1973, '서울', '010', '00000000', 176, '2013-5-5');

USE test;
DROP TABLE if EXISTS buytbl;
CREATE TABLE buytbl (
	num INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
	userID CHAR(8) NOT NULL,
	prodName CHAR(6) NOT NULL,
	groupName CHAR(4) NULL,
	price INT NOT NULL,
	amount SMALLINT NOT null
	, FOREIGN KEY (userID) REFERENCES usertbl (userID)
);

INSERT INTO buytbl VALUES (NULL, 'KBS', '운동화', NULL, 30, 2);
INSERT INTO buytbl VALUES (NULL, 'KBS', '노트북', '전자', 1000, 1);
INSERT INTO buytbl VALUES (NULL, 'JYP', '모니터', '전자', 200, 1);
INSERT INTO buytbl VALUES (NULL, 'BBK', '모니터', '전자', 200, 5);
INSERT INTO buytbl VALUES (NULL, 'KBS', '청바지', '의류', 50, 3);
INSERT INTO buytbl VALUES (NULL, 'BBK', '메모리', '전자', 80, 10);
INSERT INTO buytbl VALUES (NULL, 'SSK', '책', '서적', 15, 5);
INSERT INTO buytbl VALUES (NULL, 'EJW', '책', '서적', 15, 2);
INSERT INTO buytbl VALUES (NULL, 'EJW', '청바지', '의류', 50, 1);
INSERT INTO buytbl VALUES (NULL, 'BBK', '운동화', NULL, 30, 2);
INSERT INTO buytbl VALUES (NULL, 'EJW', '책', '서적', 15, 1);
INSERT INTO buytbl VALUES (NULL, 'BBK', '운동화', NULL, 30, 2);

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
	
--------CHECK 제약 조건---------------------------------------------------------
DROP TABLE IF EXISTS usertbl;
CREATE TABLE usertbl (
	userID CHAR(8) PRIMARY KEY,
	userName VARCHAR(10) ,
	birthYear INT CHECK (birthYear >= 1900 AND birthYear <= 2020),
	mobile1 CHAR(3) NULL,
	CONSTRAINT CK_name CHECK (userName IS NOT NULL)
);

----휴대폰 국번 체크----
ALTER TABLE usertbl
ADD CONSTRAINT CK_mobile1
CHECK (mobile1 IN ('010','011','016','017','018','019')) ;


---------DEFAULT정의------------------------------------------------------------

DROP TABLE IF EXISTS usertbl;
CREATE TABLE usertbl (
	userID CHAR(8) NOT NULL PRIMARY KEY,
	userName VARCHAR(10) NOT NULL,
	birthYear INT NOT NULL DEFAULT -1,
	addr CHAR(2) NOT NULL DEFAULT '서울',
	mobile1 CHAR(3) NULL,
	mobile2 CHAR(8) NULL,
	height SMALLINT NULL DEFAULT 170,
	mDate DATE NULL
);
