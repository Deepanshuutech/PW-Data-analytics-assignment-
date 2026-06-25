-- Q1. Create a New Database and Table for Employees
-- Task: Create a new database named company_db and Create a table named employees with the following columns

-- Ans1. 

Create database company_db;

use company_db;

Create table employees (
Emp_id int primary key,
First_name varchar(50) not null,
Last_name varchar(50) not null,
department varchar(50) not null,
salary int check (salary > 0),
hire_date date default (current_date)
);

select * from employees;

-- Q2. Insert Data into Employees Table
-- Task: Insert the following sample records into the employees table

Create table employees (
Emp_id int primary key,
First_name varchar(50) not null,
Last_name varchar(50) not null,
department varchar(50) not null,
salary int check (salary > 0),
hire_date date default (current_date)
);

INSERT INTO Employees values(101,'Amit','sharma','HR',50000,'2020-01-15');
INSERT INTO Employees values(102,'Riya','Kapoor','Sales',75000,'2019-03-22'); 
INSERT INTO Employees values(103,'Raj','Mehta','IT',90000,'2018-07-11'); 
INSERT INTO Employees values(104,'Neha','Verma','IT',85000,'2021-09-11');
INSERT INTO Employees values(105,'Arjun','Singh','Finance',60000,'2022-02-10');

Select * from employees;

SELECT * FROM employees

-- Q3. Display All Employee Records Sorted by Salary (Lowest to Highest)
-- Hint: Use the ORDER BY clause on the salary column.

-- Ans3. 
ORDER BY salary ASC;

-- Q4. Show Employees Sorted by Department (A–Z) and Salary (High → Low)

-- Ans4.
SELECT * FROM employees
ORDER BY department ASC, salary DESC;

-- Q5. List All Employees in the IT Department, Ordered by Hire Date (Newest First)

-- Ans5. 

SELECT * FROM employees
WHERE department = 'IT'
ORDER BY hire_date DESC;

CREATE TABLE sales (
sale_id INT PRIMARY KEY,
customer_name VARCHAR(50) NOT NULL,
amount INT NOT NULL,
sale_date DATE DEFAULT (CURRENT_DATE)
);

select * from sales;

INSERT INTO sales values(1,'Aditi','1500','2024-08-01');
INSERT INTO sales values(2,'Rohan','2200','2024-08-03');
INSERT INTO sales values(3,'Aditi','3500','2024-09-05');
INSERT INTO sales values(4,'Meena','2700','2024-09-15');
INSERT INTO sales values(5,'Rohan','4500','2024-09-25');

-- Q7. Display all sales recorded sorted by amount (highest - lowest)
-- Hint: Use ORDER BY amount DESC.

-- Ans7.

Select * from sales
ORDER BY amount DESC;

-- Q8. Show all sales made by customer "aditi"
-- hint: Use WHERE customer_name = 'aditi'.

-- Ans8 

Select * from sales
WHERE customer_name = 'Aditi';

-- Q9. What is the different B/W a Primary key and a foreign key?
-- Ans9. A Primary Key uniquely identifies a record within its own table, while a Foreign Key links a record in one table to a record in another.

-- Q10. What Are Constraints in SQL and Why Are They Used?
-- Ans10. Constraints are predefined rules applied to columns or tables to limit the type of data that can be entered. Think of them as guardrails for your database

-- The primary goal of constraints is to maintain Data Integrity. They ensure that the information stored is:

-- Accurate: No impossible numbers (like a negative salary).

-- Reliable: No missing essential info (like an employee without a name).

-- Consistent: No duplicate IDs or broken links between tables.