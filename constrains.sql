create schema constrains;
use constrains;
create table employee(emp_id int primary key auto_increment,
ename varchar(30) not null,
job_desc varchar(40) default 'unassigned',
salary int,
pan varchar(30) unique ,
check (salary>50000) );
insert into employee(ename,salary) values('snega',60000);
select*from employee;
drop table employee;
create table branch1(branch_id int primary key auto_increment, branch_name varchar(30) not null,address varchar(30));
alter table branch modify column branch_id int  auto_increment;
create table employee1(emp_id int primary key auto_increment,
ename varchar(30) not null,
job_desc varchar(40),
salary int,
branch_id int,
constraint fk_branchid foreign key(branch_id) references branch(branch_id)
);
alter table employee drop foreign key fk_branchid;
select*from employee;
show index from employee;
-- index creation
create index name_index on employee(ename);
-- drop index
alter table employee add index(ename);
drop table branch;
show tables;
desc branch1;
desc employee1;
insert into branch1(branch_name, address) values('chennai','16 ABC ROAD'),
('chennai','120 5th block'),('mumbai','25xyz road'),('hydrabad','32 10th street');
insert into branch1(branch_name, address) values('MADURAI',' BOSE ROAD');
select*from branch1;
insert into employee1(ename,job_desc,salary,branch_id) values('snega','admin',20000,3),
('ragavi','engineer',20000,1),
('nanthini','admin',20000,3),
('venkatesh','developer',20000,2),
('raji','admin',20000,4),
('praveen','engineer',20000,2),
('pandi','data engineer',20000,NULL),
('mani','civilengineer',20000,NULL),
('koodu','network engineer',20000,NULL),
('soma','backenddeveloper',20000,1);
SELECT*FROM employee1;
SELECT*FROM BRANCH1;
-- inner join its fetch the value commonly (extact matching)
SELECT e.emp_id,e.ename,e.job_desc,b.branch_name from employee1 as e
INNER JOIN branch as b on e.branch_id=b.branch_id order by emp_id;
-- LEFT JOIN IS USED FOR EXTACH MATCHING AND LEFT REMAINING values ARE SHOW THE TABLE
SELECT e.emp_id,e.ename,e.job_desc,b.branch_name from employee1 as e
LEFT JOIN branch as b on e.branch_id=b.branch_id order by emp_id;
-- RIGHT JOIN IS USED FOR EXTACH MATCHING AND RIGHT REMAINING values ARE SHOW THE TABLE
SELECT e.emp_id,e.ename,e.job_desc,b.branch_name from employee1 as e
RIGHT JOIN branch1 as b on e.branch_id=b.branch_id;
-- USING WHERE TWO TABLE
SELECT employee1.emp_id,employee1.ename,employee1.job_desc, branch1.branch_name from employee1, branch1 
 where employee1.branch_id=branch1.branch_id;
 -- cross join2
SELECT employee1.emp_id,employee1.ename,employee1.job_desc, branch1.branch_name from employee1, branch1;
-- branch_name ename_count
SELECT  b.branch_name,count(e.emp_id)
 from branch1 as b
join employee1 as e
on  b.branch_id=e.branch_id group by e.branch_id ;
-- union is used for same row and same column if must to merge the table and same data type 
-- queries
select  b.branch_name ,e.ename from branch1 as b  
join employee1 as e on b.branch_id=e.branch_id having ename='chennai';
select*from employee1;
select*from branch1;



 


 