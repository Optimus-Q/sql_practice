-- w3 resources
-- Table Creation and Management
use sql_learning;

-- 1. Write a MySQL query to create a simple table countries including columns country_id, country_name and region_id.
create table countries (
                        country_id int auto_increment primary key,
                        country_name varchar(50),
                        region_id int);
                        
-- 2. Write a MySQL query to create a simple table countries including columns country_id, country_name and region_id which is already exists.
create table if not exists countries (
                        country_id int auto_increment primary key,
                        country_name varchar(50) not null,
                        region_id int);   
                        
 -- 3. Write a MySQL query to create the structure of a table dup_countries similar to countries.
 -- like will copy the structure 
 create table if not exists dup_countries
 like countries;
 
 -- 4. Write a MySQL query to create a duplicate copy of countries table including structure and data by name dup_countries.
  -- like will copy the structure, this copies everythinng column and rows
 create table if not exists dup_countries_all
 as select * from countries;
 
 -- Creating a table named 'jobs' if it doesn't already exist to store information about job positions
-- 5. Write a MySQL query to create a table named jobs including columns job_id, job_title, min_salary, max_salary and check whether the max_salary amount exceeding the upper limit 25000.
create table if not exists countries (
                        country_id int auto_increment primary key,
                        country_name varchar(50) not null,
                        region_id int,
                        total_population int,
                        check(total_population <= 10000));
                        
create table if not exists countries (
                        country_id int auto_increment primary key,
                        country_name varchar(50) not null,
                        region_id int,
                        total_population int,
                        check(total_population <= 10000),
                        check(region_id is not null));
 
 -- 7. Write a MySQL query to create a table named countries including columns country_id, country_name and region_id and make sure that no countries except Italy, India and China will be entered in the table.
 create table if not exists countries (
                        country_id int auto_increment primary key,
                        country_name varchar(100) not null,
                        region_id int,
                        total_population int,
                        check(total_population <= 10000),
                        check(region_id is not null),
                        check (country_name in ('India', 'Australia', 'UK'))); -- CHECK constraint to ensure that the country name is limited to 'India', 'Australia', 'UK'
 
 
 create table if not exists countries (
                        country_id int auto_increment primary key,
                        country_name varchar(100) not null,
                        region_id int,
                        total_population int,
                        check(total_population <= 10000),
                        check(region_id is not null),
                        check (country_name in ('India', 'Australia', 'UK')), -- CHECK constraint to ensure that the country name is limited to 'India', 'Australia', 'UK'
                        constraint unq unique(country_name)); -- unq makes a referencing to use it while creating unq, it holds the reference
 
 
 -- creating the default values
 create table if not exists countries_default (
                        country_id int auto_increment primary key,
                        country_name varchar(100) not null default "IND",
                        region_id int,
                        total_population int,
                        check(total_population <= 10000),
                        check(region_id is not null),
                        check (country_name in ('India', 'Australia', 'UK')), -- CHECK constraint to ensure that the country name is limited to 'India', 'Australia', 'UK'
                        constraint unq unique(country_name) -- unq makes a referencing to use it while creating unq, it holds the reference
                        );
 
 
 select * from countries_default;