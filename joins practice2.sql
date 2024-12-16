SELECT 
    t.title, AVG(s.salary) AS avg_salary
FROM
    titles t
        JOIN
    salaries s ON t.emp_no = s.emp_no
GROUP BY t.title
HAVING AVG(s.salary) < 75000
ORDER BY avg_salary DESC;