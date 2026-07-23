/*
===============================================================================
 Project Name : Manual Database Testing Project
 File Name    : 07_Database_Testing_Queries.sql
 Author       : Jay Shinde
 Description  : Database Testing Validation Queries
 Database     : ManualDatabaseTesting
===============================================================================
*/
USE ManualDatabaseTesting;

-- ============================================================================
-- 1. Verify Total Number of Employees
-- ============================================================================
SELECT COUNT(*) AS Total_Employees
FROM employees;

-- ============================================================================
-- 2. Verify Total Number of Departments
-- ============================================================================
SELECT COUNT(*) AS Total_Departments
FROM departments;

-- ============================================================================
-- 3. Verify Primary Key Uniqueness (Employee ID)
-- ============================================================================
SELECT employee_id,
       COUNT(*)
FROM employees
GROUP BY employee_id
HAVING COUNT(*) > 1;

-- ============================================================================
-- 4. Verify Duplicate Email Addresses
-- ============================================================================
SELECT email,
       COUNT(*)
FROM employees
GROUP BY email
HAVING COUNT(*) > 1;

-- ============================================================================
-- 5. Verify Duplicate Phone Numbers
-- ============================================================================
SELECT phone,
       COUNT(*)
FROM employees
GROUP BY phone
HAVING COUNT(*) > 1;

-- ============================================================================
-- 6. Verify NULL Employee Names
-- ============================================================================
SELECT *
FROM employees
WHERE first_name IS NULL;

-- ============================================================================
-- 7. Verify NULL Last Names
-- ============================================================================
SELECT *
FROM employees
WHERE last_name IS NULL;

-- ============================================================================
-- 8. Verify NULL Email Addresses
-- ============================================================================
SELECT *
FROM employees
WHERE email IS NULL;

-- ============================================================================
-- 9. Verify NULL Phone Numbers
-- ============================================================================
SELECT *
FROM employees
WHERE phone IS NULL;

-- ============================================================================
-- 10. Verify NULL Department IDs
-- ============================================================================
SELECT *
FROM employees
WHERE department_id IS NULL;

-- ============================================================================
-- 11. Verify Empty First Names
-- ============================================================================
SELECT *
FROM employees
WHERE first_name='';

-- ============================================================================
-- 12. Verify Empty Last Names
-- ============================================================================
SELECT *
FROM employees
WHERE last_name='';

-- ============================================================================
-- 13. Verify Empty Email Addresses
-- ============================================================================
SELECT *
FROM employees
WHERE email='';

-- ============================================================================
-- 14. Verify Negative Salaries
-- ============================================================================
SELECT *
FROM employees
WHERE salary < 0;

-- ============================================================================
-- 15. Verify Zero Salary
-- ============================================================================
SELECT *
FROM employees
WHERE salary = 0;

-- ============================================================================
-- 16. Verify Salary Greater Than One Lakh
-- ============================================================================
SELECT *
FROM employees
WHERE salary > 100000;

-- ============================================================================
-- 17. Verify Invalid Department IDs (Orphan Records)
-- ============================================================================
SELECT *
FROM employees
WHERE department_id NOT IN
(
SELECT department_id
FROM departments
);

-- ============================================================================
-- 18. Verify Employees Without Department
-- ============================================================================
SELECT *
FROM employees
WHERE department_id IS NULL;

-- ============================================================================
-- 19. Verify Future Hire Dates
-- ============================================================================
SELECT *
FROM employees
WHERE hire_date > CURDATE();

-- ============================================================================
-- 20. Verify Future Date of Birth
-- ============================================================================
SELECT *
FROM employees
WHERE date_of_birth > CURDATE();

-- ============================================================================
-- 21. Verify Employee Age Less Than 18
-- ============================================================================
SELECT *
FROM employees
WHERE TIMESTAMPDIFF(YEAR,date_of_birth,CURDATE()) < 18;

-- ============================================================================
-- 22. Verify Invalid Gender Values
-- ============================================================================
SELECT *
FROM employees
WHERE gender NOT IN ('Male','Female','Other');

-- ============================================================================
-- 23. Verify Invalid Employee Status
-- ============================================================================
SELECT *
FROM employees
WHERE employee_status NOT IN ('Active','Inactive');

-- ============================================================================
-- 24. Verify Employees Without Gmail Accounts
-- ============================================================================
SELECT *
FROM employees
WHERE email NOT LIKE '%@gmail.com';

-- ============================================================================
-- 25. Verify Duplicate Full Names
-- ============================================================================
SELECT first_name,
       last_name,
       COUNT(*)
FROM employees
GROUP BY first_name,last_name
HAVING COUNT(*) > 1;

-- ============================================================================
-- 26. Verify Department-wise Employee Count
-- ============================================================================
SELECT department_id,
       COUNT(*) AS Total_Employees
FROM employees
GROUP BY department_id;

-- ============================================================================
-- 27. Verify Department-wise Average Salary
-- ============================================================================
SELECT department_id,
       AVG(salary)
FROM employees
GROUP BY department_id;

-- ============================================================================
-- 28. Verify Highest Salary in Each Department
-- ============================================================================
SELECT department_id,
       MAX(salary)
FROM employees
GROUP BY department_id;

-- ============================================================================
-- 29. Verify Lowest Salary in Each Department
-- ============================================================================
SELECT department_id,
       MIN(salary)
FROM employees
GROUP BY department_id;

-- ============================================================================
-- 30. Verify Employees Joined After Today (Invalid)
-- ============================================================================
SELECT *
FROM employees
WHERE hire_date > CURDATE();

-- ============================================================================
-- 31. Verify Employees Without Email
-- ============================================================================
SELECT *
FROM employees
WHERE email IS NULL OR email='';

-- ============================================================================
-- 32. Verify Employees Without Phone Number
-- ============================================================================
SELECT *
FROM employees
WHERE phone IS NULL OR phone='';

-- ============================================================================
-- 33. Verify Salary Range (30000-100000)
-- ============================================================================
SELECT *
FROM employees
WHERE salary NOT BETWEEN 30000 AND 100000;

-- ============================================================================
-- 34. Verify Invalid Phone Number Length
-- ============================================================================
SELECT *
FROM employees
WHERE LENGTH(phone) <> 10;

-- ============================================================================
-- 35. Verify Phone Numbers Containing Characters
-- ============================================================================
SELECT *
FROM employees
WHERE phone REGEXP '[^0-9]';

-- ============================================================================
-- 36. Verify Invalid Email Format
-- ============================================================================
SELECT *
FROM employees
WHERE email NOT REGEXP '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$';

-- ============================================================================
-- 37. Verify Employees Assigned to Every Department
-- ============================================================================
SELECT d.department_name,
       COUNT(e.employee_id) AS Total_Employees
FROM departments d
LEFT JOIN employees e
ON d.department_id=e.department_id
GROUP BY d.department_name;

-- ============================================================================
-- 38. Verify Departments Without Employees
-- ============================================================================
SELECT d.*
FROM departments d
LEFT JOIN employees e
ON d.department_id=e.department_id
WHERE e.employee_id IS NULL;

-- ============================================================================
-- 39. Verify Duplicate Department Names
-- ============================================================================
SELECT department_name,
       COUNT(*)
FROM departments
GROUP BY department_name
HAVING COUNT(*)>1;

-- ============================================================================
-- 40. Verify Overall Database Summary
-- ============================================================================
SELECT
COUNT(*) AS Total_Employees,
MIN(salary) AS Minimum_Salary,
MAX(salary) AS Maximum_Salary,
AVG(salary) AS Average_Salary,
SUM(salary) AS Total_Salary
FROM employees;