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