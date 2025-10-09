-- date and time

/*
DATE - format YYYY-MM-DD
DATETIME - format: YYYY-MM-DD HH:MI:SS
TIMESTAMP - format: YYYY-MM-DD HH:MI:SS
YEAR - format YYYY or YY*/

create database sql_learning;

use sql_learning;

create table meetup (
					event_id int auto_increment primary key,
                    event_name varchar(100),
                    event_date date not null);
 
 insert into meetup (event_name, event_date)
 values ("Figh club", "2021-01-01"),
 ("UFC", "2022-01-10"),
 ("WWE", "2023-02-01"),
 ("MA", "2024-11-18");
 
select * from meetup
where event_date > "2021-01-01";

-- year
select event_id, event_name, event_date, year(event_date) as years from meetup;

-- month
select event_id, event_name, event_date, month(event_date) as months from meetup;

-- sub date
select event_id, event_name, event_date, subdate(event_date, 5) as newdate from meetup;

--  quarter
select event_id, event_name, event_date, quarter(event_date) as Q from meetup;


                    