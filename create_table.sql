-- creating table and our database

use sqllearn
create table sql_table (personId int,
						lastname varchar(50),
						firstname varchar(100),
						address varchar(255));



-- creating another table from existing table

use sqllearn
create table sql_new_table as 
select * from sql_table;