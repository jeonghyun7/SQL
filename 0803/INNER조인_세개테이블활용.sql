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