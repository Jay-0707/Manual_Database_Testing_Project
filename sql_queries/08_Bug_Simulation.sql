/*
===============================================================================
 Project Name : Manual Database Testing Project
 File Name    : 08_Bug_Simulation.sql
 Author       : Jay Shinde
 Description  : Intentional Bug Simulation for Database Testing
 Database     : ManualDatabaseTesting
===============================================================================
*/
USE ManualDatabaseTesting;

-- ============================================================================
-- Bug 1 : Duplicate Email Address
-- Expected : Should fail because email is UNIQUE.
-- ============================================================================

INSERT INTO employees
(first_name,last_name,gender,date_of_birth,email,phone,job_title,salary,
hire_date,employee_status,department_id)
VALUES
('Rahul','Patil','Male','1997-04-12',
'amit.sharma@gmail.com',
'9998887771',
'QA Engineer',
45000,
'2024-05-20',
'Active',
1);

-- ============================================================================
-- Bug 2 : Duplicate Phone Number
-- Expected : Should fail because phone is UNIQUE.
-- ============================================================================

INSERT INTO employees
(first_name,last_name,gender,date_of_birth,email,phone,job_title,salary,
hire_date,employee_status,department_id)
VALUES
('Sneha','Joshi','Female','1998-08-10',
'sneha.joshi@gmail.com',
'9876543210',
'Software Tester',
42000,
'2024-02-01',
'Active',
2);

-- ============================================================================
-- Bug 3 : Negative Salary
-- Expected : CHECK constraint should reject this record.
-- ============================================================================

INSERT INTO employees
(first_name,last_name,gender,date_of_birth,email,phone,job_title,salary,
hire_date,employee_status,department_id)
VALUES
('Ramesh','Kale','Male','1996-11-22',
'ramesh.kale@gmail.com',
'9998887772',
'Developer',
-25000,
'2024-01-10',
'Active',
3);

-- ============================================================================
-- Bug 4 : Invalid Department ID
-- Expected : Foreign Key constraint should reject this record.
-- ============================================================================

INSERT INTO employees
(first_name,last_name,gender,date_of_birth,email,phone,job_title,salary,
hire_date,employee_status,department_id)
VALUES
('Neha','Patel','Female','1998-09-12',
'neha.patel@gmail.com',
'9998887773',
'QA Analyst',
50000,
'2024-01-15',
'Active',
999);

-- ============================================================================
-- Bug 5 : Future Hire Date
-- Expected : Business validation query should detect this.
-- ============================================================================

INSERT INTO employees
(first_name,last_name,gender,date_of_birth,email,phone,job_title,salary,
hire_date,employee_status,department_id)
VALUES
('Ajay','More','Male','1997-02-10',
'ajay.more@gmail.com',
'9998887774',
'QA Engineer',
45000,
'2035-01-01',
'Active',
2);

-- ============================================================================
-- Bug 6 : Future Date of Birth
-- Expected : Business validation query should detect this.
-- ============================================================================

INSERT INTO employees
(first_name,last_name,gender,date_of_birth,email,phone,job_title,salary,
hire_date,employee_status,department_id)
VALUES
('Pooja','Patil','Female','2030-01-01',
'pooja.future@gmail.com',
'9998887775',
'HR',
40000,
'2024-03-15',
'Active',
4);

-- ============================================================================
-- Bug 7 : Employee Younger Than 18
-- Expected : Validation query should detect this.
-- ============================================================================

INSERT INTO employees
(first_name,last_name,gender,date_of_birth,email,phone,job_title,salary,
hire_date,employee_status,department_id)
VALUES
('Karan','Shinde','Male','2012-05-10',
'karan.shinde@gmail.com',
'9998887776',
'Intern',
18000,
'2025-01-01',
'Active',
1);

-- ============================================================================
-- Bug 8 : Empty First Name
-- Expected : Data quality issue.
-- ============================================================================

INSERT INTO employees
(first_name,last_name,gender,date_of_birth,email,phone,job_title,salary,
hire_date,employee_status,department_id)
VALUES
('','Patil','Male','1997-03-15',
'empty.firstname@gmail.com',
'9998887777',
'Developer',
50000,
'2024-02-10',
'Active',
2);

-- ============================================================================
-- Bug 9 : Empty Last Name
-- ============================================================================

INSERT INTO employees
(first_name,last_name,gender,date_of_birth,email,phone,job_title,salary,
hire_date,employee_status,department_id)
VALUES
('Akash','','Male','1996-02-10',
'akash.lastname@gmail.com',
'9998887778',
'Developer',
50000,
'2024-01-05',
'Active',
2);

-- ============================================================================
-- Bug 10 : Invalid Email Format
-- ============================================================================

INSERT INTO employees
(first_name,last_name,gender,date_of_birth,email,phone,job_title,salary,
hire_date,employee_status,department_id)
VALUES
('Meena','Jadhav','Female','1995-07-15',
'meenajadhavgmail.com',
'9998887779',
'QA',
43000,
'2024-04-15',
'Active',
3);

-- ============================================================================
-- Bug 11 : Invalid Phone Number Length
-- ============================================================================

INSERT INTO employees
(first_name,last_name,gender,date_of_birth,email,phone,job_title,salary,
hire_date,employee_status,department_id)
VALUES
('Vikas','More','Male','1994-06-12',
'vikas.more@gmail.com',
'12345',
'Tester',
42000,
'2024-02-02',
'Active',
2);

-- ============================================================================
-- Bug 12 : Phone Contains Characters
-- ============================================================================

INSERT INTO employees
(first_name,last_name,gender,date_of_birth,email,phone,job_title,salary,
hire_date,employee_status,department_id)
VALUES
('Nikita','Deshmukh','Female','1997-12-12',
'nikita.d@gmail.com',
'98AB543210',
'QA',
42000,
'2024-03-20',
'Active',
5);

-- ============================================================================
-- Bug 13 : Invalid Employee Status
-- ============================================================================

INSERT INTO employees
(first_name,last_name,gender,date_of_birth,email,phone,job_title,salary,
hire_date,employee_status,department_id)
VALUES
('Rohit','Kulkarni','Male','1995-08-20',
'rohit.k@gmail.com',
'9998887780',
'Developer',
47000,
'2024-02-01',
'Working',
2);

-- ============================================================================
-- Bug 14 : Invalid Gender
-- ============================================================================

INSERT INTO employees
(first_name,last_name,gender,date_of_birth,email,phone,job_title,salary,
hire_date,employee_status,department_id)
VALUES
('Anita','Patil','Unknown','1996-05-05',
'anita@gmail.com',
'9998887781',
'Tester',
43000,
'2024-01-12',
'Active',
3);

-- ============================================================================
-- Bug 15 : Salary Outside Business Range
-- ============================================================================

INSERT INTO employees
(first_name,last_name,gender,date_of_birth,email,phone,job_title,salary,
hire_date,employee_status,department_id)
VALUES
('Sagar','Joshi','Male','1996-09-09',
'sagar.j@gmail.com',
'9998887782',
'Developer',
250000,
'2024-02-15',
'Active',
1);