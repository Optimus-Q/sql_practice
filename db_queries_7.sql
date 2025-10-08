-- limit, top

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


-- top 1
select * from sql_table_new
where cost > 50
limit 1;

-- top 1, max
select * from sql_table_new
order by cost desc
limit 1;


drop table sql_table_new;