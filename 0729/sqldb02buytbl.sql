USE sqldb;
CREATE TABLE buytbl (
num INT(10) NOT NULL AUTO_INCREMENT,
userID CHAR(8) NOT NULL,
prodName CHAR(6) NOT NULL,
groupName CHAR(4) NULL DEFAULT NULL,
price INT(10) NOT NULL,
amount SMALLINT(5) NOT NULL,
PRIMARY KEY (num) USING BTREE,
INDEX userID (userID) USING BTREE,
CONSTRAINT `FK_buytbl_sqldb.usertbl` FOREIGN KEY (userID) REFERENCES
`sqldb`.`usertbl`(userID) ON UPDATE NO ACTION ON DELETE NO ACTION
)
AUTO_INCREMENT=1
;

INSERT INTO `buytbl`(`userID`,`prodName`,`groupName`,`price`,`amount`) VALUES ('KHD','운동화',NULL,480,2);
INSERT INTO `buytbl`(`userID`,`prodName`,`groupName`,`price`,`amount`) VALUES ('KHD','노트북','전자',16000,1);
INSERT INTO `buytbl`(`userID`,`prodName`,`groupName`,`price`,`amount`) VALUES ('KYM','모니터','전자',3200,1);
INSERT INTO `buytbl`(`userID`,`prodName`,`groupName`,`price`,`amount`) VALUES ('PSH','모니터','전자',3200,5);
INSERT INTO `buytbl`(`userID`,`prodName`,`groupName`,`price`,`amount`) VALUES ('KHD','청바지','의류',800,3);
INSERT INTO `buytbl`(`userID`,`prodName`,`groupName`,`price`,`amount`) VALUES ('PSH','메모리','전자',1280,10);
INSERT INTO `buytbl`(`userID`,`prodName`,`groupName`,`price`,`amount`) VALUES ('KJD','책','서적',240,5);
INSERT INTO `buytbl`(`userID`,`prodName`,`groupName`,`price`,`amount`) VALUES ('LHJ','책','서적',240,2);
INSERT INTO `buytbl`(`userID`,`prodName`,`groupName`,`price`,`amount`) VALUES ('LHJ','청바지','의류',800,1);
INSERT INTO `buytbl`(`userID`,`prodName`,`groupName`,`price`,`amount`) VALUES ('PSH','운동화',NULL,480,2);
INSERT INTO `buytbl`(`userID`,`prodName`,`groupName`,`price`,`amount`) VALUES ('LHJ','책','서적',240,1);
INSERT INTO `buytbl`(`userID`,`prodName`,`groupName`,`price`,`amount`) VALUES ('PSH','운동화',NULL,480,2);