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