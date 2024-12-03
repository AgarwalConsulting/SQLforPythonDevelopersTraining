SELECT d.department_name, e.name AS first_employee
FROM departments d
LEFT JOIN LATERAL (
    SELECT name
    FROM employees
    WHERE employees.department_id = d.dept_id
    ORDER BY name LIMIT 1
) e ON true;
