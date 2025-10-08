-- joins

-- create table for customers
use sql_learning;
create table customers (
						customer_id int auto_increment primary key,
                        customer_name varchar(100),
                        email varchar (100),
                        city varchar (50));
                        
-- insert values into customers table

insert into customers (customer_name, email, city)
values ('Alice Johnson', 'alice@example.com', 'New York'),
('Bob Smith', 'bob@example.com', 'Chicago'),
('Charlie Brown', 'charlie@example.com', 'Los Angeles'),
('Diana Prince', 'diana@example.com', 'Miami');

-- create table for products
create table products (
						product_id int auto_increment primary key,
                        product_name varchar(100),
                        category varchar(100),
                        price decimal (10, 2));
                        
-- insert values into products table
insert into products (product_name, category, price)
values ('Laptop', 'Electronics', 899.99),
('Headphones', 'Electronics', 199.99),
('Coffee Mug', 'Home', 9.99),
('Desk Chair', 'Furniture', 129.99);
      
      
-- create orders table
      
create table orders (
    order_id int auto_increment primary key,
    customer_id int,
    order_date date,
    foreign key (customer_id) references customers(customer_id)
);

-- insert values into orders table
insert into orders (customer_id, order_date) VALUES
(1, '2025-09-15'),
(2, '2025-09-20'),
(1, '2025-09-25'),
(3, '2025-09-28');
      
-- create table ordered items by customer
 CREATE TABLE order_items (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- insert values into ordered items table
INSERT INTO order_items (order_id, product_id, quantity) VALUES
(1, 1, 1),  -- Alice bought 1 Laptop
(1, 2, 2),  -- Alice bought 2 Headphones
(2, 3, 3),  -- Bob bought 3 Coffee Mugs
(3, 4, 1),  -- Alice bought 1 Desk Chair
(4, 2, 1);  -- Charlie bought 1 Headphone     
      

-- customer and order table innner join
-- first it takes customer table as base table and joins with orders table, later we select the columns to show
-- order of execution from -> inner join --> on--> select

select customers.customer_name, customers.email, orders.order_id, orders.order_date
from customers
inner join orders on customers.customer_id=orders.order_id;

select customers.customer_name, customers.email, orders.order_id, orders.order_date
from customers
inner join orders on customers.customer_id=orders.order_id
where orders.order_id>3;

-- left join
-- all records from left and matched record from right
-- left join product and customer
--  as long as values are same it will return

select customers.customer_name, customers.email, products.product_name, products.price, products.category
from products
left join customers on products.product_id = customers.customer_id;

-- right join
-- all records from right and matched record from left
-- right join product and customer
--  as long as values are same it will return

select customers.customer_name, customers.email, products.product_name, products.price, products.category
from products
right join customers on products.product_id = customers.customer_id;


select * from customers;
select * from products;
select * from orders;
select * from order_items;

-- drop all tables
drop table customers;
drop table products;
drop table orders;
drop table order_items;