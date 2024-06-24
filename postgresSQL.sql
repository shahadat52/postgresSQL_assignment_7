-- Active: 1718688710192@@127.0.0.1@5432@company_db
-- Active: 1718688710192@@127.0.0.1@5432@company_db
CREATE DATABASE company_db;


CREATE TABLE departments(
    department_id SERIAL PRIMARY KEY,
    department_name VARCHAR(50) NOT NULL
);

INSERT INTO departments (department_name) VALUES ('Engineering'),
('Marketing'),
('Finance');
SELECT * FROM departments;
DROP TABLE departments

CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    employee_name VARCHAR(50) NOT NULL,
    age INTEGER NOT NULL,
    email VARCHAR(100) NOT NULL,
    department_id INTEGER REFERENCES "departments"(department_id),
    salary INTEGER NOT NULL,
    status VARCHAR(50)
);

INSERT INTO employees (employee_id, employee_name, age, email, department_id, salary, status) VALUES 
(1, 'Alice', 30, 'alice@example.com', 1, 60000, NULL),
(2, 'Bob', 35, 'bob@example.net', 2, 65000, NULL),
(3, 'Charlie', 28, 'charlie@google.com', 1, 55000, NULL),
(4, 'David', 33, 'david@yahoo.com', 2, 62000, NULL),
(5, 'Eve', 31, 'eve@example.net', 3, 58000, NULL),
(6, 'Frank', 29, 'frank@example.com', 1, 59000, NULL),
(7, 'Grace', 34, 'grace@google.com', 2, 63000, NULL),
(8, 'Henry', 32, 'henry@yahoo.com', 3, 57000, NULL),
(9, 'Ivy', 27, 'ivy@gmail.com', 1, 56000, NULL),
(10, 'Jack', 36, 'jack@example.net', 2, 64000, NULL),
(11, 'Karen', 29, 'karen@gmail.com', 3, 60000, NULL),
(12, 'Liam', 33, 'liam@gmail.com', 1, 59000, NULL),
(13, 'Mia', 31, 'mia@yahoo.com', 2, 62000, NULL),
(14, 'Nora', 28, 'nora@yahoo.com', 3, 57000, NULL),
(15, 'Oliver', 35, 'oliver@example.net', 1, 61000, NULL),
(16, 'Penelope', 30, 'penelope@google.com', 2, 63000, NULL),
(17, 'Quinn', 32, 'quinn@google.com', 3, 59000, NULL),
(18, 'Rachel', 27, 'rachel@gmail.com', 1, 55000, NULL),
(19, 'Sam', 34, 'sam@example.net', 2, 64000, NULL),
(20, 'Taylor', 31, 'taylor@yahoo.com', 3, 58000, NULL);

-- Retrieve all employees with a salary greater than 60000
SELECT * from employees 
    WHERE salary > 60000 ;

-- Retrieve the names of employees using a limit of 2, starting from the 3rd employee.
SELECT * FROM employees
    LIMIT 2 OFFSET 2;

-- Calculate and display the average age of all employees.
SELECT round(avg(age), 2) FROM employees;

-- Retrieve the names of employees whose email addresses contain 'example.com', 'example.net', or 'google.com'.
SELECT employee_name FROM employees 
  WHERE email LIKE '%example.com%' 
    OR email LIKE '%example.net%' 
    OR email LIKE '%google.com%';

-- Retrieve the names of all employees who belong to the department titled 'Engineering'.

SELECT * FROM employees 
    JOIN "departments" USING(department_id)
        WHERE department_name = 'Engineering';

-- Update the status of the employee with the highest salary to 'Promoted'
UPDATE employees set status = 'Promoted'
    WHERE salary = (SELECT  MAX(salary) FROM employees);

-- Retrieve the department name and the average salary of employees in each department:
SELECT department_name, round(avg(salary), 2) as avg_salary FROM employees
 JOIN "departments" USING(department_id)
 GROUP BY department_name
 ORDER BY department_name ASC;
 


