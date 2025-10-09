-- With -> CTE
-- creates a temp table, which exists until the query execution, not in memory while running the task


use classicmodels;

with avg_amount (avgam) as (select avg(amount) from payments)
select * from payments, avg_amount
where amount > avg_amount.avgam;


-- if true, it gives all rows of customers
select * from customers, payments
where payments.amount = 120166.58;

select * from customers;

select * from payments
where amount > (select avg(amount) from payments);

select avg(amount) from payments;

select * from payments
where payments.amount = 120166.58;

select max(amount) from payments;



select city, count(city) from customers
group by city;