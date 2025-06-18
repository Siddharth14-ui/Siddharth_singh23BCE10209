CREATE TABLE Worker (
	WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	FIRST_NAME CHAR(25),
	LAST_NAME CHAR(25),
	SALARY INT(15),
	JOINING_DATE DATETIME,
	DEPARTMENT CHAR(25)
);
use vit;
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
        
        select * from worker;
        delete from worker;
        delete from worker where department = 'account';
        
        truncate table worker;
        
        create database sid;
        drop database sid;
        use sid;
        create table cse(
        id int,
        name varchar(25));
        start transaction;
        insert into cse values(1001,'siddharth');
        savepoint a11;
        insert into cse values(1002,'Praveen');
        savepoint a12;
        delete from cse where id = 1002;
        
        select * from cse;
        
        rollback to a12;
        
        INSERT INTO Worker 
	(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
		(001, 'Monika', 'Arora', 100000, '2014-02-20 09:00:00', 'HR'),
		(002, 'Niharika', 'Verma', 80000, '2014-06-11 09:00:00', 'Admin'),
		(003, 'Vishal', 'Singhal', 300000, '2014-02-20 09:00:00', 'HR'),
		(004, 'Amitabh', 'Singh', 500000, '2014-02-20 09:00:00', 'Admin'),
		(005, 'Vivek', 'Bhati', 500000, '2014-06-11 09:00:00', 'Admin'),
		(006, 'Vipul', 'Diwan', 200000, '2014-06-11 09:00:00', 'Account'),
		(007, 'Satish', 'Kumar', 75000, '2014-01-20 09:00:00', 'Account'),
		(008, 'Geetika', 'Chauhan', 90000, '2014-04-11 09:00:00', 'Admin');

        select * from worker;
        select FIRST_NAME,DEPARTMENT from Worker  where SALARY >= 30000;
		select FIRST_NAME,DEPARTMENT from Worker  where SALARY >= 20000 and DEPARTMENT = 'HR';
        select FIRST_NAME,DEPARTMENT from Worker  where 10000 <= SALARY <= 30000 and DEPARTMENT = 'Admin' or DEPARTMENT = 'Account';
select * from worker where WORKER_ID in (001,002,003);
SELECT * FROM worker WHERE worker_id,%2 = 0 AND department IN ('Admin', 'HR') AND salary = (SELECT MAX(salary) FROM worker WHERE worker_id%2 = 0 AND department IN ('Admin', 'HR'));
        
	