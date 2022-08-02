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