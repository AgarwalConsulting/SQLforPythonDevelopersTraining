SELECT e.*
FROM employees e
LEFT JOIN departments d
ON e.department_id = d.dept_id
WHERE d.dept_id IS NULL;
