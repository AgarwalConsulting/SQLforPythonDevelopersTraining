SELECT d.*
FROM employees e
RIGHT JOIN departments d
ON e.department_id = d.dept_id
WHERE e.department_id IS NULL;
