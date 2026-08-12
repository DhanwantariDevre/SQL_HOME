use learndb;
select * from peopledata;	


-- find customers whose first_name is starting with 'A' and 
-- last name starts with 'R'
select * from peopledata 
where substring_index(name,' ',1) like "A%" and 
substring_index(name,' ',-1) like 'R%';


-- Which states have min 10 customers
select substring_index(address,',',-1) as state, count(*)
from peopledata
group by state 
having count(*) >= 10;


-- in which quarter the revenue is high?
select * from peopledata;

SELECT 
    QUARTER(reg_date) AS quarter_,
    SUM(purchase_amount) AS revenue
FROM
    peopledata
GROUP BY quarter_
ORDER BY revenue DESC
LIMIT 1;


SELECT SUM(PURCHASE_AMOUNT) AS SUM FROM PEOPLEDATA;


-- How many null values are there in rating column
select count(*)
from peopledata 
where rating is null; 

-- Create a column which is month name of reg_date
select *, monthname(reg_date) as Month_name
from peopledata;


-- what is the avg age of each customer gender wise 
select gender, avg(age)
from peopledata
group by gender;


-- HOW MANY EMPLOYEE ARE WORKING IN EACH DEPARTMENT
SELECT * FROM EMPLOYEES;

SELECT DEPT_NO, COUNT(EMP_NO) AS TOTAL_EMPLOYEES
FROM DEPT_EMP
GROUP BY DEPT_NO;

-- 2.With join

SELECT 
    dept_name, COUNT(*)
FROM
    employees e
        INNER JOIN
    dept_emp d ON e.emp_no = d.emp_no
        INNER JOIN
    departments de ON d.dept_no = de.dept_no
GROUP BY dept_name;



-- FREQUENCY OF EACH TITLE
 
 
 -- 1.without join 
 SELECT * FROM TITLES;
 
 SELECT title, COUNT(*) AS FREQ
 FROM TITLES
 group by title;

-- 2. With join

select title, count(*) as freq
from titles
group by title
order by freq desc;



-- FIND OUT THE NUMBER OF MANAGER FROM EACH DEPARTMENT

-- 1. without join(no name will be printed)
select * from dept_emp;

select dept_no,count(*) 
from dept_emp
group by dept_no;

-- 2. With join(It also prints the name)

select dept_no, dept_name , count(*) as freq
from departments
inner join dept_manager
using(dept_no)
group by dept_no;



-- FIND AVERAGE SALARY FROM EACH DEPARTMENT

select dept_name, avg(salary)
from employees
inner join dept_emp using(emp_no)
inner join departments using(dept_no)
inner join salaries using(emp_no)
group by dept_name;
-- order by avg(salary) desc;

 

