-----------------------------------피벗과 JSON----------------------------

USE sqldb;
CREATE TABLE pivotTest
(uName CHAR(3),
season CHAR(2),
amount INT
);

USE sqldb;
INSERT INTO pivotTest VALUES ('유재석', '겨울', 10);
INSERT INTO pivotTest VALUES ('강호동', '여름', 15);
INSERT INTO pivotTest VALUES ('유재석', '가을', 25);
INSERT INTO pivotTest VALUES ('유재석', '봄', 3);
INSERT INTO pivotTest VALUES ('유재석', '봄', 37);
INSERT INTO pivotTest VALUES ('강호동', '겨울', 40);
INSERT INTO pivotTest VALUES ('유재석', '여름', 14);
INSERT INTO pivotTest VALUES ('유재석', '겨울', 22);
INSERT INTO pivotTest VALUES ('강호동', '여름', 64);
SELECT * FROM pivotTest;

USE sqldb;
SELECT uName, SUM(CASE WHEN season='봄' THEN amount END) AS '봄',
SUM(CASE WHEN season='여름' THEN amount END) AS '여름',
SUM(CASE WHEN season='가을' THEN amount END) AS '가을',
SUM(CASE WHEN season='겨울' THEN amount END) AS '겨울'
FROM pivotTest
GROUP BY uName;

USE sqldb;
SELECT JSON_OBJECT('name', userName, 'height', height)
AS 'JSON 값'
FROM usertbl
WHERE height >= 180;

USE sqldb;
SET @JSON='{ "usertbl" :
[
{"name":"강호동", "height":182},
{"name":"이휘재", "height":180},
{"name":"남희석", "height":180},
{"name":"박수홍", "height":183}
]
}';

SELECT JSON_VALID(@JSON) AS JSON_VALID;
SELECT JSON_SEARCH(@JSON, 'one', '강호동') AS JSON_SEARCH;
SELECT JSON_SEARCH(@JSON, 'all', '180') AS JSON_SEARCH;

SELECT JSON_EXTRACT(@JSON, '$.usertbl[2].name') AS JSON_EXTRACT;
SELECT JSON_INSERT(@JSON, '$.usertbl[0].mDate', '2019-09-09') AS JSON_INSERT;
SELECT JSON_REPLACE(@JSON, '$.usertbl[0].name', '토마스') AS JSON_REPLACE;
SELECT JSON_REMOVE(@JSON, '$.usertbl[0]') AS JSON_REMOVE;

