SELECT SUM(salary) AS total_slack_salary
FROM employees
WHERE id IN (
    SELECT employee_id
    FROM projects
    GROUP BY employee_id
    HAVING COUNT(CASE WHEN End_dt IS NOT NULL THEN 1 END) = 0
);
