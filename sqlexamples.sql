use sqlexample;
create schema sqlexample;
drop schema if exists sqlexample;
show tables;
create table studentdetails(id int primary key, name varchar(30),gpa decimal(3,2));
desc studentdetails;
insert into studentdetails values(1,'snega',7.6);
insert into studentdetails values(2,'soma',8.5);
insert into studentdetails values(3,'ragul',6.6);
select*from studentdetails;
insert into studentdetails values(4,'manimegalai',8.9),(5,'pandimuthu',7.8);
insert into studentdetails values(6,'nanthini',null),(7,'priya',null);
select id ,name from studentdetails;
use sqlexample;
create table employee(emp_id int primary key,ename varchar(30),job_desc varchar(40), salary int);
INSERT INTO employee (emp_id, ename, job_desc, salary) VALUES
(1, 'Arun Kumar', 'Software Engineer', 60000),
(2, 'Meera Nair', 'Project Manager', 75000),
(3, 'Ravi Shankar', 'Data Analyst', 58000),
(4, 'Priya Ramesh', 'HR Manager', 67000),
(5, 'Hari Krishnan', 'Software Engineer', 62000),
(6, 'Shanthi Rajan', 'Network Engineer', 64000),
(7, 'Divya Iyer', 'Accountant', 55000),
(8, 'Vignesh Subramanian', 'Software Developer', 68000),
(9, 'Lakshmi Narayanan', 'Cybersecurity Analyst', 70000),
(10, 'Ajay Menon', 'UX Designer', 60000),
(11, 'Sowmya Reddy', 'Marketing Manager', 72000),
(12, 'Gautham Raj', 'Sales Executive', 50000),
(13, 'Madhavi Srinivas', 'Business Analyst', 71000),
(14, 'Suresh Kumar', 'Cloud Engineer', 77000),
(15, 'Ananya Ramesh', 'Data Scientist', 80000),
(16, 'Balaji Prasad', 'Technical Support', 48000),
(17, 'Kavitha Chandran', 'Software Engineer', 65000),
(18, 'Naveen Kumar', 'DevOps Engineer', 75000),
(19, 'Rahul Mohan', 'Database Administrator' ,73000),
(20, 'Sneha Venkat', 'AI Engineer', 85000);
select*from employee limit 10;
select*from employee;
SELECT * FROM employee WHERE emp_id BETWEEN 15 AND 20;
select*from employee where job_desc='software engineer';
select*from employee where salary >70000 or job_desc="ai engineer";
select*from employee where job_desc in('java developer','Database Administrator');
select*from employee where job_desc  not in('software engineer','Database Administrator');
select*from employee where ename like 'A%';
select*from employee where ename like 'A%A';
select*from employee where ename  NOT like 'A%';
select*from employee where ename like'a__n%';
select*from employee where ename like '__z%';
select*from employee where ename like '__i%';
update  employee set job_desc='java developer' where emp_id=19;
update employee set ename="snega" where emp_id=19;
update employee set job_desc='javadeveloper' where job_desc='software engineer';
select *from employee where job_desc="javadeveloper";
update  employee set job_desc='javadeveloper' where emp_id=19;
select count(ename) as empcount, job_desc from employee group by job_desc;
delete from employee where emp_id=12;
/*distinct allow only unique*/
select distinct job_desc from employee order by job_desc asc ;
select*from employee order by emp_id desc;
select*from employee order by emp_id asc;
/*custom order creation*/
select *from employee order by(case job_desc
when 'project manager' then 1
when 'hr manager' then 2
when 'javadeveloper' then 3
else 100 end),ename;
/* functions* this also know as aggreate function*/
select count(*) totalrow from employee;
select count(*) numberofjavadevelopers from employee where job_desc='software engineer';
select avg(salary) average from employee where job_desc='javadeveloper';
select sum(salary) average from employee where job_desc='javadeveloper';
SELECT MAX(salary)  AS AVERAGE FROM employee;
SELECT MIN(salary)  AS AVERAGE FROM employee;
-- Strings
SELECT ENAME ,SALARY FROM EMPLOYEE;
SELECT ucase(ENAME) AS NAME ,SALARY FROM EMPLOYEE; -- ALIAS NAME
SELECT ENAME AS NAME, char_length(ename) AS charcount FROM EMPLOYEE;
select ename as name ,concat('RS.',SALARY) AS SALARY FROM EMPLOYEE;
select ename as name ,concat('RS.', FORMAT(SALARY,2)) AS SALARY FROM EMPLOYEE;
SELECT ENAME,LEFT(JOB_DESC,3) FROM EMPLOYEE;
-- DATE
alter TABLE EMPLOYEE ADD column HIRE_DATE DATE;
SELECT*FROM EMPLOYEE;
UPDATE employee SET HIRE_DATE='2025-07-08' ;
UPDATE employee SET HIRE_DATE='2025-07-09'  where JOB_DESC='JAVADEVELOPER';
SELECT NOW(); -- CURRENT DATE IS DISPLAYED
SELECT curdate();
SELECT DATE(NOW());
-- date format
SELECT date_format(curdate(),'%d/%m/%Y') AS DATE;
-- DATE DIFFERENCE
SELECT datediff(curdate(),"2025-03-31") as endofmonths;
-- date add
select curdate()+interval 2 week;
select curdate()+interval 14 day;
 select curdate()+interval 31 day;
select curdate()+interval 1 day;
select date_add(curdate(),interval 1 day) as afteroneday;
select date_add(curdate(),interval 1 year) as afteroneyear;
select curdate() as 'startdate', 
date_add(curdate(),interval 1 day) as 'afteroneday', 
date_add(curdate(),interval 1 week) as 'oneweek later',
date_add(curdate(),interval 1 month) as 'onemonth later',
date_add(curdate(),interval 1 year) as 'oneyear later';
select*from employee order by job_desc;
select job_desc ,count(emp_id) from employee group by job_desc having count(emp_id)>2 order by job_desc;
--  where filter the rows
-- having filter the group by























































