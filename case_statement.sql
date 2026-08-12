-- case statements

use employees;

select min(salary) as min_salaray, max(salary) as max_salary from salaries;

-- case statement

select *,
(case when salary < 5000 then 'low_paid'
when salary between 5000 and 15000 then 'average_paid'
else 'high_paid' end) as salary_category
from myemp;


select * from users;

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
    
-- Derived columns(temporary columns)
select * from myemp;


-- specified columns
select Emp_id, first_name, Salary
from myemp;

-- Derived columns - creating a new column based on
-- existing column
-- math
-- inbuilt datatype functionForeign Keys
-- case statement 


-- math
select *, salary* 0.2 as bonus from myemp;
select * from myemp;


-- in built data type function
SELECT 
    *,
    MONTH(hire_date) AS month_,
    MONTHNAME(hire_date) AS month_name
FROM
    myemp;

SELECT 
    *, CONCATE(first_name, ' ', last_name) AS full_name
FROM
    myemp;









