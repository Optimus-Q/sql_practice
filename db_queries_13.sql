-- case

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

select EmployeeID, ShipperID, customerID,
case
	when customerID=37 then 0
    when customerID < 3 then -1
    else 1
end as customerID_tag from sql_table_new;

-- drop
drop table sql_table_new;
drop database sql_learning;
