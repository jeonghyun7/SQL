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
