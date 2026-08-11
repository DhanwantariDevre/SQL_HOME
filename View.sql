
-- ====================================================
-- Database Creation
-- ====================================================

create database if not exists Collegedb;
use collegedb;

-- ====================================================
-- Table creation
-- ====================================================

create table department(
deptid int primary key,
deptname varchar(50) not null
);

CREATE TABLE Employee (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50) NOT NULL,
    Salary DECIMAL(10,2),
    DeptID INT,
    FOREIGN KEY (DeptID)
	REFERENCES Department(DeptID)
    -- compulsory to write reference while assign the foreign key
);

INSERT INTO Department (DeptID, DeptName)
VALUES
(101,'HR'),
(102,'Finance'),
(103,'IT'),
(104,'Marketing');

INSERT INTO Employee (EmpID, EmpName, Salary, DeptID)
VALUES
(1,'Rahul',50000,103),
(2,'Priya',45000,101),
(3,'Amit',60000,102),
(4,'Sneha',70000,103),
(5,'Vikas',55000,104);

select * from employee;

select * from department;

-- ====================================================================
-- simple view
-- diaplays employee name and salary
-- ====================================================================

create view EmployeeView as
select empname, salary
from employee;

-- use the view
select * from EmployeeView;

-- ========================================================
-- view the condition
-- employees earning more than 50000
-- ========================================================

create view HighSalaryEmployees as
select empid, empname, salary
from employee
where salary > 50000;

-- use the view
select * from highsalaryemployees;

-- ============================================================
-- view using Join
-- combine employee and department
-- ============================================================

create view EmployeeDepartmentView as
select 
e.empid, e.empname, e.salary, d.deptname
from employee e
inner join department d
on e.deptid = d.deptid;

-- use the view
select * from employeedepartmentview;

-- =============================================================
-- create view for updates
-- =============================================================

create view empbasicview as
select empid,empname,salary
from employee;

select * from empbasicview;

-- update through view
update empbasicview
set salary = 80000
where empid=1;

select * from empbasicview;

-- verify update in table
select * from employee;

-- ========================================================================================
-- Interview question
/*If i change something in view is it applicable to the original table or not
because a view is just a saved query of a table and does not store its own data
so any modification made through it bypass the view and alter the base table directly*/
-- =========================================================================================

-- Updating the view will automatically update the underlying cource table
-- If u update the view the chnages will be applicable for the complete table (source or parent table)

select * from department;
select * from employee;
-- to check the updated changes in the empoyee table

-- ============================================================
-- Replace existing view
-- ============================================================
select * from employeeview;
-- before repacing only two colmns were there

create or replace view employeeview as 
select empid, empname, salary
from employee;

-- after replacing with empid 
select * from employeeview;

-- =====================================================
-- drop the view
-- =====================================================

drop view employeeview;

-- show all view in database
-- ======================================================

show full tables
where table_type= 'VIEW' ; -- VIEW SHOULD BE IN CAPITAL

-- ENTER THE VIEW IN CAPITAL SHOWS THE OUTPUT OTHERWISE NO OUTPUT SHOWN


