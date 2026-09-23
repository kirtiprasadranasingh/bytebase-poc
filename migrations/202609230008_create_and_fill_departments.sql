-- First, we create the new table
CREATE TABLE departments (
    id INT PRIMARY KEY,
    department_name VARCHAR(100)
);

-- Second, we insert data into it immediately
INSERT INTO departments (id, department_name)
VALUES 
(1, 'Engineering'),
(2, 'Human Resources');
