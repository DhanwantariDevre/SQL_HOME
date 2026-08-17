-- SQL Function

use companydb;

create table if not exists items (
id int auto_increment primary key,
name varchar(50),
price decimal(10,2));

insert into items (name,price) values
('Laptop',10000.00),
('Mouse',500);

Delimiter //
create function CalculateTaxe(price decimal(10,2))
returns decimal(10,2)
Deterministic

Begin
Declare tax_amount decimal(10,2);
set tax_amount = price * 0.10;
set price = price + tax_amount;
return price;
End//
Delimiter ;

-- drop table items;

-- unlike stored procedure, you call a function directly 
-- inside your queries
select name, price, CalculateTaxe(price) as Final_price
from items;


/* 
When to use which?
1. Use a function when you need to perform a calculation,
fromat a string or transform data that needs to be seamlessly 
used inside a select statement.

2. Use a stored procedure when you need to execute business logic,
run complex transactional sequences (INSERT/UPDATE/DELETE),
or return multiple data set at once 

*/











