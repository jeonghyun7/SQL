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