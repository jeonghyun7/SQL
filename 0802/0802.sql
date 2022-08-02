-----------------------------------------------------------------------------
--------------내장함수02-----------------------------------------------------

SELECT LPAD('eunhee', 10, 'kang'), RPAD('kang', 10, 'eunhee');
SELECT LPAD('eunhee', 8, 'kang'), RPAD('kang', 7, 'eunhee');

SELECT LTRIM('  hyun  '), RTRIM('  hyun  ');
SELECT TRIM('  hyun  ');

SELECT repeat('hyun  ', 2);
SELECT REPLACE('lee jeonghyun', 'hyun', 'hun');
SELECT REVERSE('hyun');

SELECT SPACE(7);
SELECT SUBSTRING('leejeonghyun', 4, 9);
SELECT SUBSTRING_INDEX('leejeonghyun', 'e', 2);

SELECT ABS(-5), SIN(5), COS(5), TAN(5);

SELECT CEILING(3.5), FLOOR(3.5), ROUND(3.5);

SELECT CONV(10, 10, 2);
SELECT CONV(10, 2, 10);

SELECT MOD(5, 2);
SELECT 5 % 2 ;
SELECT 5 MOD 2;

SELECT POW(2,4), SQRT(25);

SELECT FLOOR(1 + (RAND() * (10-1) ));
SELECT FLOOR(7 + (RAND() * (10-7) ));

SELECT SIGN(-3);
SELECT SIGN(10);

SELECT TRUNCATE(12345.25689, 2);
SELECT TRUNCATE(12345.25689, -2);

SELECT ADDDATE('2022-01-01', INTERVAL 31 DAY),
ADDDATE('2022-01-01', INTERVAL 1 MONTH);
SELECT SUBDATE('2022-01-01', INTERVAL 31 DAY),
SUBDATE('2022-01-01', INTERVAL 1 MONTH);

SELECT ADDTIME('2022-01-01 23:59:59', '1:1:1'),
ADDTIME ('15:00:00','2:10:10');
SELECT SUBTIME('2022-01-01 23:59:59', '1:1:1'),
SUBTIME('15:00:00', '2:10:10');

SELECT CURDATE(), CURTIME(), NOW(), SYSDATE();

SELECT YEAR('2022-08-02'),
MONTH('2022-08-02'),
DAY('2022-08-02'),
HOUR('02:17:00'),
MINUTE('02:17:00'),
SECOND('02:17:14');

SELECT DATE(NOW()), TIME(NOW());

SELECT DATEDIFF('2023-01-01', NOW()),
TIMEDIFF('23:23:59', '12:11:10');

SELECT DAYOFWEEK(CURDATE()),
MONTHNAME(CURDATE()),
DAYOFYEAR(CURDATE());

SELECT LAST_DAY('2022-08-02');

SELECT MAKEDATE(2022, 80);

SELECT MAKETIME(12, 11, 10);

SELECT PERIOD_ADD(202208, 04),
PERIOD_DIFF(202208, 199411);

SELECT QUARTER('2022-08-02');

SELECT TIME_TO_SEC('12:11:10');

SELECT CURRENT_USER(), DATABASE();

USE sqldb;
SELECT * FROM usertbl;
SELECT FOUND_ROWS();

USE sqldb;
UPDATE buytbl SET
price = price * 2;
SELECT ROW_COUNT();

SELECT SLEEP(5);
SELECT '짠~~ 5초가 지나서 제가 보여요';


----------------------------------------------------------------------------
----------------------윈도우함수와 함께 사용되는 집계함수-------------------

USE sqldb;
SELECT AVG(amount) AS '평균 구매 개수' FROM buytbl;

USE sqldb;
SELECT userID, AVG(amount) AS '평균 구매 개수' FROM buytbl
GROUP BY userID;

USE sqldb;
SELECT userName, MAX(height), MIN(height) FROM usertbl;

USE sqldb;
SELECT userName, MAX(height), MIN(height)
FROM usertbl GROUP BY userName;

USE sqldb;
SELECT userName, height
FROM usertbl
WHERE height = (SELECT MAX(height) FROM usertbl)
OR height = (SELECT MIN(height) FROM usertbl);

USE sqldb;
SELECT COUNT(*) FROM usertbl;

USE sqldb;
SELECT COUNT(mobile1) AS '휴대폰이 있는 사용자'
FROM usertbl;

USE sqldb;
SELECT userID AS '사용자', SUM(price * amount) AS '총구매액'
FROM buytbl
GROUP BY userID;

USE sqldb;
SELECT userID AS '사용자', SUM(price * amount) AS '총구매액'
FROM buytbl
GROUP BY userID
HAVING SUM(price * amount) > 2400;

USE sqldb;
SELECT userID AS '사용자', SUM(price * amount) AS '총구매액'
FROM buytbl
GROUP BY userID
HAVING SUM(price * amount) > 2400
ORDER BY SUM(price * amount);

USE sqldb;
SELECT num, groupName, SUM(price * amount) AS '비용'
FROM buytbl
GROUP BY groupName, num WITH ROLLUP;

USE sqldb;
SELECT groupName, SUM(price * amount) AS '비용'
FROM buytbl
GROUP BY groupName WITH ROLLUP;

USE sqldb;
SELECT userID, groupName, SUM(price * amount) AS '비용'
FROM buytbl
GROUP BY userID, groupName WITH ROLLUP;

------------------------------------------------비집계함수 부분 시작
--------------------------------------순위함수-----------------------

USE sqldb;
SELECT ROW_NUMBER() OVER(
ORDER BY height DESC)
'키큰순위', userName, addr, height
FROM usertbl;

USE sqldb;
SELECT ROW_NUMBER () OVER(
ORDER BY height DESC,
userName ASC) '키큰순위', userName, addr, height
FROM usertbl;

USE sqldb;
SELECT addr, ROW_NUMBER() OVER(PARTITION BY addr
ORDER BY height DESC, userName ASC) '지역별 키큰순위',
userName, height
FROM usertbl;

USE sqldb;
SELECT DENSE_RANK() OVER(ORDER BY height DESC) '키큰순위', userName, addr, height
FROM usertbl;

USE sqldb;
SELECT RANK() OVER(ORDER BY height DESC) '키큰순위', userName, addr, height
FROM usertbl;

USE sqldb;
SELECT NTILE(3) OVER(ORDER BY height DESC) '반번호', userName, addr, height
FROM usertbl;

--------------------------------------------분석함수---------------------------

USE sqldb;
SELECT userName, addr, height AS '키',
height - (LEAD(height,1) OVER (ORDER BY height DESC)) 
AS '다음 사람과 키 차이'
FROM usertbl;

USE sqldb;
SELECT addr, userName, height AS '키',
height - (FIRST_VALUE(height) OVER (PARTITION BY addr 
ORDER BY height DESC)) AS '지역별 최대키와 차이'
FROM usertbl;

USE sqldb;
SELECT addr, userName, height AS '키',
(CUME_DIST() OVER (PARTITION BY addr ORDER BY height DESC)) * 100 AS
'누적인원 백분율%'
FROM usertbl;

--------------------------------------------------------------------------
--------------------------------------------------------------------------
-----------------------------------피벗과 JSON----------------------------

USE sqldb;
CREATE TABLE pivotTest
(uName CHAR(3),
season CHAR(2),
amount INT
);

USE sqldb;
INSERT INTO pivotTest VALUES ('유재석', '겨울', 10);
INSERT INTO pivotTest VALUES ('강호동', '여름', 15);
INSERT INTO pivotTest VALUES ('유재석', '가을', 25);
INSERT INTO pivotTest VALUES ('유재석', '봄', 3);
INSERT INTO pivotTest VALUES ('유재석', '봄', 37);
INSERT INTO pivotTest VALUES ('강호동', '겨울', 40);
INSERT INTO pivotTest VALUES ('유재석', '여름', 14);
INSERT INTO pivotTest VALUES ('유재석', '겨울', 22);
INSERT INTO pivotTest VALUES ('강호동', '여름', 64);
SELECT * FROM pivotTest;

USE sqldb;
SELECT uName, SUM(CASE WHEN season='봄' THEN amount END) AS '봄',
SUM(CASE WHEN season='여름' THEN amount END) AS '여름',
SUM(CASE WHEN season='가을' THEN amount END) AS '가을',
SUM(CASE WHEN season='겨울' THEN amount END) AS '겨울'
FROM pivotTest
GROUP BY uName;

USE sqldb;
SELECT JSON_OBJECT('name', userName, 'height', height)
AS 'JSON 값'
FROM usertbl
WHERE height >= 180;

USE sqldb;
SET @JSON='{ "usertbl" :
[
{"name":"강호동", "height":182},
{"name":"이휘재", "height":180},
{"name":"남희석", "height":180},
{"name":"박수홍", "height":183}
]
}';

SELECT JSON_VALID(@JSON) AS JSON_VALID;
SELECT JSON_SEARCH(@JSON, 'one', '강호동') AS JSON_SEARCH;
SELECT JSON_SEARCH(@JSON, 'all', '180') AS JSON_SEARCH;

SELECT JSON_EXTRACT(@JSON, '$.usertbl[2].name') AS JSON_EXTRACT;
SELECT JSON_INSERT(@JSON, '$.usertbl[0].mDate', '2019-09-09') AS JSON_INSERT;
SELECT JSON_REPLACE(@JSON, '$.usertbl[0].name', '토마스') AS JSON_REPLACE;
SELECT JSON_REMOVE(@JSON, '$.usertbl[0]') AS JSON_REMOVE;


------------------------------------------------------------------------------
---------------------------------조인-----------------------------------------
----------------이너조인------------------------------------------------------

USE sqldb;
SELECT  U.userID, U.userName, B.prodName, U.addr, CONCAT(U.mobile1,
U.mobile2) AS '연락처'
FROM usertbl U
INNER JOIN buytbl B ON U.userID = B.userID
ORDER BY U.userID;

USE sqldb;
SELECT  *
FROM usertbl U
INNER JOIN buytbl B ON U.userID = B.userID
ORDER BY U.userID;

----------중복제거-------------------------
USE sqldb;
SELECT DISTINCT U.userID, U.userName, U.addr
FROM usertbl U
INNER JOIN buytbl B ON U.userID = B.userID
ORDER BY U.userID;

USE sqldb;
SELECT U.userID, U.userName, U.addr
FROM usertbl U
WHERE EXISTS (
SELECT *
FROM buytbl B
WHERE U.userID = B.userID);

--------------------------------------------------------------------
-------------이너 조인 실습----세 개 테이블의 조인------------------

USE sqldb;
CREATE TABLE stdtbl
( stdName VARCHAR(10) NOT NULL PRIMARY KEY,
addr CHAR(4) NOT NULL
);
CREATE TABLE clubtbl
( clubName VARCHAR(10) NOT NULL PRIMARY KEY,
roomNo CHAR(4) NOT NULL
);
CREATE TABLE stdclubtbl
( num INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
stdName VARCHAR(10) NOT NULL,
clubName VARCHAR(10) NOT NULL,
FOREIGN KEY(stdName) REFERENCES stdtbl(stdName),
FOREIGN KEY(clubName) REFERENCES clubtbl(clubName)
);

INSERT INTO stdtbl VALUES ('강호동', '경북'), ('김제동', '경남'),
('김용만', '서울'), ('이휘재', '경기'), ('박수홍', '서울');
INSERT INTO clubtbl VALUES ('수영', '101호'), ('바둑', '102호'),
('축구', '103호'), ('봉사', '104호');
INSERT INTO stdclubtbl VALUES (NULL, '강호동', '바둑'), (NULL,
'강호동', '축구'), (NULL, '김용만', '축구'), (NULL, '이휘재', '축구'),
(NULL, '이휘재', '봉사'), (NULL, '박수홍', '봉사');