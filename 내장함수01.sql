SELECT IF (100>200, '참이다', '거짓이다');
SELECT IFNULL (NULL, '널이군요'), IFNULL(100, '널이군요');
SELECT NULLIF (100, 100), NULLIF(200,100);

SELECT ASCII('A'), CHAR(65);
SELECT ASCII('a'), CHAR(97);

SELECT BIT_LENGTH('ABC'), CHAR_LENGTH('ABC'), LENGTH('ABC');
SELECT BIT_LENGTH('이정현'), CHAR_LENGTH('이정현'), LENGTH('이정현');

SELECT CONCAT_WS('♥','이','정','현');

SELECT FORMAT(123456.1234567,4);

SELECT INSTR('leejeonghyun','h');
SELECT LOCATE('h','leejeonghyun');

SELECT BIN(10), HEX(10), OCT(10);

SELECT INSERT ('leejunghyun',5, 2, 'eon');

SELECT LEFT ('leejeonghyun',3), RIGHT('leejeonghyun',9);
SELECT UPPER ('LeeJeongHyun'), LOWER ('LeeJeongHyun');