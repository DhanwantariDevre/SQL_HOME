-- Trigger

/*
A trigger in MySQL is a named database object that is
associated with a table and activates and(fires) automatically
when a specific event occurs on that table

These events are standard data manipulation language statements 
Insert, Update, Delete

Timing and Events:
A trigger is defind by its timing and event.
You can mix and match these to create six possible combinations 
per table
Timing:
1. Before : Fires before the row modification is verified and 
save to the table
It is used to validate and modify the data.

2. After : Fires after the row modification is safely saved
It is used to update other tables or write logs

EVENTS:
- INSERT
- UPDATE
- DELETE 

*/

use companydb;

-- MAin Products table
Create Table Products(
id int auto_increment primary key,
name varchar(50),
price decimal(10,2)
);

-- Audit table to log price changes
create table Price_audit_log(
log_id int auto_increment primary key,
product_id int,
old_price decimal(10,2),
new_price decimal(10,2),
changed_at timestamp default current_timestamp
);

-- insert sample items 
insert into products (name, price) 
values ('Gaming Mouse',500.00);

/* 
Create a trigger before UPDATE Trigger(Data Validation)
This trigger prevents a user from accidentally updating a price 
to a negative value. It they try, it automatically resets the price 
to 0.00
*/

delimiter //
create trigger before_product_update
BEFORE UPDATE ON products
for each row 
BEGIN
	if new.price < 0 then
		set new.price = 0.00;
    end if;
end//
delimiter ;


set sql_safe_updates = 0;
-- bydeault sql_safe_updates is 1 
-- sql will not allow you to update the data


-- TEST 1: Try to update with an invalid negative price
UPDATE products set price = -10.00 where name = 'Gaming Mouse';

select * from products;

/*
CREATE an after trigger (Audit logging)
This trigger automatically copies the old price and the new  price
into our audit table whenever a products price is updated
*/

Delimiter //
create trigger after_product_update
AFTER UPDATE ON Products
for each row
BEGIN
	if old.price <> new.price then
		insert into price_audit_log 
		(product_id, old_price, new_price)
		values
		(old.id, old.price, new.price);
    end if;
end//
delimiter ;

-- TEST 2: Update with the valid price change 
update products set price = 250
where name = 'Gaming Mouse';

select * from price_audit_log;

-- VIEW active triggers
show triggers;


-- DELETE a trigger
DROP Trigger if exists after_product_update;











