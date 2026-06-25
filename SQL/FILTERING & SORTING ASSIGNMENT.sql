-- ============================================================
--   FILTERING AND SORTING - SQL Assignment 

-- ============================================================
-- STEP 1: Create the Database and Table

CREATE DATABASE IF NOT EXISTS pwskills_db;
USE pwskills_db;

-- Drop table if it already exists (for clean re-run)
DROP TABLE IF EXISTS Employees;

-- Create the Employees table
CREATE TABLE Employees (
    EmpID       INT PRIMARY KEY,
    EmpName     VARCHAR(100),
    Department  VARCHAR(50),
    City        VARCHAR(50),
    Salary      INT,
    HireDate    DATE
);

-- ============================================================
-- STEP 2: Insert Sample Data
-- ============================================================

INSERT INTO Employees (EmpID, EmpName, Department, City, Salary, HireDate) VALUES
(101, 'Rahul Mehta',  'Sales',     'Delhi',     55000, '2020-04-12'),
(102, 'Priya Sharma', 'HR',        'Mumbai',    62000, '2019-09-25'),
(103, 'Aman Singh',   'IT',        'Bengaluru', 72000, '2021-03-10'),
(104, 'Neha Patel',   'Sales',     'Delhi',     48000, '2022-01-14'),
(105, 'Karan Joshi',  'Marketing', 'Pune',      45000, '2018-07-22'),
(106, 'Divya Nair',   'IT',        'Chennai',   81000, '2019-12-11'),
(107, 'Raj Kumar',    'HR',        'Delhi',     60000, '2020-05-28'),
(108, 'Simran Kaur',  'Finance',   'Mumbai',    58000, '2021-08-03'),
(109, 'Arjun Reddy',  'IT',        'Hyderabad', 70000, '2022-02-18'),
(110, 'Anjali Das',   'Sales',     'Kolkata',   51000, '2023-01-15');


-- ============================================================
-- QUESTION 1:
-- Show employees working in either the 'IT' or 'HR' departments.
--
-- Explanation:
--   We use the OR operator to match rows where Department
--   is 'IT' OR 'HR'. Both conditions are checked and any row
--   satisfying either one is included in the result.
-- ============================================================

SELECT *
FROM Employees
WHERE Department = 'IT' OR Department = 'HR';

-- Expected Output: Priya Sharma, Aman Singh, Divya Nair, Raj Kumar, Arjun Reddy


-- ============================================================
-- QUESTION 2:
-- Retrieve employees whose department is in 'Sales', 'IT', or 'Finance'.
--
-- Explanation:
--   The IN operator is a cleaner alternative to multiple OR conditions.
--   It checks if the Department value matches any value in the given list.
--   IN ('Sales', 'IT', 'Finance') is the same as:
--   Department='Sales' OR Department='IT' OR Department='Finance'
-- ============================================================

SELECT *
FROM Employees
WHERE Department IN ('Sales', 'IT', 'Finance');

-- Expected Output: Rahul Mehta, Aman Singh, Neha Patel, Divya Nair,
--                  Simran Kaur, Arjun Reddy, Anjali Das


-- ============================================================
-- QUESTION 3:
-- Display employees whose salary is between ₹50,000 and ₹70,000.
--
-- Explanation:
--   The BETWEEN operator filters rows where the value falls
--   within a range (inclusive of both endpoints).
--   BETWEEN 50000 AND 70000 means: Salary >= 50000 AND Salary <= 70000
-- ============================================================

SELECT *
FROM Employees
WHERE Salary BETWEEN 50000 AND 70000;

-- Expected Output: Rahul Mehta (55000), Priya Sharma (62000),
--                  Raj Kumar (60000), Simran Kaur (58000),
--                  Arjun Reddy (70000), Anjali Das (51000)


-- ============================================================
-- QUESTION 4:
-- List employees whose names start with the letter 'A'.
--
-- Explanation:
--   The LIKE operator is used for pattern matching in strings.
--   'A%' means: starts with 'A', followed by any characters.
--     A  → exact letter A
--     %  → wildcard (matches zero or more characters)
-- ============================================================

SELECT *
FROM Employees
WHERE EmpName LIKE 'A%';

-- Expected Output: Aman Singh, Arjun Reddy, Anjali Das


-- ============================================================
-- QUESTION 5:
-- Find employees whose names contain the substring 'an'.
--
-- Explanation:
--   '%an%' means: any characters before 'an' AND any after 'an'.
--   The LIKE operator with % on both sides searches for 'an'
--   anywhere inside the EmpName string.
--   Note: MySQL LIKE is case-insensitive by default.
-- ============================================================

SELECT *
FROM Employees
WHERE EmpName LIKE '%an%';

-- Expected Output: Aman Singh (Am-AN), Karan Joshi (kar-AN),
--                  Simran Kaur (sim-RAN), Anjali Das (ANjali)


-- ============================================================
-- QUESTION 6:
-- Show employees who are from 'Delhi' or 'Mumbai'
-- AND earn more than ₹55,000.
--
-- Explanation:
--   We combine two conditions using AND and OR.
--   Brackets () are important here to ensure correct logic:
--     First check: City is 'Delhi' OR 'Mumbai'
--     Then check:  Salary > 55000
--   Without brackets, AND has higher precedence than OR
--   and the logic would be wrong.
-- ============================================================

SELECT *
FROM Employees
WHERE (City = 'Delhi' OR City = 'Mumbai')
  AND Salary > 55000;

-- Expected Output: Priya Sharma (Mumbai, 62000),
--                  Raj Kumar (Delhi, 60000),
--                  Simran Kaur (Mumbai, 58000)


-- ============================================================
-- QUESTION 7:
-- Display all employees except those from the 'HR' department.
--
-- Explanation:
--   The != operator (or <> in SQL) means "not equal to".
--   We can also use NOT IN ('HR') for the same result.
--   This filters out any row where Department is 'HR'.
-- ============================================================

SELECT *
FROM Employees
WHERE Department != 'HR';

-- Alternative using NOT IN:
-- WHERE Department NOT IN ('HR');

-- Expected Output: All employees except Priya Sharma and Raj Kumar


-- ============================================================
-- QUESTION 8:
-- Get all employees hired between 2019 and 2022,
-- ordered by HireDate (oldest first).
--
-- Explanation:
--   YEAR(HireDate) extracts the year part from the HireDate column.
--   BETWEEN 2019 AND 2022 includes both 2019 and 2022.
--   ORDER BY HireDate ASC sorts results from oldest to newest.
--   ASC = Ascending order (default); DESC = Descending order.
-- ============================================================

SELECT *
FROM Employees
WHERE YEAR(HireDate) BETWEEN 2019 AND 2022
ORDER BY HireDate ASC;

-- Expected Output (oldest to newest HireDate):
--   Priya Sharma  - 2019-09-25
--   Divya Nair    - 2019-12-11
--   Rahul Mehta   - 2020-04-12
--   Raj Kumar     - 2020-05-28
--   Aman Singh    - 2021-03-10
--   Simran Kaur   - 2021-08-03
--   Neha Patel    - 2022-01-14
--   Arjun Reddy   - 2022-02-18

