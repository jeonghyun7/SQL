--------CHECK 제약 조건---------------------------------------------------------
DROP TABLE IF EXISTS usertbl;
CREATE TABLE usertbl (
	userID CHAR(8) PRIMARY KEY,
	userName VARCHAR(10) ,
	birthYear INT CHECK (birthYear >= 1900 AND birthYear <= 2020),
	mobile1 CHAR(3) NULL,
	CONSTRAINT CK_name CHECK (userName IS NOT NULL)
);

----휴대폰 국번 체크----
ALTER TABLE usertbl
ADD CONSTRAINT CK_mobile1
CHECK (mobile1 IN ('010','011','016','017','018','019')) ;
