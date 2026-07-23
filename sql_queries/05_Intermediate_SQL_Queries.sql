/*
===============================================================================
 Project Name : Manual Database Testing Project
 File Name    : 05_Intermediate_SQL_Queries.sql
 Author       : Jay Shinde
 Description  : Intermediate SQL Queries
 Database     : ManualDatabaseTesting
===============================================================================
*/
USE ManualDatabaseTesting;

-- ============================================================================
-- 1. INNER JOIN - Display Employees with Department Name
-- ============================================================================
SELECT e.employee_id,
       e.first_name,
       e.last_name,
       d.department_name
FROM employees e
INNER JOIN departments d
ON e.department_id = d.department_id;

-- ============================================================================
-- 2. LEFT JOIN - Display All Employees with Department Details
-- ============================================================================
SELECT e.employee_id,
       e.first_name,
       d.department_name
FROM employees e
LEFT JOIN departments d
ON e.department_id = d.department_id;

-- ============================================================================
-- 3. RIGHT JOIN - Display All Departments with Employees
-- ============================================================================
SELECT d.department_name,
       e.first_name
FROM employees e
RIGHT JOIN departments d
ON e.department_id = d.department_id;

-- ============================================================================
-- 4. CROSS JOIN - Display All Employee and Department Combinations
-- ============================================================================
SELECT e.first_name,
       d.department_name
FROM employees e
CROSS JOIN departments d;

-- ============================================================================
-- 5. UNION - Display All First Names and Department Names
-- ============================================================================
SELECT first_name AS Name
FROM employees
UNION
SELECT department_name
FROM departments;

-- ============================================================================
-- 6. UNION ALL
-- ============================================================================
SELECT first_name AS Name
FROM employees
UNION ALL
SELECT department_name
FROM departments;

-- ============================================================================
-- 7. CASE Statement - Salary Grade
-- ============================================================================
SELECT employee_id,
       first_name,
       salary,
       CASE
           WHEN salary >= 80000 THEN 'High'
           WHEN salary >= 50000 THEN 'Medium'
           ELSE 'Low'
       END AS Salary_Grade
FROM employees;

-- ============================================================================
-- 8. CASE Statement - Employee Status
-- ============================================================================
SELECT employee_id,
       first_name,
       employee_status,
       CASE
           WHEN employee_status='Active' THEN 'Working'
           ELSE 'Not Working'
       END AS Status
FROM employees;

-- ============================================================================
-- 9. IFNULL Function
-- ============================================================================
SELECT employee_id,
       first_name,
       IFNULL(phone,'Phone Not Available') AS Phone
FROM employees;

-- ============================================================================
-- 10. COALESCE Function
-- ============================================================================
SELECT employee_id,
       first_name,
       COALESCE(phone,email,'No Contact Available') AS Contact
FROM employees;

-- ============================================================================
-- 11. EXISTS - Employees Working in Existing Departments
-- ============================================================================
SELECT *
FROM employees e
WHERE EXISTS
(
    SELECT 1
    FROM departments d
    WHERE d.department_id=e.department_id
);

-- ============================================================================
-- 12. NOT EXISTS - Departments Without Employees
-- ============================================================================
SELECT *
FROM departments d
WHERE NOT EXISTS
(
    SELECT 1
    FROM employees e
    WHERE e.department_id=d.department_id
);

-- ============================================================================
-- 13. IN - Employees Working in HR or IT
-- ============================================================================
SELECT *
FROM employees
WHERE department_id IN
(
    SELECT department_id
    FROM departments
    WHERE department_name IN ('HR','IT')
);

-- ============================================================================
-- 14. NOT IN - Employees Not Working in HR or IT
-- ============================================================================
SELECT *
FROM employees
WHERE department_id NOT IN
(
    SELECT department_id
    FROM departments
    WHERE department_name IN ('HR','IT')
);

-- ============================================================================
-- 15. ANY Operator
-- ============================================================================
SELECT *
FROM employees
WHERE salary > ANY
(
    SELECT salary
    FROM employees
    WHERE department_id=1
);

-- ============================================================================
-- 16. ALL Operator
-- ============================================================================
SELECT *
FROM employees
WHERE salary > ALL
(
    SELECT salary
    FROM employees
    WHERE department_id=1
);

-- ============================================================================
-- 17. Subquery - Employees Above Average Salary
-- ============================================================================
SELECT employee_id,
       first_name,
       salary
FROM employees
WHERE salary >
(
    SELECT AVG(salary)
    FROM employees
);

-- ============================================================================
-- 18. Subquery - Employees Below Average Salary
-- ============================================================================
SELECT employee_id,
       first_name,
       salary
FROM employees
WHERE salary <
(
    SELECT AVG(salary)
    FROM employees
);

-- ============================================================================
-- 19. Subquery - Highest Salary
-- ============================================================================
SELECT *
FROM employees
WHERE salary =
(
    SELECT MAX(salary)
    FROM employees
);

-- ============================================================================
-- 20. Subquery - Lowest Salary
-- ============================================================================
SELECT *
FROM employees
WHERE salary =
(
    SELECT MIN(salary)
    FROM employees
);

-- ============================================================================
-- 21. Create View
-- ============================================================================
CREATE VIEW employee_details AS
SELECT e.employee_id,
       e.first_name,
       e.last_name,
       d.department_name,
       e.salary
FROM employees e
INNER JOIN departments d
ON e.department_id=d.department_id;

-- ============================================================================
-- 22. Display View
-- ============================================================================
SELECT *
FROM employee_details;

-- ============================================================================
-- 23. Create Department Salary Summary View
-- ============================================================================
CREATE VIEW department_salary_summary AS
SELECT department_id,
       COUNT(*) AS total_employees,
       AVG(salary) AS average_salary,
       MAX(salary) AS highest_salary,
       MIN(salary) AS lowest_salary
FROM employees
GROUP BY department_id;

-- ============================================================================
-- 24. Display Department Salary Summary
-- ============================================================================
SELECT *
FROM department_salary_summary;

-- ============================================================================
-- 25. Drop View
-- ============================================================================
DROP VIEW IF EXISTS employee_details;

-- ============================================================================
-- 26. Drop Department Salary Summary View
-- ============================================================================
DROP VIEW IF EXISTS department_salary_summary;