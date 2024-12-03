SELECT e1.name AS employee1, e2.name AS employee2
FROM employees e1
INNER JOIN employees e2
ON e1.department_id = e2.department_id
WHERE e1.emp_id != e2.emp_id;
