SELECT e.name AS employee_name, d.department_name, l.location_name
FROM employees e
INNER JOIN departments d ON e.department_id = d.dept_id
INNER JOIN locations l ON d.dept_id = l.department_id;
