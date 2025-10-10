-- w3 resources
-- Table Creation and Management - alter

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


select * from countries;

-- rename table
alter table countries
rename new_countries;

-- change data type of total_population by decimal
alter table new_countries
modify total_population decimal;

-- drop column
alter table new_countries
drop total_population;

-- change primary key column
alter table new_countries
drop primary key (country_id);

alter table new_countries
add primary key (country_name);

select * from new_countries;