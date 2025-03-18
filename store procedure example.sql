create database studentsdetails;
use studentsdetails;
create  table students(reg_no int primary key,
 name varchar(20),
 total_marks  int,
 num_of_subject int ,
 percentage decimal(10,2));
 insert into students values(1,'snega',377,5,0.0);
insert into students values(2,'nanthini',400,5,0.0);
desc students;
select*from students;
 drop procedure studentsdetailsupdate;
 //update procedure
delimiter @@
create procedure studentsdetailsupdate(
IN R_NO INT,
IN N_NAME VARCHAR(30),
IN T_MARKS INT,
NUM_OF_SUB INT)
begin
update  STUDENTS set Name=N_NAME,
 TOTAL_MARKS= T_MARKS,
 NUM_OF_SUBJECT=NUM_OF_SUB,
 PERCENTAGE=(T_MARKS/(NUM_OF_SUB*100))*100 where REG_NO=R_NO;
 END @@
 delimiter ;
 select*from students;
-- retrive  the data from the table using prodecure
delimiter $$
create procedure retrivestudentsdetails(
IN R_no INT -- input parameter
)
BEGIN
select name,total_marks,num_of_subject,percentage from students where reg_no=R_no;
end $$
delimiter ;
call retrivestudentsdetails(2);
-- insert values into store procedure
delimiter //
create procedure insertstudentsdetails(
IN R_NO INT,
IN N_NAME VARCHAR(30),
IN T_TOTAL INT,
IN NUM_OF_SUB INT,
IN PER INT)
BEGIN
INSERT INTO STUDENTS (REG_NO,NAME,TOTAL_MARKS,NUM_OF_SUBJECT,PERCENTAGE) 
VALUES( R_NO,N_NAME,T_TOTAL,NUM_OF_SUB,PER );
END //
delimiter ;
select*from students;
DELIMITER //
CREATE PROCEDURE DeleteStudent(
    IN reg_no1 INT      -- DELETE THE STUDENTS DETAILS
)
BEGIN
    DELETE FROM students WHERE reg_no = reg_no1;
END //
DELIMITER ;
CALL DeleteStudent(1);
 
 