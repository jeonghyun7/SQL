
------테이블압축-------------------------

CREATE DATABASE if NOT EXISTS compressdb;
USE compressdb;
CREATE TABLE normaltbl ( emp_no INT, first_name VARCHAR(14));
CREATE TABLE compresstbl ( emp_no INT, first_name VARCHAR(14)) ROW_FORMAT=COMPRESSED;

INSERT INTO normaltbl
		SELECT emp_no, first_name FROM employees.employees;
INSERT INTO compresstbl
		SELECT emp_no, first_name FROM employees.employees;
		
SHOW TABLE STATUS FROM compressdb;

USE mysql;
DROP DATABASE if EXISTS compressdb;

-----------------------------------

------임시 테이블------------------

USE employees;
CREATE TEMPORARY TABLE if NOT EXISTS temptbl (id INT, NAME CHAR(7));
CREATE TEMPORARY TABLE if NOT EXISTS employees (id INT, NAME CHAR(7));
DESCRIBE temptbl;
DESCRIBE employees;

INSERT INTO temptbl VALUES (1, 'This');
INSERT INTO employees VALUES (2, 'MariaDB');
SELECT * FROM temptbl;
SELECT * FROM employees;

USE employees;
SELECT * FROM temptbl;
SELECT * FROM employees;

DROP TABLE temptbl;

USE employees;
SELECT * FROM employees;

-----테이블 수정 alter문-----------------------

USE tabledb;
ALTER TABLE usertbl
ADD homepage VARCHAR(30)
DEFAULT 'http://www.hanbit.co.kr'
NULL;

ALTER TABLE usertbl
DROP COLUMN homepage;

ALTER TABLE usertbl
CHANGE COLUMN NAME uName VARCHAR(20) NULL ;

ALTER TABLE usertbl
MODIFY COLUMN uName VARCHAR(20) NOT NULL;

ALTER TABLE usertbl
DROP PRIMARY KEY;