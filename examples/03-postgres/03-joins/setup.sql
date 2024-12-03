CREATE TABLE employees (
    emp_id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    department_id INT
);

INSERT INTO employees (name, department_id)
VALUES
('Alice', 1),
('Bob', 2),
('Charlie', NULL),
('David', 3);

CREATE TABLE departments (
    dept_id SERIAL PRIMARY KEY,
    department_name VARCHAR(50)
);

INSERT INTO departments (department_name)
VALUES
('HR'),
('Finance'),
('Engineering'),
('Marketing');
