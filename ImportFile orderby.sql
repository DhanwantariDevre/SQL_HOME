-- In this file we are importing the data from ready made table
-- Using original data file(practicetables.csv)
-- Right clk on tables tab in the database which you want to select
-- Table from import Wizard --> select database --> select encoding
-- --> select the tables which you want -- then next --> FINISH
-- Create the table first then right clk on that table name and then continue with the steps

drop table mobiles;
use learndb;
create table mobiles (
Brand varchar(50),
Color varchar(50),
Storage smallint,
Rating float(2,1),
Screen_size float(3,2),
Battery smallint,
Price decimal
);

select * from mobiles;

-- count total apple mobiles
select count(*) from mobiles;
-- check the rows


-- count total apple mobiles
select count(*) from mobiles
where Brand='apple';

select * from mobiles;
-- count total apple mobiles wrt 64 storage and rating > 4

-- Output--> count = 8
select * from mobiles
where (brand='apple' and storage='64')
and rating > 4;

-- count total apple, samsung, readme with storage 128
select brand, count(*) as freq from mobiles
where storage=128
group by brand;


-- find the frequency of each storage (64,128,256,512) in apple
select storage, count(*) as freq from mobiles
where brand = 'apple'
group by storage;


-- what is the freq of 64gb storage mobiles wrt each brand
select brand, count(*) as freq from mobiles 
where storage=64
group by brand;


-- what is the freq of each storage option wrt each brand
-- sort the table such way that the brands wrt storage are together
select brand, storage, count(*) as freq from mobiles
group by brand, storage
-- Can we sort them according to sequence of storage or brands
order by brand;


-- -------------------------------------------------------------------------------------
-- FINDING PERCENTAGE

-- WORK ON MOBILEDATA
-- what is the percentage of each storage option wrt each brand
-- sort the table such way that the brands wrt storage are together

select * from mobiles;
select brand, `storage`,
concat(round(count(*) /928*100,2), '%') as percentage
from mobiles
group by brand, `storage`
order by brand,`storage`;



-- ----------------------------------------------------------------------------------
-- WORK ON PEOPLEDATA

-- calculate the percentage of subscribe and non subscribe 
-- customers in people data
 select * from peopledata;

select count(*) from peopledata;

select is_subscribed, 
concat(round(count(*) /100 * 100 , 2 ), '%') as percentage
from peopledata
group by is_subscribed;


-- calculate the percentage of customers from each state
select * from peopledata;








-- --------------------------------------------------------------------------------------
-- HAVING CLAUSE
-- filter groups based on condition
-- which brand has freq more than 100
select brand, count(*) as freq
from mobiles 
group by brand
having freq > 100	;

-- find out avg price of brand where no. of mobiles in that brand 
-- should be greater than 20 and storage of mobile is 128 
-- sort the table based on avg price in ascending order

select brand, avg(price) as avg_price, count(*) as freq
from mobiles 
where storage = 128 
group by brand
having freq > 20 
order by avg_price asc;

-- for sorting used #order by


use learndb;

select * from users;

