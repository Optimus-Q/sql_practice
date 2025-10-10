-- w3 resources
-- Table Creation and Management - insert

use sql_learning;
create table countries (
						country_id int auto_increment primary key,
                        country_name varchar(50) not null,   -- we can also put unique here, so two constraint together
                        total_population int not null,
                        constraint unique(country_name),
						check (total_population > 0));
  
insert into countries (country_name, total_population) values
("india", 3000000),
("china", 40000000),
("sri lanka", 1000000);

-- copy other table
create table if not exists dup_countries
as select * from countries;

-- create empty table of countries table structure
create table if not exists dup_struct_countries
like countries;

-- insert values from countries to here
insert into dup_struct_countries
select * from countries;


-- create table 
create table new_countries (
						country_id int auto_increment primary key,
                        country_name varchar(50) not null,   -- we can also put unique here, so two constraint together
                        total_population int not null,
                        total_animals int,
                        constraint unique(country_name),
						check (total_population > 0));


insert into new_countries (country_name, total_population, total_animals) values
("india", 3000000, 12),
("china", 40000000, 13),
("sri lanka", 1000000, 14);

-- creating a column in the countries and passing values from new countries to total animals
-- we can do self join on country id and bring that column here

with addding_data_cte as (
	select c.country_id, c.country_name, c.total_population, n.total_animals
	from countries c, new_countries n
	where c.country_id = n.country_id)


select * from addding_data_cte;