SELECT e.emp_id, e.name, d.department_name
FROM employees e
INNER JOIN departments d
ON e.department_id = d.dept_id;
