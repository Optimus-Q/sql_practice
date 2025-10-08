/*You are provided with a table named Products containing information about various products, including their names and prices. 
Write a SQL query to count number of products in each category based on its price into three categories below. 
Display the output in descending order of no of products.


1- "Low Price" for products with a price less than 100
2- "Medium Price" for products with a price between 100 and 500 (inclusive)
3- "High Price" for products with a price greater than 500.
Tables: Products
+--------------+-------------+
| COLUMN_NAME  | DATA_TYPE   |
+--------------+-------------+
| product_id   | int         |
| product_name | varchar(20) |
| price        | int         |
+--------------+-------------+*/

SET SQL_SAFE_UPDATES = 0;

-- creating table
create table products (
						product_id int,
                        product_name varchar(60),
                        price int,
                        categoryproduct varchar(60),
                        constraint tablepk primary key(product_id));

-- inserting values
insert into products 
values (1, "Laptop", 800, " "),
(2, "Smartphone", 600, " "),
(3, "Headphones", 50, " "),
(4, "Tablet", 400, " "),
(5, "Keyboard", 30, " "),
(6, "Mouse", 15, " "),
(7, "Monitor", 350, " "),
(8, "Printer", 120, " "),
(9, "USB Drive", 10, " "),
(10, "External HDD", 150, " "),
(11, "wireless router", 80, " "),
(12, "bluetooth", 70, " "),
(13, "webcam", 45, " "),
(14, "microphone", 25, " "),
(15, "gaming mouse", 50, " ");

select * from products;

 /* -- create a column as categoryproducts
alter table products
add column categoryproducts varchar(50);*/

-- setting each value of col to row val as per condition
update products
set categoryproduct="Low Price"
where price < 100;

update products
set categoryproduct="Medium Price"
where price between 100 and 501;

update products
set categoryproduct="High Price"
where price > 500;

select categoryproduct, count(categoryproduct) as countproduct from products
group by categoryproduct
order by countproduct desc;







