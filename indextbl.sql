CREATE TABLE indextbl (first_name VARCHAR(14), last_name VARCHAR(16), hire_date DATE);
INSERT INTO indextbl
	SELECT first_name, last_name, hire_date
	FROM employees.employees
	LIMIT 500;
SELECT *FROM indextbl;

CREATE INDEX idx_indextbl_firstname ON indextbl(first_name);

CREATE VIEW uv_membertbl AS SELECT memberName, memberAddress FROM membertbl;