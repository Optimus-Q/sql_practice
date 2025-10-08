-- update

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


select * from sql_table_new;

update sql_table_new
set customerID=30, EmployeeID=10
where orderID=10309;

-- DELETE INDIVIDUAL RECORD
delete from sql_table_new 
where orderID=10308;


-- DELETE ALL RECORD
delete from sql_table_new;


