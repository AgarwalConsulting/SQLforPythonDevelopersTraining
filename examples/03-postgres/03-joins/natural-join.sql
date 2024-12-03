-- Precondition: Rename column for NATURAL JOIN
-- ALTER TABLE employees RENAME COLUMN department_id TO dept_id;

SELECT *
FROM employees
NATURAL JOIN departments;
