-- Stored Procedures
/* 
A stored procedure is a set of  precompile statements saved directly 
in the database server.alterInstead of writing and executing the complex 
queries repeatedly from your application, you save the logic once on the 
database and trigger(calling) it with a simple call

The basic syntax for this:
To write procedures, you mnust temporarily change MySQL's default
statement separator (The semicolon ;) to something else(like // or $$).
This prevents MySql from trying to execute the inner queries before the
procedure is completely defined.
*/
/*
 Delimiter // -- Tell MySql to look for // to finish the block of code
 create procedure Proc_name() -- create the new procedure name
 begin                   -- body of procedure starts
 select * from table_name;
 end //
 delimiter ;  -- resets the statement separator back to standard semicolon
 */
 -- Working with parameters
 /*
 MySql supports three types of parameters:
 1. IN(Default) : Passes a values from application into the procedure
 2. INOUT : Passes asn initial value in, modifies it inside the procedure and 
			sense the updated value  back out
 3. OUT : Passes a value from the procedure back to the application.
 */
 
 
 use companydb;
 show tables;
 
 select * from employees;
 
 delimiter //
 
 create procedure GetEmployeeData (IN emp_id int)
 BEGIN
 select * from employees e
 where e.empid = emp_id;
 END //

 delimiter ;
 
 -- call the stored procedure
 CALL GetEmployeeData(2, @emp_count); 
 
-- @ wala variable is session variable remember this
-- stored procedure is created at server database
-- drop procedure if exists GetEmployeeData;
 
 
 /* AN OUTT extracts a value from the database and passes back it 
 to the session variable */
 -- drop procedure GetEmployeeCount;
 Delimiter //
 
 create procedure GetEmployeeCount ( In dept_id int,
 out total_count int)
 
 Begin
 select count(*)
 into total_count 
 from employees e
 where e.dept_id = dept_id;
 End //
 
 delimiter ;
 
 call GetEmployeeCount(1,@emp_count);
 
 -- select the session variable to see the result
 
 select @emp_count as Total_emp;
 
 
 -- INOUT
 /* INOUT procedure will accept a value , updates that same 
 value inside the same procedure and returns it*/
 
 delimiter //
 create procedure CalculateSalary(
 In emp_id int, 
 inout Bonus decimal(10,2)
 )
 Begin
 Update employees e set salary= salary + bonus
 where e.empid = emp_id;
 
 -- Fetch that updated value in inout variable
 select salary into Bonus
 from employees e
 where e.empid = emp_id;
 end //
 
 delimiter ;
 
 drop procedure CalculateSalary;
 
 -- Set a session variable with bonus amount
 
set  @salary_var = 5000;

select * from employees;
set sql_safe_updates = 0;

call CalculateSalary(1, @salary_var);

select @salary_var  as ayesha_new_salary;


 
 
 
 