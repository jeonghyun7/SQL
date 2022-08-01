USE sqldb;
CREATE TABLE membertbl (SELECT userID, userName, addr FROM usertbl LIMIT 3);
ALTER TABLE membertbl
ADD CONSTRAINT pk_membertbl PRIMARY KEY (userID);

SELECT * FROM membertbl;

INSERT INTO membertbl VALUES ('KHD','강후덜','미국');
INSERT INTO membertbl VALUES ('LSM','이상민','서울');
INSERT INTO membertbl VALUES ('KSK','김성주','경기');

INSERT IGNORE INTO membertbl VALUES ('KHD','강후덜','미국');
INSERT IGNORE INTO membertbl VALUES ('LSM','이상민','서울');
INSERT IGNORE INTO membertbl VALUES ('KKK','김성주','일본');

INSERT INTO membertbl VALUES ('KHD','강후덜','미국')
ON DUPLICATE KEY UPDATE userName='강후덜', addr='미국' ;
INSERT INTO membertbl VALUES ('DJM','동짜몽','일본')
ON DUPLICATE KEY UPDATE userName='동짜몽', addr='일본';
SELECT * FROM membertbl;