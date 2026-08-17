/*
ACID PROPERTIES
In database management system , ACID is a set of four core properties that 
guaratees database transaction reliably

A transaction is a single logical unit of work (Like transferring money) that may 
involve multiple database updates

Without ACID properties, unexpected creashes, power failures, or simultaneous actions
could corrupt your data

1. Atomicity ("All or Nothing")
Atomicity guarantees that a transaction is treated as a single, indivisible unit. 
Either all database modifications are saved, or none of them are. If any part of 
the transaction fails, the entire transaction is rolled back, leaving the database unchanged. 
•	Example: You transfer ₹1,000 from Account A to Account B. 
•	The Steps:
1.	Deduct ₹1,000 from Account A.
2.	Add ₹1,000 to Account B. 
•	How Atomicity Works: If the system crashes right after Step 1, the database automatically 
undoes (rolls back) the deduction. Account A gets its money back so that funds do not vanish into thin air

2. Consistency ("Valid State to Valid State")
Consistency ensures that a transaction can only bring the database from one valid state to another, 
maintaining all predefined validation rules, constraints (like UNIQUE or FOREIGN KEY), and data integrity. 
•	Example: Your database has a rule that an account balance can never drop below zero.
•	How Consistency Works: If you try to withdraw ₹5,000 from an account that only has ₹2,000, the 
database will block the transaction. The transaction fails because saving it would violate the integrity 
rule and leave the database in an invalid state

 3. Isolation ("No Interference")
Isolation ensures that concurrently executing transactions do not interfere with each other. 
Even if thousands of transactions run at the exact same millisecond, each transaction executes as 
if it is the only one running on the system. 
•	Example: A popular concert ticket is on sale, and only 1 seat is left. Two users click "Buy" 
at the exact same moment.
•	How Isolation Works: The database forces them to execute sequentially in isolation. 
Transaction 1 locks the row, checks availability, and buys the ticket. Transaction 2 is 
forced to wait until Transaction 1 finishes. 
Once Transaction 1 completes, Transaction 2 checks the row, sees 0 seats left, and is safely rejected.

4. Durability ("Once Saved, Always Saved")
Durability guarantees that once a transaction has been successfully committed (saved), its changes survive permanently.
 Even if the database server immediately suffers a complete power outage, a hard drive crash, 
 or a system failure right after the commit, the data remains safe. 
•	Example: You successfully book a flight online and see the confirmation screen.
•	How Durability Works: The database immediately writes the booking transaction to a permanent transaction log on the 
non-volatile storage disk. If the airport server room loses power a second later, your seat remains booked because the 
log allows the system to recover your transaction upon reboot

====================================================
INTERVIEW QUESTION
Explain with an example

1. Atomicity ("All or Nothing")
2. Consistency ("Valid state to Valid State")
3. Isolation ("No Interference")
4. Durability ("Once Saved, Always Saved")
=====================================================

*/


-- =====================================================
-- TCL COMMANDS
use salesdb;

create table store_inventory(
item_name varchar(50) primary key,
stock_count int
);

insert into store_inventory values
('Smartphone',10),
('Laptops',5);

-- ====================================================
-- scenario : Processing an order with Savepoints
-- ====================================================

-- Start the transaction Manually
start transaction;

-- Step A : Sell 2 Smartphones
UPDATE store_inventory
SET stock_count = stock_count-2
WHERE item_name = 'Smartphone';

-- Create a checkpoint here
SAVEPOINT phone_sold;

-- Step B : Sell 1 Laptop
UPDATE store_inventory
SET stock_count = stock_count-1
WHERE item_name = 'Laptop';

-- OOPS!
-- The customer cancelled the laptop part of the order, 
-- but still wants the phone
-- ROLLBACK only to our savepoint marker
ROLLBACK TO SAVEPOINT phone_sold;

Select * from store_inventory;

-- Step C : Complete the order permanently
COMMIT;

-- Verify the final results
-- Smartphones shoul be 8 (DEducted and Committed)
-- Laptops should be still 5 (deducted, but rolled back safely)
SELECT * FROM store_inventory;


/*
-- ====================================================================
-- DCL COMMANDS (Data Control Language) commands are used to manage database security by
-- controlling user access permissions and previleges
-- They allow DBA to decid exactly who can view, modify
-- and manage data

-- Two primary DCL Commands :GRANT and REVOKE

1. The GRANT command gives specific database previleges 
or access permissions to user account

Syntax : 
Grant previleges_type on database_name .table_name to 'username'@'host';

For example:
grant select, insert on companydb.employees to 'dev_user'@'localhost';

grant all privileges on *.* to 'admin_user'@'localhost';


2.REVOKE Command takes away previously assigned permissions from 
user account 

Syntax: 
REVOKE previlege_type  on database_name.table_name from 'user_name'@'localhost';

For example,
REVOKE INSERT on companydb.employees from 'dev_user'@'localhost;

REVOKE all previleges from 'dev_user'@'localhost';

Common Previleges :
- Select : Read the data from tables
- insert : add new records to the table
- update : modify existing data
- delete : remove rows
- create/drop : Build or delete the databse or tables


*/

-- STEP 1 : Create a User
Create User 'Analyst'@'localhost' identified by 'secure_password';

GRANT select on companydb.* to 'Analyst'@'localhost';

show grants for 'Analyst'@'localhost';

REVOKE select on companydb.sales_data from 'Analyst'@'localhost';

SELECT user, host FROM mysql.user;

SHOW GRANTS FOR 'Analyst'@'localhost';

GRANT SELECT ON companydb.* TO 'Analyst'@'localhost';








