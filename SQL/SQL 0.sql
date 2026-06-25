CREATE DATABASE join_demo;

USE join_demo;

-- TABLE 1 

CREATE TABLE customers(
customer_id INT PRIMARY KEY,
customer_name VARCHAR(100),
city VARCHAR(100)
);

-- TABLE 2 

CREATE TABLE orders(
order_id INT PRIMARY KEY,
customer_id INT,
product VARCHAR(100),
amount INT,
FOREIGN KEY (customer_id) REFERENCES customers (customer_id)
);


-- INSERT DATA INTO CUSTOMERS
-- ===============================

INSERT INTO customers values
(1,'Rahul','Delhi'),
(2,'Aisha','Mumbai'),
(3,'Harsh','Hyderabad'),
(4,'Sneha','Bangalore');


-- INSERT DATA INTO ORDERS
-- ===============================

INSERT INTO orders VALUES
(101,1,'Laptop',70000),
(102,1,'Mouse',500),
(103,2,'Phone',25000),
(104,3,'Keyboard',1500),
(105,4,'Monitor',12000);


SELECT * FROM customers;


SELECT * FROM orders;


-- INNER JOIN  

SELECT * 
FROM customers
INNER JOIN orders 
ON customers.customer_id = orders.customer_id;

-- LEFT JOIN  

SELECT c.customer_id,c.customer_name,o.amount
FROM customers c
LEFT JOIN orders o 
ON c.customer_id = o.customer_id;
