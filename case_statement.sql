-- case statements

use employees;

select min(salary) as min_salaray, max(salary) as max_salary from salaries;

-- searched case statement

SELECT 
    emp_no,
    salary,
    CASE
        WHEN salary > 10000 THEN 'Low Paid'
        WHEN salary BETWEEN 10000 AND 20000 THEN 'Medium Paid'
        ELSE 'Highly Paid'
    END AS salary_categories
FROM
    salaries;
    
    
-- simple search statement
SELECT 
    emp_no,
    first_name,
    CASE gender
        WHEN 'M' THEN 'Male'
        WHEN 'F' THEN 'Female'
        ELSE 'Other'
    END AS gender_category
FROM
    employees;
    




