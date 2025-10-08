-- aggregate methods

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

select min(cost) from sql_table_new;

select max(cost) from sql_table_new;

select avg(cost) from sql_table_new;

select sum(cost) from sql_table_new;

select count(orderID) from sql_table_new;

select * from sql_table_new;

-- subquery
select * from sql_table_new
where cost > (select min(cost) from sql_table_new);


drop table sql_table_new;