/*
===============================================================================
 Project Name : Manual Database Testing Project
 File Name    : 03_Insert_Test_Data.sql
 Author       : Jay Shinde
 Description  : This script inserts test data into the database tables
				required for the Manual Database Testing Project.
 Database     : ManualDatabaseTesting
===============================================================================
*/

USE ManualDatabaseTesting;

-- ============================================================================
-- Insert Department Test Data
-- ============================================================================
INSERT INTO departments(department_name,department_code,location) 
VALUES("Human Resources","HR","Pune"),
	  ("Information Technology","IT","Mumbai"),
	  ( "Finance","FIN","Chennai"),
	  ( "Sales","SAL","Bangalore"),
	  ("Marketing","MKT","Kochi"),
	  ("Operations","OPS","Satara"),
	  ("Customer Support","CS","Hyderabad"),
	  ("Research & Development","RND","Kolkata");



-- ============================================================================
-- Insert Employees Test Data
-- ============================================================================
INSERT INTO employees
(first_name,last_name,gender,date_of_birth,email,phone,job_title,salary,hire_date,employee_status,department_id)
VALUES
('Jay','Shinde','Male','2000-05-15','jay.shinde@gmail.com','9876543210','QA Engineer',35000,'2025-01-10','Active',2),
('Rahul','Patil','Male','1998-08-20','rahul.patil@gmail.com','9876543211','Software Engineer',55000,'2024-05-12','Active',2),
('Sneha','Kulkarni','Female','1999-02-14','sneha.k@gmail.com','9876543212','HR Executive',30000,'2025-03-18','Active',1),
('Amit','Joshi','Male','1997-11-11','amit.j@gmail.com','9876543213','Accountant',45000,'2023-06-01','Active',3),
('Priya','Deshmukh','Female','1998-04-25','priya.d@gmail.com','9876543214','Sales Executive',40000,'2024-07-15','Active',4),
('Rohit','Sharma','Male','1996-09-05','rohit.s@gmail.com','9876543215','Marketing Executive',42000,'2023-11-10','Active',5),
('Neha','Patel','Female','1999-12-22','neha.p@gmail.com','9876543216','Support Engineer',32000,'2025-02-11','Active',7),
('Karan','Mehta','Male','1995-01-17','karan.m@gmail.com','9876543217','Operations Manager',65000,'2022-10-01','Active',6),
('Anjali','Verma','Female','1997-06-30','anjali.v@gmail.com','9876543218','QA Tester',38000,'2024-04-09','Active',2),
('Vikas','Singh','Male','1998-03-12','vikas.s@gmail.com','9876543219','Developer',60000,'2023-08-20','Active',2),
('Pooja','Yadav','Female','1999-10-08','pooja.y@gmail.com','9876543220','Finance Analyst',48000,'2024-09-15','Active',3),
('Arjun','Nair','Male','1996-12-01','arjun.n@gmail.com','9876543221','Sales Manager',70000,'2022-05-20','Inactive',4),
('Meera','Iyer','Female','1998-07-09','meera.i@gmail.com','9876543222','HR Manager',62000,'2021-11-30','Active',1),
('Saurabh','Jain','Male','1997-02-18','saurabh.j@gmail.com','9876543223','DevOps Engineer',68000,'2023-02-14','Active',2),
('Komal','Gupta','Female','1999-01-29','komal.g@gmail.com','9876543224','Business Analyst',52000,'2024-01-18','Active',6),
('Deepak','Mishra','Male','1995-04-04','deepak.m@gmail.com','9876543225','Project Manager',90000,'2021-08-01','Active',8),
('Nikita','Rao','Female','2000-09-13','nikita.r@gmail.com','9876543226','Research Associate',47000,'2025-05-06','Active',8),
('Akash','Pawar','Male','1998-06-06','akash.p@gmail.com','9876543227','Support Executive',31000,'2024-03-19','Inactive',7),
('Riya','Shah','Female','1999-08-21','riya.s@gmail.com','9876543228','UI Designer',50000,'2023-12-01','Active',5),
('Manish','Kumar','Male','1996-05-27','manish.k@gmail.com','9876543229','System Administrator',58000,'2022-09-25','Active',2);


-- ============================================================================
-- Verify Department Data
-- ============================================================================
SELECT * FROM departments; 
SELECT COUNT(*) AS Total_Departments FROM departments;

SELECT * FROM employees; 
SELECT COUNT(*) AS Total_Employees FROM employees;