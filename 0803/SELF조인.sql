-----셀프조인----------------------------------------------------
USE sqldb;
CREATE TABLE emptbl (emp CHAR(3), manager CHAR(3), empTel VARCHAR(8) );

INSERT INTO emptbl VALUES ('나사장', NULL, '0000');
INSERT INTO emptbl VALUES ('김재무', '나사장', '2222');
INSERT INTO emptbl VALUES ('김부장', '김재무', '2222-1');
INSERT INTO emptbl VALUES ('이부장', '김재무', '2222-2');
INSERT INTO emptbl VALUES ('우대리', '이부장', '2222-2-1');
INSERT INTO emptbl VALUES ('지사원', '이부장', '2222-2-2');
INSERT INTO emptbl VALUES ('이영업', '나사장', '1111');
INSERT INTO emptbl VALUES ('한과장', '이영업', '1111-1');
INSERT INTO emptbl VALUES ('최정보', '나사장', '3333');
INSERT INTO emptbl VALUES ('윤차장', '최정보', '3333-1');
INSERT INTO emptbl VALUES ('이주임', '윤차장', '3333-1-1');

SELECT A.emp AS '부하직원', B.emp AS '직속상관', B.empTel AS '직속상관연락처'
FROM emptbl A
INNER JOIN emptbl B
ON A.manager = B.emp
WHERE A.emp = '우대리';