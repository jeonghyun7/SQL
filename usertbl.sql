USE sqldb;
SELECT * FROM usertbl WHERE userName = '강호동';

SELECT * FROM usertbl WHERE height BETWEEN 177 AND 185;
SELECT * FROM usertbl WHERE addr IN('서울','경기') ORDER BY addr DESC;
SELECT * FROM usertbl WHERE userName LIKE '김%';

SELECT * FROM usertbl;
SELECT DISTINCT addr FROM usertbl;

SELECT * FROM `sqldb`.usertbl ORDER BY `userName` limit 2;

SELECT * FROM `sqldb`.usertbl ORDER BY `userName` DESC;