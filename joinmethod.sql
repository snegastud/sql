create database joinmethods;
use joinmethods;
create table branch(branch_id int primary key auto_increment, branch_name varchar(30),address varchar(30));
create table employee(emp_id int primary key auto_increment,ename varchar(30) not null,job_desc varchar(30), salary int ,branch_id int ,constraint fk_branchid FOREIGN KEY (branch_id) References branch(branch_id));
insert into branch value(101,'chennai','1/2 sivagangai');
insert into branch value(102,'bangalore','22/7madurai');      
insert into branch value(103,'trichy','gandhi street ');  
insert into branch value(104,'salem','7 nehur street');    
insert into branch value(105,'theni',''); 
insert into branch value(106,'madurai',''); 
insert into branch value(107,'delhi','');          
insert into employee value(101,'snega','software developer',20000,103);   
insert into employee value(102,'soma','civil engineer',40000,101); 
insert into employee value(103,'naveen','ui/ux desinger',60000,102); 
insert into employee value(104,'praveen','softer testing',70000,104); 
insert into employee value(105,'venkatesh','data scientist',20000,101); 
insert into employee value(106,'raji','aws engineer',30000,104); 
insert into employee value(107,'ragul','deveops engineer',40000,103);       
insert into employee value(108,'ragavi','support engineer',30000,null);    
insert into employee value(109,'raja','TECHINCAL SUPPORT engineer',70000,null);  
select*from branch;    
select*from employee;
select employee.emp_id,employee.ename,employee.job_desc ,branch.branch_name
 from employee join branch on employee.branch_id=branch.branch_id order by EMP_ID asc;   
 select employee.emp_id,employee.ename,employee.job_desc ,branch.branch_name
 from employee left join branch on employee.branch_id=branch.branch_id ;  
 select*from employee where branch_id is NULL;
 select employee.emp_id,employee.ename,employee.job_desc ,branch.branch_name
 from employee cross join branch;
  select employee.emp_id,employee.ename,employee.job_desc ,branch.branch_name
 from employee right join branch on employee.branch_id=branch.branch_id ; 
 select b.branch_name, count(e.emp_id) from branch as b join employee as e on b.branch_id=e.branch_id group by e.branch_id;
 
 

 