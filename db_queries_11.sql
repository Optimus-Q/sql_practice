-- Window function, rank, dense rank, row number, lead and lag

use classicmodels;

-- group by 
select productLine, max(quantityInStock) as max_stock from products
group by productLine
order by max_stock desc;

-- window fn
-- without partition, it takes whole record as one window, else it takes each category as window
select pl.*,
max(quantityInStock) over(partition by productLine) as maxstock_by_PL from products as pl
order by maxstock_by_PL;

-- row number, window fucntion and subquery, and take first 2
select * from (
			select pl.*, row_number() over (partition by productLine order by quantityInStock desc) as rn from products as pl
			) as highstock
where highstock.rn<3;

-- rank, window function and subquery
-- 2 multiple values has same value will assign same rank (ex: 2, 2), but next rank would be +1 (ex: 4)
select * from (
select pl.*, rank() over (partition by productLine order by quantityInStock desc) as rnk from products as pl
) as sub_table
where sub_table.rnk < 3;

-- dense rank, window function and subquery
-- 2 multiple values has same value will assign same rank (ex: 2, 2), but next rank would be 3, unlike rank method, it wont skip
select * from (
select pl.*, dense_rank() over (partition by productLine order by quantityInStock desc) as rnk from products as pl
) as sub_table
where sub_table.rnk < 3;

/* The main difference between row_number, rank, and dense rank is;
let's say we have two rwo's of same value
30
20
20
then during row number it will assign as
1
2
3
during rank it will assign as
1
2
2
any next number will have 4
during dense rank it will assign as
1
2
2
any new number will have 3, it wont skip the number

*/

select * from (
	select pl.*, 
	row_number() over (partition by productLine order by quantityInStock desc) as rn,
	rank() over (partition by productLine order by quantityInStock desc) as rnk,
	dense_rank() over (partition by productLine order by quantityInStock desc) as dns_rnk
	from products as pl
			) as highstock;


select pl. * from products as pl;

select * from products as pl
where pl.quantityInStock>1000;

select max(quantityInStock) from products;
