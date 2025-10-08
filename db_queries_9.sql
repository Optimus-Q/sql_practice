-- self join
-- we join from different tables based on requirement
-- get all customers and employees who represent them
-- first take the tables customer and employees
-- use conditional to make the table
-- order by alphabets
-- now select the columns to show
-- execution from is from -> tables -> where -> order by --> select

use classicmodels;

select customerName, city, salesRepEmployeeNumber from customers;

select firstName, employeeNumber from employees;

select customers.customerName, customers.city, employees.firstName
from customers, employees
where customers.salesRepEmployeeNumber=employees.employeeNumber
order by customers.customerName asc;




select * from customers;
select * from employees;
select * from offices;