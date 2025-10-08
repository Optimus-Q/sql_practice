-- create database
create database sql_learning;


-- drop databse
drop database sql_learning;

-- No reaname database

-- creating table
use sql_learning;
create table sql_table_practice (persionID int,
								firstName varchar(40),
                                lastName varchar(50));
                                
-- drop table
use sql_learning;
drop table sql_table_practice;

-- rename table
use sql_learning;
rename table sql_table_practice to sql_table_new;

-- creating new table from existing table
use sql_learning;
create table sql_table_old as (select * from sql_table_new);


-- show table (new)
use sql_learning;
select * from sql_table_new;

-- alter table (remove column)
use sql_learning;
alter table sql_table_new
drop column lastName;

use sql_learning;
select * from sql_table_new;


-- add columns (with data type)
use sql_learning;
alter table sql_table_new
add column lastName varchar(50);

use sql_learning;
select * from sql_table_new;

-- modify column datatype
use sql_learning;
alter table sql_table_new
modify column persionID double;

use sql_learning;
select * from sql_table_new;

-- constraints
use  sql_learning;
alter table sql_table_new 
modify persionID int;

use sql_learning;
create table sql_constraint_table (persionID int not null,
									firstName varchar(30),
                                    lastName varchar(50));
                                    
use sql_learning;
select * from sql_constraint_table;