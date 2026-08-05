-- set operations
-- union
-- union all

create database demo;
use demo;

create table students(
sid tinyint,
sname varchar(100)
);

insert into students values

	(1,'Ved'),
	(2,'Tej'),
	(3,'Kalyan'),
	(4, 'Amresh')
;

select * from students;

create table students_new
(sid tinyint, sname varchar(100));

insert into students_new values
(100,'abc'),
(101,'def'),
(102,'xyz');

select * from students_new;

-- union all
-- duplicate records remain same
-- in union, only uniques records wil be shown
 
select * from students 
union
select * from students_new;


select * from students 
union all
select * from students_new;









