-- create a table

use sql_learning;
create table sql_table_new (
							orderID int primary key,
                            customerID int,
                            EmployeeID int,
                            ShipperID int,
                            Cost int,
                            constraint customerempID_rule unique(customerID, EmployeeID));

-- insert values for table
insert into sql_table_new
values (10308, 2, 7, 3, 50),
(10309, 37, 3, 1, 60),
(10310, 77, 8, 2, 90),
(10311, 37, 4, 1, 60);                            

-- filter the table
select * from sql_table_new
where orderID=10311;

select * from sql_table_new
where cost>40;

select * from sql_table_new
where customerID > 50 and cost>40 or EmployeeID > 4;

-- greater than 60
select * from sql_table_new
where not cost>60;

select * from sql_table_new;

-- not 60, but other
select * from sql_table_new
where cost <> 60;

-- between
select * from sql_table_new
where ShipperID between 2 and 3;

-- in
select * from sql_table_new
where orderID in (10310);

drop table sql_table_new;