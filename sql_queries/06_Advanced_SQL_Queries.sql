/*
===============================================================================
 Project Name : Manual Database Testing Project
 File Name    : 06_Advanced_SQL_Queries.sql
 Author       : Jay Shinde
 Description  : Advanced SQL Queries
 Database     : ManualDatabaseTesting
===============================================================================
*/
USE ManualDatabaseTesting;

-- ============================================================================
-- 1. Display Employee(s) with Highest Salary
-- ============================================================================
SELECT *
FROM employees
WHERE salary = (
    SELECT MAX(salary)
    FROM employees
);

-- ============================================================================
-- 2. Display Employee(s) with Second Highest Salary
-- ============================================================================
SELECT *
FROM employees
WHERE salary = (
    SELECT MAX(salary)
    FROM employees
    WHERE salary < (
        SELECT MAX(salary)
        FROM employees
    )
);

-- ============================================================================
-- 3. Display Employee(s) with Third Highest Salary
-- ============================================================================
SELECT *
FROM employees
WHERE salary = (
    SELECT MAX(salary)
    FROM employees
    WHERE salary < (
        SELECT MAX(salary)
        FROM employees
        WHERE salary < (
            SELECT MAX(salary)
            FROM employees
        )
    )
);

-- ============================================================================
-- 4. Display Employee(s) with Fourth Highest Salary
-- ============================================================================
SELECT *
FROM employees
WHERE salary = (
    SELECT MAX(salary)
    FROM employees
    WHERE salary < (
        SELECT MAX(salary)
        FROM employees
        WHERE salary < (
            SELECT MAX(salary)
            FROM employees
            WHERE salary < (
                SELECT MAX(salary)
                FROM employees
            )
        )
    )
);

-- ============================================================================
-- 5. Display Employees Earning More Than Average Salary
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
-- 6. Display Employees Earning Less Than Average Salary
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
-- 7. Display Employees Having Duplicate Salaries
-- ============================================================================
SELECT employee_id,
       first_name,
       salary
FROM employees
WHERE salary IN
(
    SELECT salary
    FROM employees
    GROUP BY salary
    HAVING COUNT(*) > 1
);

-- ============================================================================
-- 8. Display Duplicate Email Addresses
-- ============================================================================
SELECT email,
       COUNT(*) AS Total
FROM employees
GROUP BY email
HAVING COUNT(*) > 1;

-- ============================================================================
-- 9. Display Employees Working in Departments Having More Than 3 Employees
-- ============================================================================
SELECT employee_id,
       first_name,
       department_id
FROM employees
WHERE department_id IN
(
    SELECT department_id
    FROM employees
    GROUP BY department_id
    HAVING COUNT(*) > 3
);

-- ============================================================================
-- 10. Display Highest Salary in Each Department
-- ============================================================================
SELECT employee_id,
       first_name,
       department_id,
       salary
FROM employees e
WHERE salary =
(
    SELECT MAX(salary)
    FROM employees
    WHERE department_id = e.department_id
);

-- ============================================================================
-- 11. Display Minimum Salary in Each Department
-- ============================================================================
SELECT employee_id,
       first_name,
       department_id,
       salary
FROM employees e
WHERE salary =
(
    SELECT MIN(salary)
    FROM employees
    WHERE department_id = e.department_id
);

-- ============================================================================
-- 12. Display Employees Earning More Than Department Average Salary
-- ============================================================================
SELECT employee_id,
       first_name,
       department_id,
       salary
FROM employees e
WHERE salary >
(
    SELECT AVG(salary)
    FROM employees
    WHERE department_id = e.department_id
);

-- ============================================================================
-- 13. Display Employees Earning Less Than Department Average Salary
-- ============================================================================
SELECT employee_id,
       first_name,
       department_id,
       salary
FROM employees e
WHERE salary <
(
    SELECT AVG(salary)
    FROM employees
    WHERE department_id = e.department_id
);

-- ============================================================================
-- 14. Display Employee(s) with Second Highest Salary in Each Department
-- ============================================================================
SELECT employee_id,
       first_name,
       department_id,
       salary
FROM employees e1
WHERE salary =
(
    SELECT MAX(salary)
    FROM employees e2
    WHERE e2.department_id = e1.department_id
      AND salary <
      (
          SELECT MAX(salary)
          FROM employees
          WHERE department_id = e1.department_id
      )
);

-- ============================================================================
-- 15. Display Employees Earning More Than Second Highest Salary
-- ============================================================================
SELECT employee_id,
       first_name,
       department_id,
       salary
FROM employees e1
WHERE salary >
(
    SELECT MAX(salary)
    FROM employees e2
    WHERE e2.department_id = e1.department_id
      AND salary <
      (
          SELECT MAX(salary)
          FROM employees
          WHERE department_id = e1.department_id
      )
);

-- ============================================================================
-- 16. Display Department Having Maximum Average Salary
-- ============================================================================
SELECT department_id,
       AVG(salary) AS Average_Salary
FROM employees
GROUP BY department_id
ORDER BY Average_Salary DESC
LIMIT 1;

-- ============================================================================
-- 17. Display Department Having Maximum Employees
-- ============================================================================
SELECT department_id,
       COUNT(*) AS Total_Employees
FROM employees
GROUP BY department_id
ORDER BY Total_Employees DESC
LIMIT 1;

-- ============================================================================
-- 18. Display Employees Hired Before Department Average Hire Date
-- ============================================================================
SELECT employee_id,
       first_name,
       department_id,
       hire_date
FROM employees e
WHERE TO_DAYS(hire_date) <
(
    SELECT AVG(TO_DAYS(hire_date))
    FROM employees
    WHERE department_id = e.department_id
);

-- ============================================================================
-- 19. Display Most Recently Hired Employee in Each Department
-- ============================================================================
SELECT employee_id,
       first_name,
       department_id,
       hire_date
FROM employees e
WHERE hire_date =
(
    SELECT MAX(hire_date)
    FROM employees
    WHERE department_id = e.department_id
);

-- ============================================================================
-- 20. Display Oldest Employee in Each Department
-- ============================================================================
SELECT employee_id,
       first_name,
       department_id,
       date_of_birth
FROM employees e
WHERE date_of_birth =
(
    SELECT MIN(date_of_birth)
    FROM employees
    WHERE department_id = e.department_id
);

-- ============================================================================
-- 21. Display Employees Without Department
-- ============================================================================
SELECT *
FROM employees
WHERE department_id IS NULL;

-- ============================================================================
-- 22. Display Employees Joined After 2023
-- ============================================================================
SELECT *
FROM employees
WHERE hire_date > '2023-01-01';

-- ============================================================================
-- 23. Display Top 5 Highest Paid Employees
-- ============================================================================
SELECT *
FROM employees
ORDER BY salary DESC
LIMIT 5;

-- ============================================================================
-- 24. Display Top 5 Lowest Paid Employees
-- ============================================================================
SELECT *
FROM employees
ORDER BY salary ASC
LIMIT 5;

-- ============================================================================
-- 25. Display Employees Sharing the Same Phone Number
-- ============================================================================
SELECT phone,
       COUNT(*) AS Total
FROM employees
GROUP BY phone
HAVING COUNT(*) > 1;

-- ============================================================================
-- 26. Display Employees Sharing the Same First Name
-- ============================================================================
SELECT first_name,
       COUNT(*) AS Total
FROM employees
GROUP BY first_name
HAVING COUNT(*) > 1;

-- ============================================================================
-- 27. Display Employees Born Before 1995
-- ============================================================================
SELECT *
FROM employees
WHERE date_of_birth < '1995-01-01';

-- ============================================================================
-- 28. Display Employees with Salary Between Department Average and Maximum Salary
-- ============================================================================
SELECT employee_id,
       first_name,
       department_id,
       salary
FROM employees e
WHERE salary BETWEEN
(
    SELECT AVG(salary)
    FROM employees
    WHERE department_id = e.department_id
)
AND
(
    SELECT MAX(salary)
    FROM employees
    WHERE department_id = e.department_id
);

-- ============================================================================
-- 29. Display Department-wise Employee Count
-- ============================================================================
SELECT department_id,
       COUNT(*) AS Total_Employees
FROM employees
GROUP BY department_id;

-- ============================================================================
-- 30. Display Department-wise Salary Summary
-- ============================================================================
SELECT department_id,
       COUNT(*) AS Employees,
       MIN(salary) AS Minimum_Salary,
       MAX(salary) AS Maximum_Salary,
       AVG(salary) AS Average_Salary,
       SUM(salary) AS Total_Salary
FROM employees
GROUP BY department_id;