-- DML COmmands
create database if not exists arbor_june_2026;
use arbor_june_2026;

 
-- Creating Table
create table students(stud_id tinyint not null unique,
					stud_name varchar(100) not null,
					age tinyint check(age>21),
					address varchar(255) default 'Unknown',
					mobile char(10) unique not null
					);
                    
select * from students;

-- Insert command
-- General Orders
insert into students values(
1,'xyz', 26, 'Pune', '9012345678');

select * from students;

-- Specified Order
insert into students (address, mobile, age, stud_id, stud_name) values
('Baner', '2031564897', 22, 2, 'abc');

insert into students (address, age, stud_id, stud_name) values
('Baner', 22, 2, 'abc');
-- You have to mention all the columns


select * from students;

-- missing values (general order)
insert into students values (3, Null, 26, 'Baner' ,'0987654321');
-- error


-- Multiple insertions
insert into students values 
(3, 'ved', 27, 'chennai','0000000000'),
(4,'Tej',26,'Nasik','1111111111'),
(5,'Sai',22,'Pune','2211221122');

select * from students;
 
-- Update 
set sql_safe_updates =0;
update students set age = 25
where stud_name = 'ved';
select*from students;

-- It will update complete columns value as 100 (here)
update students set age=100;

-- Diff between truncate,drop, delete(Interview Question)

-- delete
delete from students  where stud_name ='abc';
select * from students;

delete from students;

