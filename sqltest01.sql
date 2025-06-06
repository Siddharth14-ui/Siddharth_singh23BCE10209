CREATE DATABASE ORG123;
SHOW DATABASES;
USE ORG123;

CREATE TABLE Worker (
	WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	FIRST_NAME CHAR(25),
	LAST_NAME CHAR(25),
	SALARY INT(15),
	JOINING_DATE DATETIME,
	DEPARTMENT CHAR(25)
);

INSERT INTO Worker 
	(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
		(001, 'Monika', 'Arora', 100000, '14-02-20 09.00.00', 'HR'),
		(002, 'Niharika', 'Verma', 80000, '14-06-11 09.00.00', 'Admin'),
		(003, 'Vishal', 'Singhal', 300000, '14-02-20 09.00.00', 'HR'),
		(004, 'Amitabh', 'Singh', 500000, '14-02-20 09.00.00', 'Admin'),
		(005, 'Vivek', 'Bhati', 500000, '14-06-11 09.00.00', 'Admin'),
		(006, 'Vipul', 'Diwan', 200000, '14-06-11 09.00.00', 'Account'),
		(007, 'Satish', 'Kumar', 75000, '14-01-20 09.00.00', 'Account'),
		(008, 'Geetika', 'Chauhan', 90000, '14-04-11 09.00.00', 'Admin');

CREATE TABLE Bonus (
	WORKER_REF_ID INT,
	BONUS_AMOUNT INT(10),
	BONUS_DATE DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO Bonus 
	(WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
		(001, 5000, '16-02-20'),
		(002, 3000, '16-06-11'),
		(003, 4000, '16-02-20'),
		(001, 4500, '16-02-20'),
		(002, 3500, '16-06-11');
CREATE TABLE Title (
	WORKER_REF_ID INT,
	WORKER_TITLE CHAR(25),
	AFFECTED_FROM DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO Title 
	(WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
 (001, 'Manager', '2016-02-20 00:00:00'),
 (002, 'Executive', '2016-06-11 00:00:00'),
 (008, 'Executive', '2016-06-11 00:00:00'),
 (005, 'Manager', '2016-06-11 00:00:00'),
 (004, 'Asst. Manager', '2016-06-11 00:00:00'),
 (007, 'Executive', '2016-06-11 00:00:00'),
 (006, 'Lead', '2016-06-11 00:00:00'),
 (003, 'Lead', '2016-06-11 00:00:00');
show tables;
-- QUESTION 01
select distinct department from worker;

-- QUESTION 02
select * from worker
order by FIRST_NAME asc, DEPARTMENT desc;

-- QUESTION 03
select * from worker
where FIRST_NAME like'%a%'; 

-- QUESTION 04
select * from worker
where FIRST_NAME like'_____h';

-- QUESTION 05
select * from worker
where SALARY between 100000 and 500000;

-- QUESTION 06
select * from worker
where JOINING_DATE = '2014-02-20 09:00:00';

-- QUESTION 07
SELECT COUNT(FIRST_NAME) 
FROM Worker 
WHERE Department = 'Admin';

-- QUESTION 08
select FIRST_NAME 
from worker
where 50000 <=SALARY<=100000;

-- QUESTION 09
select department, count(FIRST_NAME)
from worker
group by department
order by count(FIRST_NAME) desc;

-- QUESTION 10
select WORKER_REF_ID from Title
where worker_title = 'manager';

-- QUESTION 11
SELECT MIN(salary)
FROM Worker
WHERE salary > (SELECT MIN(salary)from worker);

-- QUESTION 12
select first_name from worker
WHERE salary IN (
    SELECT salary
    FROM Worker
    GROUP BY salary
    HAVING COUNT(*) > 1
);

-- QUESTION 13
SELECT MAX(salary)
FROM Worker
WHERE salary < (SELECT MAX(salary) FROM Worker);

-- QUESTION 14
select*from WORKER 
union all
select*from WORKEr;

-- QUESTION 15
select * from worker
limit 4;

-- QUESTION 16
SELECT department
FROM Worker
GROUP BY department
HAVING COUNT(department)  <3;

-- QUESTION 17
SELECT department, COUNT(FIRST_NAME) 
FROM Worker
GROUP BY department;

-- QUESTION 19
SELECT FIRST_NAME
FROM Worker w1
WHERE SALARY = (
    SELECT MAX(SALARY)
    FROM Worker w2
    WHERE w2.DEPARTMENT = w1.DEPARTMENT
    limit 1
);


-- QUESTION 20
SELECT DISTINCT salary
FROM worker
ORDER BY salary DESC
LIMIT 3;

-- QUESTION 21

SELECT FIRST_NAME
FROM Worker
WHERE DEPARTMENT IN ('Account', 'Admin')
  AND SALARY = (
    SELECT MIN(SALARY)
    FROM Worker
    WHERE DEPARTMENT = Worker.DEPARTMENT);









