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
