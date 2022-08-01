USE sqldb;
SET @myVar1 =3;
PREPARE myQuery
FROM 'select userName, height from usertbl order by height limit ?';
EXECUTE myQuery USING @myVar1;