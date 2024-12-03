CREATE TABLE employees (
    emp_id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    department_id INT
);

CREATE TABLE departments (
    dept_id SERIAL PRIMARY KEY,
    department_name VARCHAR(50)
);

CREATE TABLE locations (
    location_id SERIAL PRIMARY KEY,
    department_id INT,
    location_name VARCHAR(50)
);

-- Employees table
INSERT INTO employees (name, department_id)
VALUES
('Alice', 1),
('Bob', 2),
('Charlie', 3);

-- Departments table
INSERT INTO departments (department_name)
VALUES
('HR'),
('Finance'),
('Engineering');

-- Locations table
INSERT INTO locations (department_id, location_name)
VALUES
(1, 'New York'),
(2, 'San Francisco'),
(3, 'Chicago');
