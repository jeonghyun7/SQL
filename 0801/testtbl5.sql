USE sqldb;
CREATE TABLE testtbl5 (SELECT emp_no, first_name, last_name FROM employees.employees);

USE sqldb;
CREATE TABLE bigtbl1 (SELECT * FROM employees.employees);
CREATE TABLE bigtbl2 (SELECT * FROM employees.employees);
CREATE TABLE bigtbl3 (SELECT * FROM employees.employees);

DELETE FROM bigtbl1;
DROP TABLE bigtbl2;
TRUNCATE TABLE bigtbl3;