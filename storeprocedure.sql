create schema procedures;
use procedures;
create table branchdetails(branch_id int primary key auto_increment,branch_name varchar(30) not null,address varchar(30) );
create table employeedetails(emp_id int primary key auto_increment,
ename varchar(30) not null,
job_desc varchar(40),
salary int,
branch_id int,
constraint fk_branchid foreign key (branch_id) references branchdetails(branch_id));
insert into branchdetails(branch_name, address) values('chennai','16 ABC ROAD'),
('chennai','120 5th block'),('mumbai','25xyz road'),('hydrabad','32 10th street');
insert into branchdetails(branch_name, address) values('MADURAI',' BOSE ROAD');
insert into employeedetails(ename,job_desc,salary,branch_id) values('snega','admin',20000,3),
('ragavi','engineer',20000,1),
('nanthini','admin',40000,3),
('venkatesh','developer',60000,2),
('raji','admin',70000,4),
('praveen','engineer',30000,2),
('pandi','data engineer',50000,NULL),
('mani','civilengineer',20000,NULL),
('koodu','network engineer',80000,NULL),
('soma','backenddeveloper',70000,1);
select*from employeedetails;
DELIMITER @@
CREATE PROCEDURE GETEMPLOYEEDETAILS()
BEGIN
SELECT*FROM EMPLOYEEDETAILS;
END @@
DELIMITER ;
call getemployeedetails();
-- NORMAL COUNT METHOD
select count(emp_id)  as totalemployees from employeedetails;
-- STOREPROCEDURE METHOD
DELIMITER //
CREATE PROCEDURE EMPLOYEECOUNT1()
BEGIN
DECLARE TOTAL INT DEFAULT 0;
SELECT COUNT(EMP_ID) INTO TOTAL FROM EMPLOYEEDETAILS;
SELECT TOTAL;
END //
DELIMITER ;
CALL EMPLOYEECOUNT1();
/*Parameter in store procedure
IN
OUT
INOUT
*/
DELIMITER $$
-- USING IN PARAMETER 
CREATE PROCEDURE INPUTEMPLOYEE(
IN J_DESC VARCHAR(30))
BEGIN
DECLARE TOTAL INT DEFAULT 0;
SELECT COUNT(EMP_ID) INTO TOTAL FROM EMPLOYEEDETAILS WHERE JOB_DESC=J_DESC;
SELECT TOTAL;
END $$
DELIMITER ;
CALL INPUTEMPLOYEE('ADMIN');
CALL INPUTEMPLOYEE('BACKENDDEVELOPER');
-- out parameter
DELIMITER @@
CREATE PROCEDURE OUTEMPLOYEE(IN J_DESC VARCHAR(30),
OUT TOTAL INT)
BEGIN
SELECT COUNT(EMP_ID) INTO TOTAL FROM EMPLOYEEDETAILS
WHERE JOB_DESC=J_DESC;
END @@
DELIMITER ;
set @total=10;
CALL OUTEMPLOYEE('ENGINEER',@total);
select @total;
select*from branchdetails;
-- loop
DELIMITER @@
create procedure getvalue1()
begin
   declare i int;
   declare str varchar(30);
   set i=1;
   set str='';
looplabel:loop
   if i>10 then -- if condition used then
	leave looplabel; -- leave used for break
   end if;
     set str=concat(str,i,' ');
	 set i=i+1;
end loop;
select str;
end @@
delimiter ;
call getvalue1();
-- while loop
DELIMITER @@
create procedure getvalue3()
begin
   declare i int;
   declare str varchar(30);
   set i=1;
   set str='';
   while i<10 do -- do keyword is used for while
     set str=concat(str,i,' ');
	 set i=i+1;
end while;
select str;
end @@
delimiter ;
call getvalue3();
-- functions
select*from employeedetails;
select ename,job_desc from employeedetails;
select*from branchdetails;
select e.ename,b.branch_id,b.address from employeedetails
as e join branchdetails as b on e.branch_id=b.branch_id order by e.branch_id;
select ename,getbranchadd(branch_id) from employeedetails;
delimiter $$
create function getbranchadd(id int) 
returns varchar(30)
deterministic
begin
declare fulladdress varchar(30);
select concat(address,'',branch_name ) into fulladdress
from branchdetails
where branch_id =id;
return fulladdress;
end $$
delimiter ;
show function status;
-- function and store procedure difference function call query inside but storeprocedure not call query inside 
-- error handling
drop procedure if exists insertbranch;
delimiter @@
create procedure insertbranch(in b_id int,
in b_name varchar(40),in b_address varchar(30))
begin
    declare continue handler for 1062
begin
select concat('duplicate key',id, 'cannot insert into branch table');
end;
insert into branchdetails values( b_id,b_name,b_address ); 
select*from branchdetails;
end @@
delimiter ;
call insertbranch(1,'mumbai','25xyz road');
select*from branchdetails;
-- cursor








