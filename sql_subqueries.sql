
create database if not exists companydb;

-- drop database companydb;
use companydb;


-- create employees table 
create table if not exists employees(
empid int,
name varchar(50),
salary decimal(10,2),
dept_id int);


-- create departments table
create table if not exists departments(
dept_id int,
dept_name varchar(50));


-- insert data into employees
insert into employees values
(1,'Ayesha',50000,1),
(2,'Rahul',60000,2),
(3,'Meera',45000,1),
(4,'Karan',70000,3),
(5,'Neha',55000,2);
select * from employees;

-- drop table employees;
-- Insert the data into departments
insert into departments values
(1,'HR'),
(2,'IT'),
(3,'Finance');

select * from departments;
select * from employees;



-- Employees earning above average salary
select * from employees
where salary > (select avg(salary) from employees);


-- Employees which are in IT or Finance department
SELECT * FROM employees
WHERE dept_id IN (SELECT dept_id FROM departments
WHERE dept_name IN ('IT' , 'Finance'));


-- Employees which are from HR department 
SELECT * FROM employees 
WHERE dept_id IN (SELECT dept_id FROM departments 
WHERE dept_name = 'HR');
            
            
-- where name is Meera and department is HR
select * from employees
where dept_id in 
(select dept_id from departments where dept_name = 'HR')
and name = 'Meera';
            
            
-- Find employees who's dept_id and salary matches 
-- with rahul's department and salary 

select * from employees 
where (dept_id, salary)=
(select dept_id, salary from employees where name="Rahul");

describe departments;


-- drop table employees;
-- drop table departments;
-- drop database companydb; 


-- correlated subquery
-- find employees earning above their department avg salary

 -- Find employees earning above their department avg salary 
 -- you cant find e.dept_id whenever the outer query is solved and 
 -- So that first you have to solve inner query then outer then will 
 -- find e.dept_id
 
 select name,dept_id 
 from employees e
 where salary >
 (select avg(salary) from employees where dept_id = e.dept_id);

---------------------------------------------------------------------


select * , salary*0.2 as bonus from employees
where bonus> 2000; -- error bcoz of order of execution


-- subquery in from clause
select * from (select *, salary * 0.2 as bonus from employees) as sub
where bonus > 10000;


-- Find the employees who has second highest salary in company 
select * from employees
order by salary desc
limit 1 offset 1;
-- nth highest is the offset values
-- interview imp question

-- Using subquery
select * from employees  -- all records
where salary < (select max(salary) from employees -- 60000
where salary < (select max(salary) from employees)); -- 70000


use learndb;
-- multiple table usecase
-- rented movies
select * from movies;
select * from members;

select * from movies 
where id in (select movieid from members);


-- movies not rented
select * from movies 
where id not in (select ifnull(movieid,0) from members);


-- using correlated subqueries
-- rented movies
select * from movies
where exists (select * from members
where movies.id = members.movieid);







