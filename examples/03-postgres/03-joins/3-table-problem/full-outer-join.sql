SELECT e.name AS employee_name, d.department_name
FROM employees e
FULL OUTER JOIN departments d
ON e.department_id = d.dept_id;
