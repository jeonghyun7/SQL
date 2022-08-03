----UNION------------------------------------------------------------
USE sqldb;
SELECT stdName, addr FROM stdtbl
UNION
SELECT clubName, roomNo FROM clubtbl;

USE sqldb;
SELECT stdName, addr FROM stdtbl
UNION ALL 
SELECT clubName, roomNo FROM clubtbl;