USE sqldb;
CREATE TABLE `usertbl` (
`userID` CHAR(8) NOT NULL,
`userName` VARCHAR(10) NOT NULL,
`birthYear` INT(10) NOT NULL,
`addr` CHAR(2) NOT NULL,
`mobile1` CHAR(3) NULL DEFAULT NULL,
`mobile2` CHAR(8) NULL DEFAULT NULL,
`height` SMALLINT(5) NULL DEFAULT NULL,
`mDate` DATE NULL DEFAULT NULL,
PRIMARY KEY (`userID`) USING BTREE
);

INSERT INTO `usertbl` (`userID`,`userName`,`birthYear`,`addr`,`mobile1`,`mobile2`,`height`,`mDate`) VALUES ('KHD','강호동',1970,
'경북','011','22222222', 182,'2007-07-07');
INSERT INTO `usertbl` (`userID`,`userName`,`birthYear`,`addr`,`mobile1`,`mobile2`,`height`,`mDate`) VALUES ('KJD','김제동',1974,'경남',
NULL, NULL, 173, '2013-03-03');
INSERT INTO `usertbl` (`userID`,`userName`,`birthYear`,`addr`,`mobile1`,`mobile2`,`height`,`mDate`) VALUES ('KKJ','김국진',1965,'서울',
'019','33333333', 171, '2009-09-09');

INSERT INTO `usertbl` (`userID`,`userName`,`birthYear`,`addr`,`mobile1`,`mobile2`,`height`,`mDate`) VALUES ('KYM','김용만',1967,
'서울','010','44444444', 177, '2015-05-05');
INSERT INTO `usertbl` (`userID`,`userName`,`birthYear`,`addr`,`mobile1`,`mobile2`,`height`,`mDate`) VALUES ('LHJ','이휘재',1972,'경기',
'011','88888888', 180, '2006-04-04');
INSERT INTO `usertbl` (`userID`,`userName`,`birthYear`,`addr`,`mobile1`,`mobile2`,`height`,`mDate`) VALUES ('LKK','이경규',1960,'경남',
'018','99999999', 170, '2004-12-12');

INSERT INTO `usertbl` (`userID`,`userName`,`birthYear`,`addr`,`mobile1`,`mobile2`,`height`,`mDate`) VALUES ('NHS','남희석',1971,
'충남','016','66666666', 180, '2017-04-04');
INSERT INTO `usertbl` (`userID`,`userName`,`birthYear`,`addr`,`mobile1`,`mobile2`,`height`,`mDate`) VALUES ('PSH','박수홍',1970,
'서울','010','00000000', 183, '2012-05-05');
INSERT INTO `usertbl` (`userID`,`userName`,`birthYear`,`addr`,`mobile1`,`mobile2`,`height`,`mDate`) VALUES ('SDY','신동엽',1971,
'경기',NULL,NULL, 176, '2008-10-10');
INSERT INTO `usertbl` (`userID`,`userName`,`birthYear`,`addr`,`mobile1`,`mobile2`,`height`,`mDate`) VALUES ('YJS','유재석',1972,'서울',
'010','11111111', 178, '2008-08-08');


