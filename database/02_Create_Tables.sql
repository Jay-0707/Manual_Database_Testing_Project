/*
===============================================================================
 Project Name : Manual Database Testing Project
 File Name    : 02_Create_Tables.sql
 Author       : Jay Shinde
 Description  : This script creates all database tables required for the
                Manual Database Testing Project.
 Database     : ManualDatabaseTesting
===============================================================================
*/
-- ============================================================================
-- Select Database
-- ============================================================================

USE ManualDatabaseTesting;


-- ============================================================================
-- Drop Tables
-- ============================================================================

DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;


-- ============================================================================
-- Create Departments Table
-- Stores department information.
-- ============================================================================ 

CREATE TABLE departments(department_id INT primary key auto_increment,
						department_name VARCHAR(50) NOT NULL UNIQUE,
                        department_code VARCHAR(10) NOT NULL UNIQUE,
                        location VARCHAR(100) NOT NULL,
                        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP);


-- ============================================================================
-- Create Employees Table
-- ============================================================================

CREATE TABLE employees
(
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    gender ENUM('Male','Female','Other') NOT NULL,
    date_of_birth DATE NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(15) UNIQUE,
    job_title VARCHAR(100) NOT NULL,
    salary DECIMAL(10,2) NOT NULL CHECK (salary > 0),
    hire_date DATE NOT NULL,
    employee_status ENUM('Active','Inactive') DEFAULT 'Active',
    department_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_employee_department
	FOREIGN KEY (department_id)
	REFERENCES departments(department_id)
);

-- ============================================================================
-- Verify Tables
-- ============================================================================
DESCRIBE departments;
DESCRIBE employees;
