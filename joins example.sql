create database product;
use product;
create table salesman(
salesman_id int primary key,
name varchar(20),
city varchar(30),
commission decimal(10,2));
create table customer(
customer_id int primary key,
customer_name varchar(20),
city varchar(100),
salesman_id int ,
foreign key(salesman_id) references salesman(salesman_id));
insert into salesman values(1,'snega','chennai',100.00),(2,'soma','madurai',200.00),(3,'nanthini','chennai',400.00);
insert into customer values(101,"abi",'madurai',3),(102,"ragul",'covai',2),(103,'rishi','vellor',1),(104,"mani","chennai",2);
select * from customer;
select * from salesman;
select s.name as salesmanname ,c.customer_name as customername,s.city as city
from salesman s
inner join customer c
ON s.city=c.city;
-- query fetch from the table amount between 500 and 2000
create table  customer1(customer_id int primary key,
customer_name varchar(20),
city varchar(30),
grade int,
salesman_id int);
create table orders(ord_no int primary key,
purh_amt decimal(10,2),
ord_date date,
customer_id int,
salesman_id int,
foreign key(customer_id) references customer1(customer_id));
insert into customer1 values(101,'anbu','london',600,1000),
(102,'akila','chennai',700,1001),
(103,'hema','new york',300,1002),
(104,'nickitha','usa',200,1003),
(105,'praveen','paris',400,1004);
insert into orders values(11,150.0,'2025-02-12',103,1003),
(12,279.65,'2025-03-17',102,1006),
(13,550.0,'2025-01-22',101,1007),
(14,950.03,'2024-12-12',105,1004);
select* from customer1;
select* from orders;
select* from salesman;
select o.ord_no,o.purh_amt,c.customer_name,c.city 
from orders o
inner join customer1 c
on o.customer_id=c.customer_id where o.purh_amt between 500 and 2000;
select* from customer;
select c.customer_name as cname,
c.city as city,
s.name as sname,
s.commission as commission 
from customer c
inner join salesman s
ON c.salesman_id=s.salesman_id;
select c.customer_name as cname,
c.city as city,
s.name as sname,
s.commission as commission 
from customer c
inner join salesman s
ON c.salesman_id=s.salesman_id where commission> 200;
select c.customer_name as cname,
c.city as city,
s.name as sname,
s.city as scity,
s.commission as commission 
from customer c
inner join salesman s
where c.city <> s.city and s.commission> 200;
select *from salesman;
select *from orders;
select *from customer1;
select o.ord_no as orderno,o.ord_date as orderdate,
o.purh_amt as purchaseamount,c.customer_name as cname,
c.grade as grade,c.city as city from orders o inner join customer1 c on o.customer_id=c.customer_id order by ord_date;
select c.customer_name as cname, c.city as city, o.ord_no as ordernumber,o.ord_date as odate,o.purh_amt as pamount from customer1 c
left join orders o
on c.customer_id=o.customer_id order by o.purh_amt ;




