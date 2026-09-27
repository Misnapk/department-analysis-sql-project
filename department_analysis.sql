CREATE DATABASE department3;
USE department3;

-- Create Department Table
CREATE TABLE Department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(100),
    location VARCHAR(100)
);

-- Insert Department Data
INSERT INTO Department VALUES 
(1, 'IT', 'Kochi'),
(2, 'HR', 'Thrissur'),
(3, 'Finance', 'Calicut'),
(4, 'Marketing', 'Kottayam');


-- Display Department Table
SELECT * FROM Department;


-- Create Employee Table
CREATE TABLE Employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100),
    dept_id INT,
    salary DECIMAL(10,2),
    FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
);
 
-- Insert Employee Data
INSERT INTO Employee VALUES
(101, 'Anu', 1, 50000),
(102, 'Rahul', 1, 60000),
(103, 'Meera', 1, 55000),
(104, 'Arun', 2, 40000),
(105, 'Neha', 2, 45000),
(106, 'Akhil', 3, 70000),
(107, 'Diya', 3, 65000),
(108, 'John', 3, 75000),
(109, 'Anjali', 3, 60000);

-- Display Employee Table
SELECT * FROM Employee;


-- Department Analysis
SELECT 
    Department.dept_name AS DepartmentName,
    Department.location AS Location,
    COUNT(Employee.emp_id) AS EmployeeCount, 
    AVG(Employee.salary) AS AverageSalary,
    MAX(Employee.salary) AS MaximumSalary,
    MIN(Employee.salary) AS MinimumSalary
FROM Department
JOIN Employee
    ON Department.dept_id = Employee.dept_id
GROUP BY 
    Department.dept_id,         
    Department.dept_name,
    Department.location
HAVING COUNT(Employee.emp_id) > (     
    SELECT AVG(employee_count)       
    FROM (
        SELECT COUNT(*) AS employee_count  
        FROM Employee
        GROUP BY dept_id
    ) AS dept_counts
);

                       
                         
                         
                 