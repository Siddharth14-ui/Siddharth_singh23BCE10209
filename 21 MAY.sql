use vit;
SHOW tableS;
DESCRIBE Worker;
SELECT * FROM Worker
WHERE SALARY BETWEEN 100000 AND 400000;
select min(salary) from worker;
select max(salary) from worker;
SELECT COUNT(*) AS account_count
FROM Worker
WHERE DEPARTMENT = 'Account';
SELECT AVG(SALARY) AS average_salary
FROM Worker;
SELECT SUM(SALARY) AS total_salary
FROM Worker;
CREATE TABLE Worker1 (
	WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	FIRST_NAME CHAR(25),
	LAST_NAME CHAR(25),
	SALARY INT(15),
	JOINING_DATE DATETIME,
	DEPARTMENT CHAR(25)
);

INSERT INTO Worker1 
	(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
	(1, 'Monika', 'Arora', 100000, '2014-02-20 09:00:00', 'HR'),
	(2, 'Niharika', 'Verma', 80000, '2014-06-11 09:00:00', 'Admin'),
	(3, 'Vishal', 'Singhal', 300000, '2014-02-20 09:00:00', 'HR'),
	(4, 'Amitabh', 'Singh', 500000, '2014-02-20 09:00:00', 'Admin'),
	(5, 'Vivek', 'Bhati', 500000, '2014-06-11 09:00:00', 'Admin'),
	(6, 'Vipul', 'Diwan', 200000, '2014-06-11 09:00:00', 'Account'),
	(7, 'Satish', 'Kumar', 75000, '2014-01-20 09:00:00', 'Account'),
	(8, 'Geetika', 'Chauhan', 90000, '2014-04-11 09:00:00', 'Admin');
select distinct(department) from worker;

select department from worker
union all
select department from worker1;
select * from worker;
select first_name,salary,
case
    WHEN salary >= 300000 THEN 'Rich People'
WHEN salary < 300000 && salary>=100000 THEN 'Middle Layer'
When salary >10000 && salary <100000 Then 'Poor People'
ELSE 'Data Not Found'
END
AS Status_Check_BasedSalary
FROM worker;
use vit;
select * from worker where salary <= 200000 order by salary  desc;

select * from worker where first_name like '%a_a';

