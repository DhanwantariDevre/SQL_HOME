
create database arbor_june_2026;

create database if not exists arbor_june_2026;

create database if not exists demo;

-- specify the database
use demo;
-- Create  a table student
create table if not exists students(
stud_id tinyint not null unique,
stud_name varchar(100) not null,
age tinyint check(age>21),
address varchar(255) default 'Unknown',
mobile char(10) unique not null
);

select * from students;
describe students;

 use demo;
 insert into students values(1, 'Divya', 22, 'Pune', '9021458596');
 insert into students values(1, 'Manav', 22, 'Pune', '9021458596'); -- error
 
 -- NOT NULL
 insert into students values(2, Null, 22, 'Mumbai', '9903255633'); -- error
 
 -- check constraint
 insert into students values(4, 'Omkar', 17, 'Delhi','5698523654');-- error
 
 -- default constraint
 insert into students (stud_id, stud_name, age, mobile)
 values(5, 'Unnati', 22, '1234567890');
 
 select * from students;
 
 
 -- **ALTER** (Modify the structure)
 -- Adding new column
 
 alter table students add column email varchar(50);
describe students;


 -- Chnangiing the datatype of the column
 alter table students modify column email varchar(255);
 
 
 -- Change the name of a column
 alter table students change column mobile phone_number char(20);
 
 
 -- Dropping a column
 alter table students drop column email;
 


 -- Dropping a constraint
 desc students;
 alter table students drop constraint mobile;
 
 
 -- Add a constraint
 alter table students add constraint unique(phone_number);
 desc students; 

 
 
 -- unique
 alter table students add constraint unique(phone_number);
 desc students;
 alter table students add constraint `phone_unique` unique(phone_number);
 desc students;
 
 
 -- not null
 alter table students modify column stud_name varchar(100) null;
 desc students;
 
 
 
 -- add back 
 alter table students modify stud_name varchar(100) Not null;
 desc students;
 
 
 
 -- deafault
  alter table students modify column address varchar(255) default null ;
desc students;

 alter table students modify column address varchar(255) default 'pta nhi';
desc students;

--  check 
alter table students drop constraint student_chk_1;


alter table students
add constraint chk_age Check (age>21);
desc students;

select * from students;

-- Rename
rename table students to stud_table;
rename table stud_table to `1234`;

-- truncate
select * from `1234`; 
truncate `1234`;


select * from `1234`; 

-- drop 
drop table `1234`;

select * from `1234`; 

drop table if exists `1234`;
drop database demo;