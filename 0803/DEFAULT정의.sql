---------DEFAULT정의------------------------------------------------------------

DROP TABLE IF EXISTS usertbl;
CREATE TABLE usertbl (
	userID CHAR(8) NOT NULL PRIMARY KEY,
	userName VARCHAR(10) NOT NULL,
	birthYear INT NOT NULL DEFAULT -1,
	addr CHAR(2) NOT NULL DEFAULT '서울',
	mobile1 CHAR(3) NULL,
	mobile2 CHAR(8) NULL,
	height SMALLINT NULL DEFAULT 170,
	mDate DATE NULL
);