-- Write a MySQL query to create a stored procedure that inserts a new employee into the Employees table.

create database sql_learning;

use sql_learning;
create table Employees (
						employee_id int auto_increment primary key,
                        employee_name varchar(100) not null,
                        department_id int not null,
                        salinsertemployeeary int not null default 10000);
                        
-- use delimeter for creating stored procedure, because many statements might have ; so to end the function we specify which delimeter

delimiter //

create procedure insertemployee(
								in p_name varchar(100),
                                in p_departmentid int,
                                in p_salary int)
Begin
insert into employees (employee_name, department_id, salary)
values (p_name, p_departmentid, p_salary);
End //

delimiter ;

call insertemployee ('Melroy', 1, 2500);


-- Write a MySQL query to create a stored procedure that updates an employee's salary.

delimiter //

create procedure updatesalary (
								in p_employeeid int,
                                in p_employeename varchar (100),
                                in p_salary int)

begin
update employees 
set salary = p_salary
where employee_id = p_employeeid and employee_name = p_employeename;
end //

delimiter ;



-- Write a MySQL query to create a stored procedure that updates an employee's salary. and create a log table with check function

create table employeesalarylogs (
								log_id int auto_increment not null primary key,
                                employee_id int not null,
                                log_status varchar(100) not null);
                                


delimiter //

create procedure updatesalary_log (
								in p_employeeid int,
                                in p_employeename varchar (100),
                                in p_salary int)

begin
declare update_status varchar(100);
update employees 
set salary = p_salary
where employee_id = p_employeeid and employee_name = p_employeename;
if row_count() = 0 then 
	set update_status = "Failed";
else
	set update_status = "Success";
end if;
insert into employeesalarylogs(employee_id, log_status)
values (p_employeeid, update_status);
end //

delimiter ;


-- Write a MySQL query to create a stored procedure that updates an employee's salary. and create a log table with check function and returns value out


-- log database
create table employeesalarylogs_out (
								log_id int auto_increment not null primary key,
                                employee_id int not null,
                                log_status varchar(100) not null,
                                log_val int);


-- fn(1) this function is used for updating the employee salary database
-- if the row is affected then it returns log status as success and 1 else failed and 0
-- we return the values outside the fucntion so, we can use it for updating log database


drop procedure if exists updatealarylog_out;

delimiter //

create procedure updatealarylog_out (
										p_employeeid int,
                                        p_employee_name varchar(100),
                                        p_salary int,
                                        out update_status varchar (100),
                                        out update_vals int) 
                                        
begin
update employees
set salary = p_salary
where employee_id = p_employeeid and employee_name = p_employee_name;

if row_count() = 0 then 
set update_status = "Failed", update_vals = 0;
else
set update_status = "Success", update_vals = 1;
end if;

end //

delimiter ;

-- fn(2) is used for updating the log database by taking input from the fn(1) values
-- fn(1) gives the 2 return values status and flag
-- we use these status and flag and emp_id to update log data
drop procedure if exists insertlogdataoutside;
delimiter //

create procedure insertlogdataoutside (
										p_empid int,
                                        p_logstatus varchar (100),
                                        p_logval int)
                                        
begin

insert into employeesalarylogs_out (employee_id, log_status, log_val)
values (p_empid, p_logstatus, p_logval);

end //

delimiter ;
										

-- since there are 2 return values, order of return defination should be same as variable set
-- out values
set @log_status = '';
set @log_val = 0;

-- input values
set @emp_id = 1;
set @emp_name = 'Melroy';
set @emp_salary = 58;

call updatealarylog_out(@emp_id, @emp_name, @emp_salary, @log_status, @log_val);

call insertlogdataoutside(@emp_id, @log_status, @log_val);


-- calling procedure inside the othe procedure and pass by values
-- create a employee table
-- create update employee salary stored procedure
-- create a log table to track all employee salary change
-- create a stored procedure update the log table
-- call the log function inside the update salary stored procedure


-- creating employee table
drop table if exists employees;
create table employees  (
							emp_id int auto_increment primary key,
                            emp_name varchar (100) not null,
                            emp_salary int default 1000);
                            
-- creating salary update log table
drop table if exists salarylog;
create table salarylog (
						log_id int auto_increment primary key,
                        emp_id int,
                        log_status varchar(100) not null,
                        log_val int);
                        
-- creating a log salary stored procedure

drop procedure if exists logsalary;

delimiter //

create procedure logsalary (
							in empid int,
                            in emplogstatus varchar (100),
                            in emplogval int,
                            out logcheck varchar (100))


begin

insert into salarylog (emp_id, log_status, log_val)
values (empid, emplogstatus, emplogval);

if row_count() = 0 then 
set logcheck = 'Failed';
else
set logcheck = 'Success';
end if;

end //

delimiter ; 

-- creating stored procedure to update the salary table in employee

drop procedure if exists updatesalary;

delimiter //

create procedure updatesalary (
								in p_empid int,
                                in p_salary int,
                                out update_log_bool varchar (100))

begin

declare log_status varchar(100);
declare log_val int;

update employees
set emp_salary = p_salary
where emp_id = p_empid;

if row_count() = 0 then 
set log_status = 'Failed', log_val = 0;
else
set log_status = 'Success', log_val = 1; 
end if;


call logsalary (p_empid, log_status, log_val, update_log_bool);

end //

delimiter ;


-- outside log message from log salary

set @checklog = '';
set @empid = 1;
set @empsalary = 1489;

call updatesalary (@empid, @empsalary, @checklog);

select @checklog as logresult;

select * from employees;

select * from salarylog;




select * from employees;
select * from employeesalarylogs;
select * from employeesalarylogs_out;

drop table employeesalarylogs;