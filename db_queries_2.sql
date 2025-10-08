use sql_learning;
select persionID, firstName, lastName from sql_table_old;

-- insert into values
insert into sql_table_old
values (1, "Melroy", "Pereira"),
(2, "elroy", "ereira"),
(3, "lroy", "reira");

select * from sql_table_old;

insert into sql_table_old
values (5, "y", "ra"),
(5, "p", "a");

-- distinct is applied via row and not column
select distinct(persionID), firstName, lastName  from sql_table_old;

-- primary key, not null, unique, foreign key are constraints
create table sql_constraint_table (
									persionID int primary key,
                                    firstName varchar(12),
                                    lastName varchar(20),
                                    address varchar(50),
                                    constraint tableconstraint unique(firstName, lastName, address));
                                                                        
insert into sql_constraint_table 
values (1, "Melroy", "Pereira", "Adelaide"),
(2, "Frank", "Pereira", "Melbourne"),
(3, "Rithesh", "Frank", "UK"),
(4, "Melroy", "Pereira", "Melbourne"),
(5, "Melroy", "Melroy", "Melroy");

select * from sql_constraint_table;                               
                                    
drop table sql_constraint_table;
 
drop table sql_table_old;



