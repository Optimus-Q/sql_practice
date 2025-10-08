-- union and union all
-- combines results set from multiple table but gives output - distinct rows -> union
-- combines results set from multiple table but gives output - included all rows (with duplicates) -> union all

use classicmodels;


select customers.customerNumber
        from customers
union
select orders.customerNumber
        from orders;

select customers.customerNumber
        from customers
union all
select orders.customerNumber
        from orders;

-- best practice is to use having at aggregate level

select city from customers
Having city="Nantes";

-- exists
-- if there is a record of nantes, it returns true and shows all record, else it wont

select * from customers
where exists (select city from customers where city = "Nantes");

select * from customers
where exists (select city from customers where city = "Ntes");

select * from offices;
select * from customers;
select * from orders;