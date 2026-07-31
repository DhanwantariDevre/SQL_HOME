use learndb;
select * from myemp;


-- where clause
-- Filter employees from dept_id 90
select * from myemp
where dep_id=90;

-- Filter employees from dept idn90
-- and salary is greater than 20k
select * from myemp
where dep_id=90 and salary > 20000;

-- retrieve emps from dep_id 10,100,60,50
-- or emp salary is greater than 15k

select distinct dep_id from myemp;

select * from myemp
where dep_id in (10,100,60,50) or salary >15000;


-- retrieve emps not from dep_id 10,100,60,50
-- or emp salary is greater than 15k

SELECT 
    *
FROM
    myemp
WHERE dep_id NOT IN (10 , 100, 60, 50) OR 
salary > 15000;

-- retrieve employees salary in the range 10000 to 20000
select * from myemp
where salary between 10000 and 20000;
 -- -----------------------------------------------------

-- 1. Find the no. of female in peopledata

select count(*) from peopledata
where gender = 'F';

-- 2. Retrieve customers whose purchase amount is in the 
-- range of 10 to 50k

select * from peopledata 
where purchase_amount between 10000 and 50000;


-- 3. Retrieve customers whose rating is greater than 3 alter
-- and gender is male 
-- and purcgase > 50k

select * from peopledata 
where (rating >3) and 
(gender = 'M' or
purchase_amount > 50000);


-- 4. Find out average discount for subscribed customers

select distinct is_subscribed from peopledata;

select avg(discount) from peopledata
where is_subscribed = 1;


-- 5. find out min,max,avg purchase amount of non-subscribed 
-- customers
 
 select min(purchase_amount) as min_purchase, 
 max(purchase_amount) as max_purchase,
 avg(purchase_amount) as avg_purchase
 from peopledata
 where is_subscribed = 0;

-- LIKE operator
-- 1. Find out customers name starting with 'a'
select * from peopledata
where name like 'a%';


-- 2. Find out customers name ends with 'a'
select * from peopledata
where name like '%a';


select * from myemp ;

-- first name starts with 's' and lname starts with 'k'
select * from myemp
where first_name like 's%' and last_name like 'k%';


-- retrieve employees whose fname starts with 'a', 'b', 'c', 'm'
select * from myemp
where FIRST_NAME like 'a%'
	or first_name like '%b'
    or first_name like 'c'
    or first_name like'm';
    
    
-- REGEX
-- ^ for starts with in regex
select * from myemp
where first_name regexp "^[abcm]";


select * from myemp
where first_name not regexp "^[abcm]";

