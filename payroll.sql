-- UC1 : creating a database

create database payroll_service;
show databases;

-- UC2 ability to create employee payroll table

use payroll_service;
drop table employee_payroll_table  ;
create table employee_payroll_table(
id int unsigned not null auto_increment,
 name varchar(255) not null, 
 salary double, 
 start date not null, 
 primary key (id));
 desc employee_payroll_table;
 
 -- UC3 inserting the data into table
 
 insert into employee_payroll_table (
 name, 
 salary, 
 start
 ) VALUES 
 ('Dibyesh', 50000000, '2021-11-12'),
 ('gyanesh', 1500000.00, '2017-07-11'), 
 ('Abhay', 2800000.00, '2004-03-21');
 
 -- UC4 display all data
 
 select * from employee_payroll_table;

-- UC5  getting salary of a particular employee
select Salary from employee_payroll_table where EmployeeName ='gyanesh';
select * from employee_payroll_table where Start  between cast('2017-07-11' as Date ) AND DATE(NOW()) ;

## UC 6 ability to add gender in the existing table columns
alter table employee_payroll_table add gender char(1) after salary;
update employee_payroll_table set gender = 'M' where name ='Dibyesh' or name ='gyanesh';
update employee_payroll_table set gender = 'M' where name = 'Abhay';
select * from employee_payroll_table;

-- UC 7 
#UC7 - Find Sum Avg Min Max and Count from table
insert into employee_payroll_table (
 name, 
 salary,
 gender,
 start
 ) VALUES 
 ('lucy', 150000000,'F', '2020-11-12'),
 ('terisa', 1500000.00,'F', '2018-07-11'), 
 ('nita', 2800000.00,'F', '2004-03-21');


select sum(Salary) from employee_payroll_table where Gender = 'F' group by Gender;
select sum(Salary) from employee_payroll_table where Gender = 'M' group by Gender;

select avg(Salary) from employee_payroll_table where Gender = 'F' group by Gender;
select avg(Salary) from employee_payroll_table where Gender = 'M' group by Gender;

select min(Salary) from employee_payroll_table where Gender = 'F' group by Gender;
select min(Salary) from employee_payroll_table where Gender = 'M' group by Gender;

select max(Salary) from employee_payroll_table where Gender = 'F' group by Gender;
select max(Salary) from employee_payroll_table where Gender = 'M' group by Gender;

select count(Salary) from employee_payroll_table where Gender = 'F' group by Gender;
select count(Salary) from employee_payroll_table where Gender = 'M' group by Gender;

-- UC 8
create table emp_info AS
select name 
from employee_payroll_table;
show tables;
CREATE TABLE employee_info(
    phone double NOT NULL,
    address varchar(255) default 'mahararstra',
    departent varchar(255) not null,
	employee_id int unsigned, 
    primary key (phone)
   );
   drop table employee_info;
 insert into employee_info (
 phone, 
 address,
 departent,
 employee_id
 ) VALUES 
 (112211111,'up','it',1 ),
 (11444441,'mp','it',2), 
 (11244411,'maharastra','it',3),
 (11444111,'up','it',4),
 (1122122111,'up','it',5 ),
 (11221144411,'up','it',6);  
 
 alter table employee_info ADD FOREIGN KEY (employee_id) references employee_payroll_table (id);
select * from  employee_info; 
