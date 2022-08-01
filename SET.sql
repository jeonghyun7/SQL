USE sqldb;

SET @myVar1 =5;
SET @myVar2 =3;
SET @myVar3 =4.25;
SET @myVar4 ='가수 이름 ==> ';
SELECT @myVar1;
SELECT @myVar2 + @myVar3 ;

SELECT @myVar4, userName FROM usertbl WHERE height > 180 ;