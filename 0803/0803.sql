---------------------------------------------------------------------------------
---0803--------------------------------------------------------------------------
---이너조인(내부조인)----------------------------

SELECT S.stdName, S.addr, C.clubName, C.roomNo
FROM stdtbl S
INNER JOIN stdclubtbl SC ON S.stdName = SC.stdName
INNER JOIN clubtbl C ON SC.clubName = C.clubName
ORDER BY S.stdName;

USE sqldb;
SELECT C.clubName, C.roomNo, S.stdName, S.addr
FROM stdtbl S
INNER JOIN stdclubtbl SC ON S.stdName = SC.stdName
INNER JOIN clubtbl C ON SC.clubName = C.clubName
ORDER BY C.clubName;

---아우터조인(외부조인)-------------------------------
SELECT S.stdName, S.addr, C.clubName, C.roomNo
FROM stdtbl S
LEFT OUTER JOIN stdclubtbl SC ON S.stdName = SC.stdName
LEFT OUTER JOIN clubtbl C ON SC.clubName = C.clubName
UNION
SELECT S.stdName, S.addr, C.clubName, C.roomNo
FROM stdtbl S
LEFT OUTER JOIN stdclubtbl SC ON SC.stdName = S.stdName
RIGHT OUTER JOIN clubtbl C ON SC.clubName = C.clubName;

-----크로스 조인(카티션곱)---------------------------------------
USE sqldb;
SELECT * FROM buytbl
CROSS JOIN usertbl;

-----셀프조인----------------------------------------------------
USE sqldb;
CREATE TABLE emptbl (emp CHAR(3), manager CHAR(3), empTel VARCHAR(8) );

INSERT INTO emptbl VALUES ('나사장', NULL, '0000');
INSERT INTO emptbl VALUES ('김재무', '나사장', '2222');
INSERT INTO emptbl VALUES ('김부장', '김재무', '2222-1');
INSERT INTO emptbl VALUES ('이부장', '김재무', '2222-2');
INSERT INTO emptbl VALUES ('우대리', '이부장', '2222-2-1');
INSERT INTO emptbl VALUES ('지사원', '이부장', '2222-2-2');
INSERT INTO emptbl VALUES ('이영업', '나사장', '1111');
INSERT INTO emptbl VALUES ('한과장', '이영업', '1111-1');
INSERT INTO emptbl VALUES ('최정보', '나사장', '3333');
INSERT INTO emptbl VALUES ('윤차장', '최정보', '3333-1');
INSERT INTO emptbl VALUES ('이주임', '윤차장', '3333-1-1');

SELECT A.emp AS '부하직원', B.emp AS '직속상관', B.empTel AS '직속상관연락처'
FROM emptbl A
INNER JOIN emptbl B
ON A.manager = B.emp
WHERE A.emp = '우대리';

----UNION------------------------------------------------------------
USE sqldb;
SELECT stdName, addr FROM stdtbl
UNION
SELECT clubName, roomNo FROM clubtbl;

USE sqldb;
SELECT stdName, addr FROM stdtbl
UNION ALL 
SELECT clubName, roomNo FROM clubtbl;

-----NOT IN------------------------------------------------------------
USE sqldb;
SELECT userName, CONCAT(mobile1, mobile2) AS '전화번호' FROM usertbl
WHERE userName NOT IN ( SELECT userName FROM usertbl WHERE mobile1 IS NULL );

---IN------------------------------------------------------------------
USE sqldb;
SELECT userName, addr, CONCAT(mobile1, mobile2) AS '전화번호' FROM usertbl
WHERE userName IN ( SELECT userName FROM usertbl WHERE mobile1 IS NULL );

------------------------------------------------------------------------------
--------스토어드 프로시저-----------------------------------------------------
--------IF...ELSE...END IF----------------------------------------------------
DROP PROCEDURE IF EXISTS ifProc;
USE sqldb;
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

--------------------------------
USE employees;

DELIMITER $$
CREATE PROCEDURE ifProc2()
BEGIN
	DECLARE hireDATE DATE;
	DECLARE curDATE DATE;
	DECLARE days INT;

SELECT hire_date INTO hireDATE
	FROM employees.employees
	WHERE emp_no = 10001;
	
	SET curDATE = CURRENT_DATE();
	SET days = DATEDIFF(curDATE, hireDATE);
	
	IF (days/365) >= 5 THEN
		SELECT CONCAT('입사한지', days, '일이나 지났습니다. 축하합니다!');
	else
		SELECT '입사한지' + days + '일밖에 안되었네요. 열심히 일하세요.' ;
	END IF;
END $$
DELIMITER ;
	
CALL ifProc2();

-----------------------------------------
USE sqldb;
DELIMITER $$
CREATE PROCEDURE ifProc3()
BEGIN
	DECLARE POINT INT ;
	DECLARE credit CHAR(1);
	SET POINT = 77;
	
	IF POINT >= 90 then
		SET credit = 'A';
	ELSEIF POINT >= 80 then
		SET credit = 'B';
	ELSEIF POINT >= 70 then
		SET credit = 'C';
	ELSEIF POINT >= 60 then
		SET credit = 'D';
	else
		SET credit = 'F';
	END IF;
	SELECT CONCAT('취득점수==>', POINT), CONCAT('학점==>', credit);
END $$
DELIMITER ;

CALL ifProc3();

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

--------------WHILE-------------------------------------------------------------

USE sqldb;
DELIMITER $$
CREATE PROCEDURE whileProc()
BEGIN
	DECLARE i INT;
	DECLARE hap INT;
		SET i = 1;
		SET hap = 0;
		
	while (i <= 100) DO
		SET hap = hap + i;
		SET i = i+1;
	END while;
	
	SELECT hap;
END $$
DELIMITER ;

CALL whileProc(); 
----------------------------------
USE sqldb;
DELIMITER $$
CREATE PROCEDURE whileProc2()
BEGIN
	DECLARE i INT;
	DECLARE hap INT;
	SET i = 1;
	SET hap = 0;
	
	myWhile: while (i <= 100) DO
		IF (i%7 = 0) then
			SET i = i+1;
			ITERATE myWhile;
		END IF;
		
		SET hap = hap + i;
		
		IF (hap > 1000) then
			LEAVE myWhile;
		END IF;
			
		SET i = i + 1;
		
	END while;
			
	SELECT hap;
	
END $$
DELIMITER ;

CALL whileProc2();

-----------------------------------------------------------------------------------
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
---------------------------------------------------------------------------------
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
