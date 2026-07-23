/*
===============================================================================
 Project Name : Manual Database Testing Project
 File Name    : 04_Basic_SQL_Queries.sql
 Author       : Jay Shinde
 Description  : Basic SQL Queries
 Database     : ManualDatabaseTesting
===============================================================================
*/
USE ManualDatabaseTesting;
-- ============================================================================
-- 1. Display All Employees
-- ============================================================================
SELECT * FROM employees;

-- ============================================================================
-- 2. Display Specific Columns
-- ============================================================================
SELECT employee_id, first_name, last_name
FROM employees;

-- ============================================================================
-- 3. Display Distinct Department IDs
-- ============================================================================
SELECT DISTINCT department_id
FROM employees;

-- ============================================================================
-- 4. Display Employee Names Using Alias
-- ============================================================================
SELECT first_name AS First_Name,
       last_name AS Last_Name
FROM employees;

-- ============================================================================
-- 5. Display Employees with Salary Greater Than 50000
-- ============================================================================
SELECT *
FROM employees
WHERE salary > 50000;

-- ============================================================================
-- 6. Display Employees Belonging to Department 1
-- ============================================================================
SELECT *
FROM employees
WHERE department_id = 1;

-- ============================================================================
-- 7. Display Active Employees
-- ============================================================================
SELECT *
FROM employees
WHERE employee_status = 'Active';

-- ============================================================================
-- 8. Display Female Employees
-- ============================================================================
SELECT *
FROM employees
WHERE gender = 'Female';

-- ============================================================================
-- 9. Display Employees with Salary Between 30000 and 60000
-- ============================================================================
SELECT *
FROM employees
WHERE salary BETWEEN 30000 AND 60000;

-- ============================================================================
-- 10. Display Employees in Department 1, 2 and 3
-- ============================================================================
SELECT *
FROM employees
WHERE department_id IN (1,2,3);

-- ============================================================================
-- 11. Display Employees Not in Department 1 and 2
-- ============================================================================
SELECT *
FROM employees
WHERE department_id NOT IN (1,2);

-- ============================================================================
-- 12. Display Employees Whose Name Starts With 'A'
-- ============================================================================
SELECT *
FROM employees
WHERE first_name LIKE 'A%';

-- ============================================================================
-- 13. Display Employees Whose Name Ends With 'N'
-- ============================================================================
SELECT *
FROM employees
WHERE first_name LIKE '%N';

-- ============================================================================
-- 14. Display Employees Whose Name Contains 'A'
-- ============================================================================
SELECT *
FROM employees
WHERE first_name LIKE '%A%';

-- ============================================================================
-- 15. Display Employees with Gmail Accounts
-- ============================================================================
SELECT *
FROM employees
WHERE email LIKE '%gmail.com';

-- ============================================================================
-- 16. Display Employees Having NULL Phone Numbers
-- ============================================================================
SELECT *
FROM employees
WHERE phone IS NULL;

-- ============================================================================
-- 17. Display Employees Having Phone Numbers
-- ============================================================================
SELECT *
FROM employees
WHERE phone IS NOT NULL;

-- ============================================================================
-- 18. Display Employees Ordered by Salary (Ascending)
-- ============================================================================
SELECT *
FROM employees
ORDER BY salary ASC;

-- ============================================================================
-- 19. Display Employees Ordered by Salary (Descending)
-- ============================================================================
SELECT *
FROM employees
ORDER BY salary DESC;

-- ============================================================================
-- 20. Display Employees Ordered by First Name
-- ============================================================================
SELECT *
FROM employees
ORDER BY first_name;

-- ============================================================================
-- 21. Display First Five Employees
-- ============================================================================
SELECT *
FROM employees
LIMIT 5;

-- ============================================================================
-- 22. Display Next Five Employees
-- ============================================================================
SELECT *
FROM employees
LIMIT 5 OFFSET 5;

-- ============================================================================
-- 23. Display Employee Count
-- ============================================================================
SELECT COUNT(*) AS Total_Employees
FROM employees;

-- ============================================================================
-- 24. Display Total Salary
-- ============================================================================
SELECT SUM(salary) AS Total_Salary
FROM employees;

-- ============================================================================
-- 25. Display Average Salary
-- ============================================================================
SELECT AVG(salary) AS Average_Salary
FROM employees;

-- ============================================================================
-- 26. Display Highest Salary
-- ============================================================================
SELECT MAX(salary) AS Highest_Salary
FROM employees;

-- ============================================================================
-- 27. Display Lowest Salary
-- ============================================================================
SELECT MIN(salary) AS Lowest_Salary
FROM employees;

-- ============================================================================
-- 28. Display Department Wise Employee Count
-- ============================================================================
SELECT department_id,
       COUNT(*) AS Total_Employees
FROM employees
GROUP BY department_id;

-- ============================================================================
-- 29. Display Department Wise Average Salary
-- ============================================================================
SELECT department_id,
       AVG(salary) AS Average_Salary
FROM employees
GROUP BY department_id;

-- ============================================================================
-- 30. Display Department Wise Maximum Salary
-- ============================================================================
SELECT department_id,
       MAX(salary) AS Highest_Salary
FROM employees
GROUP BY department_id;

-- ============================================================================
-- 31. Display Department Wise Minimum Salary
-- ============================================================================
SELECT department_id,
       MIN(salary) AS Lowest_Salary
FROM employees
GROUP BY department_id;

-- ============================================================================
-- 32. Display Department Wise Total Salary
-- ============================================================================
SELECT department_id,
       SUM(salary) AS Total_Salary
FROM employees
GROUP BY department_id;

-- ============================================================================
-- 33. Display Departments Having More Than 2 Employees
-- ============================================================================
SELECT department_id,
       COUNT(*) AS Total_Employees
FROM employees
GROUP BY department_id
HAVING COUNT(*) > 2;

-- ============================================================================
-- 34. Display Departments Having Average Salary Greater Than 50000
-- ============================================================================
SELECT department_id,
       AVG(salary) AS Average_Salary
FROM employees
GROUP BY department_id
HAVING AVG(salary) > 50000;

-- ============================================================================
-- 35. Display Employees Working in HR or IT Departments
-- ============================================================================
SELECT *
FROM employees
WHERE department_id IN (1,2);

-- ============================================================================
-- 36. Display Employees with Salary Greater Than 50000 AND Active
-- ============================================================================
SELECT *
FROM employees
WHERE salary > 50000
AND employee_status='Active';

-- ============================================================================
-- 37. Display Employees with Salary Less Than 40000 OR Department 3
-- ============================================================================
SELECT *
FROM employees
WHERE salary < 40000
OR department_id = 3;

-- ============================================================================
-- 38. Display Employees Ordered by Department then Salary
-- ============================================================================
SELECT *
FROM employees
ORDER BY department_id, salary DESC;

-- ============================================================================
-- 39. Display Employees Hired After 2023-01-01
-- ============================================================================
SELECT *
FROM employees
WHERE hire_date > '2023-01-01';

-- ============================================================================
-- 40. Display Employees Born Before 1995
-- ============================================================================
SELECT *
FROM employees
WHERE date_of_birth < '1995-01-01';