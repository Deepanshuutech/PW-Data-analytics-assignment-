--         SQL JOINS ASSIGNMENT - PW SKILLS
--         Tables: Customers, Orders, Payments, Employees


CREATE DATABASE IF NOT EXISTS pwskills_joins;
USE pwskills_joins;

-- Table 1: Customers
CREATE TABLE Customers (
    CustomerID   INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    City         VARCHAR(100)
);

INSERT INTO Customers VALUES
(1, 'John Smith',    'New York'),
(2, 'Mary Johnson',  'Chicago'),
(3, 'Peter Adams',   'Los Angeles'),
(4, 'Nancy Miller',  'Houston'),
(5, 'Robert White',  'Miami');

-- Table 2: Orders
CREATE TABLE Orders (
    OrderID    INT PRIMARY KEY,
    CustomerID INT,
    OrderDate  DATE,
    Amount     DECIMAL(10,2)
);

INSERT INTO Orders VALUES
(101, 1, '2024-10-01', 250),
(102, 2, '2024-10-05', 300),
(103, 1, '2024-10-07', 150),
(104, 3, '2024-10-10', 450),
(105, 6, '2024-10-12', 400);   

-- Table 3: Payments
CREATE TABLE Payments (
    PaymentID   VARCHAR(10) PRIMARY KEY,
    CustomerID  INT,
    PaymentDate DATE,
    Amount      DECIMAL(10,2)
);

INSERT INTO Payments VALUES
('P001', 1, '2024-10-02', 250),
('P002', 2, '2024-10-06', 300),
('P003', 3, '2024-10-11', 450),
('P004', 4, '2024-10-15', 200);

-- Table 4: Employees 
CREATE TABLE Employees (
    EmployeeID   INT PRIMARY KEY,
    EmployeeName VARCHAR(100),
    ManagerID    INT           
);

INSERT INTO Employees VALUES
(1, 'Alex Green',  NULL),   
(2, 'Brian Lee',   1),
(3, 'Carol Ray',   1),
(4, 'David Kim',   2),
(5, 'Eva Smith',   2);


-- QUESTION 1:
-- "Retrieve all customers who have placed at least one order."
-- JOIN TYPE: INNER JOIN

-- ANS1

SELECT DISTINCT
    c.CustomerID,
    c.CustomerName,
    c.City
FROM Customers c
INNER JOIN Orders o
    ON c.CustomerID = o.CustomerID;


-- QUESTION 2:
-- "Retrieve all customers and their orders, including customers
--  who have not placed any orders."

-- ANS2

SELECT
    c.CustomerID,
    c.CustomerName,
    c.City,
    o.OrderID,
    o.OrderDate,
    o.Amount AS OrderAmount
FROM Customers c
LEFT JOIN Orders o
    ON c.CustomerID = o.CustomerID;
    
-- QUESTION 3:
-- "Retrieve all orders and their corresponding customers,
--  including orders placed by unknown customers."

-- ANS3

SELECT
    c.CustomerID,
    c.CustomerName,
    c.City,
    o.OrderID,
    o.OrderDate,
    o.Amount AS OrderAmount
FROM Customers c
RIGHT JOIN Orders o
    ON c.CustomerID = o.CustomerID;

-- QUESTION 4:
-- "Display all customers and orders, whether matched or not."

-- ANS4

SELECT
    c.CustomerID,
    c.CustomerName,
    c.City,
    o.OrderID,
    o.OrderDate,
    o.Amount AS OrderAmount
FROM Customers c
LEFT JOIN Orders o  ON c.CustomerID = o.CustomerID

UNION

SELECT
    c.CustomerID,
    c.CustomerName,
    c.City,
    o.OrderID,
    o.OrderDate,
    o.Amount AS OrderAmount
FROM Customers c
RIGHT JOIN Orders o ON c.CustomerID = o.CustomerID;

-- QUESTION 5:
-- "Find customers who have not placed any orders."

-- ANS 5 

SELECT
    c.CustomerID,
    c.CustomerName,
    c.City
FROM Customers c
LEFT JOIN Orders o
    ON c.CustomerID = o.CustomerID
WHERE o.OrderID IS NULL;


-- QUESTION 6:
-- "Retrieve customers who made payments but did not place any orders."

--  ANS 6

SELECT
    c.CustomerID,
    c.CustomerName,
    c.City,
    p.PaymentID,
    p.Amount AS PaymentAmount
FROM Customers c
INNER JOIN Payments p ON c.CustomerID = p.CustomerID
LEFT JOIN  Orders   o ON c.CustomerID = o.CustomerID
WHERE o.OrderID IS NULL;

-- QUESTION 7:
-- "Generate a list of all possible combinations between
--  Customers and Orders."

-- ANS 7

SELECT
    c.CustomerID,
    c.CustomerName,
    o.OrderID,
    o.Amount AS OrderAmount
FROM Customers c
CROSS JOIN Orders o
ORDER BY c.CustomerID, o.OrderID;

-- QUESTION 8:
-- "Show all customers along with order and payment amounts
--  in one table."

-- ANS 8
 
SELECT
    c.CustomerID,
    c.CustomerName,
    c.City,
    o.OrderID,
    o.Amount     AS OrderAmount,
    p.PaymentID,
    p.Amount     AS PaymentAmount
FROM Customers c
LEFT JOIN Orders   o ON c.CustomerID = o.CustomerID
LEFT JOIN Payments p ON c.CustomerID = p.CustomerID;

-- QUESTION 9:
-- "Retrieve all customers who have both placed orders
--  AND made payments."

-- ANS 9 

SELECT DISTINCT
    c.CustomerID,
    c.CustomerName,
    c.City
FROM Customers c
INNER JOIN Orders   o ON c.CustomerID = o.CustomerID
INNER JOIN Payments p ON c.CustomerID = p.CustomerID;

