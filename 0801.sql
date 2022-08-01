USE sqldb;
SELECT * FROM usertbl WHERE userName = '강호동';

SELECT * FROM usertbl WHERE height BETWEEN 177 AND 185;
SELECT * FROM usertbl WHERE addr IN('서울','경기') ORDER BY addr DESC;
SELECT * FROM usertbl WHERE userName LIKE '김%';

SELECT * FROM usertbl;
SELECT DISTINCT addr FROM usertbl;

SELECT * FROM `sqldb`.usertbl ORDER BY `userName` limit 2;

SELECT * FROM `sqldb`.usertbl ORDER BY `userName` DESC;

CREATE TABLE buytbl3 (SELECT userID, prodName FROM buytbl);
SELECT * FROM buytbl3;

SELECT * FROM buytbl;

SELECT userID, SUM(amount) FROM buytbl GROUP BY userID;

SELECT * FROM  buytbl;
SELECT userID AS '사용자 아이디', SUM(price*amount) AS '총 구매액' FROM buytbl GROUP BY userID;

SELECT userID AS '사용자 아이디', AVG(amount) AS '평균 구매 개수' FROM buytbl GROUP BY userID;

SELECT userName, height FROM usertbl WHERE height = (SELECT MAX(height) FROM usertbl) 
OR height = (SELECT MIN(height) FROM usertbl) ORDER BY height desc;

SELECT COUNT(mobile1) AS '휴대폰이 있는 사용자' FROM usertbl;

SELECT userID AS '사용자', SUM(price * amount) AS '총구매액'
FROM buytbl
GROUP BY userID
HAVING SUM(price*amount) > 3000
ORDER BY SUM(price*amount);

SELECT *FROM buytbl;

SELECT groupName, SUM(price * amount) AS '비용'
FROM buytbl
GROUP BY groupName
WITH ROLLUP;

USE sqldb;
DROP TABLE IF EXISTS last_insert_id_table;

CREATE TABLE `last_insert_id_table` (
`id` INT(11) NOT NULL AUTO_INCREMENT,
`col` VARCHAR(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=1 DEFAULT CHARSET=UTF8MB4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO last_insert_id_table(col)
VALUES ('1row'),('2row'),('3row');

SELECT LAST_INSERT_ID();
SELECT * FROM last_insert_id_table;

DROP TABLE if EXISTS `last_insert_id_tabletwo`;

CREATE TABLE `last_insert_id_tabletwo` (
`id` INT(11) NOT NULL AUTO_INCREMENT,
`col` VARCHAR(10) COLLATE UTF8MB4_UNICODE_CI DEFAULT NULL,
PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=1 DEFAULT CHARSET=UTF8MB4
COLLATE=UTF8MB4_UNICODE_CI;

INSERT INTO last_insert_id_tabletwo (col)
VALUES ('1row');
INSERT INTO last_insert_id_tabletwo (col)
VALUES ('2row');
INSERT INTO last_insert_id_tabletwo (col)
VALUES ('3row');

SELECT LAST_INSERT_ID();

USE sqldb;
CREATE TABLE testtbl5 (SELECT emp_no, first_name, last_name FROM employees.employees);

USE sqldb;
CREATE TABLE bigtbl1 (SELECT * FROM employees.employees);
CREATE TABLE bigtbl2 (SELECT * FROM employees.employees);
CREATE TABLE bigtbl3 (SELECT * FROM employees.employees);

DELETE FROM bigtbl1;
DROP TABLE bigtbl2;
TRUNCATE TABLE bigtbl3;


USE sqldb;
CREATE TABLE membertbl (SELECT userID, userName, addr FROM usertbl LIMIT 3);
ALTER TABLE membertbl
ADD CONSTRAINT pk_membertbl PRIMARY KEY (userID);

SELECT * FROM membertbl;

INSERT INTO membertbl VALUES ('KHD','강후덜','미국');
INSERT INTO membertbl VALUES ('LSM','이상민','서울');
INSERT INTO membertbl VALUES ('KSK','김성주','경기');

INSERT IGNORE INTO membertbl VALUES ('KHD','강후덜','미국');
INSERT IGNORE INTO membertbl VALUES ('LSM','이상민','서울');
INSERT IGNORE INTO membertbl VALUES ('KKK','김성주','일본');

INSERT INTO membertbl VALUES ('KHD','강후덜','미국')
ON DUPLICATE KEY UPDATE userName='강후덜', addr='미국' ;
INSERT INTO membertbl VALUES ('DJM','동짜몽','일본')
ON DUPLICATE KEY UPDATE userName='동짜몽', addr='일본';
SELECT * FROM membertbl;


WITH abc(userID, total)
AS
(SELECT userID, SUM(price*amount) FROM buytbl GROUP BY userID)
SELECT * FROM abc ORDER BY total DESC;

SELECT addr, MAX(height)
FROM usertbl
GROUP BY addr;

WITH cte_usertbl (addr, maxheight)
AS
(SELECT addr, MAX(height) FROM usertbl GROUP BY addr)
SELECT AVG(maxheight*1.0) AS '각 지역별 최고키의 평균' FROM cte_usertbl;


USE sqldb;

SET @myVar1 =5;
SET @myVar2 =3;
SET @myVar3 =4.25;
SET @myVar4 ='가수 이름 ==> ';
SELECT @myVar1;
SELECT @myVar2 + @myVar3 ;

SELECT @myVar4, userName FROM usertbl WHERE height > 180 ;


USE sqldb;
SET @myVar1 =3;
PREPARE myQuery
FROM 'select userName, height from usertbl order by height limit ?';
EXECUTE myQuery USING @myVar1;


USE sqldb;
SELECT CAST(AVG(amount) AS SIGNED INTEGER) AS '평균 구매 개수' FROM buytbl;

USE sqldb;
SELECT CONVERT (AVG(amount), SIGNED INTEGER) AS '평균 구매 개수' FROM buytbl;

SELECT CAST('2022$12$12' AS DATE);
SELECT CAST('2022/12/12' AS DATE);
SELECT CAST('2022%12%12' AS DATE);
SELECT CAST('2022@12@12' AS DATE);

USE sqldb;
SELECT num, CONCAT (CAST(price AS CHAR(10)), 'X',
CAST(amount AS CHAR(4)), '=') AS
'단가*수량',
price * amount AS '구매액'
FROM buytbl;

SELECT '100' + '200' ;
SELECT CONCAT('100','200');
SELECT CONCAT(100,'200');
SELECT 1 > '2mega';
SELECT 3 > '2MEGA';
SELECT 0 = 'mega2';




SELECT IF (100>200, '참이다', '거짓이다');
SELECT IFNULL (NULL, '널이군요'), IFNULL(100, '널이군요');
SELECT NULLIF (100, 100), NULLIF(200,100);

SELECT ASCII('A'), CHAR(65);
SELECT ASCII('a'), CHAR(97);

SELECT BIT_LENGTH('ABC'), CHAR_LENGTH('ABC'), LENGTH('ABC');
SELECT BIT_LENGTH('이정현'), CHAR_LENGTH('이정현'), LENGTH('이정현');

SELECT CONCAT_WS('♥','이','정','현');

SELECT FORMAT(123456.1234567,4);

SELECT INSTR('leejeonghyun','h');
SELECT LOCATE('h','leejeonghyun');

SELECT BIN(10), HEX(10), OCT(10);

SELECT INSERT ('leejunghyun',5, 2, 'eon');

SELECT LEFT ('leejeonghyun',3), RIGHT('leejeonghyun',9);
SELECT UPPER ('LeeJeongHyun'), LOWER ('LeeJeongHyun');