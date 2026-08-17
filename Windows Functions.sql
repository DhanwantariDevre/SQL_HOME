-- Window functions

/* 

A window function in MySQL performs a calculation across aset 
of table rows that are closely related to the current row.

Unlike standard aggregate functions(sum,avg,count) ,
which collapse your rows into a single summary row,
window function retain the individual identity of every 
row whilw a ppending the calculated aggregate or ranking value 
along side it

Core syntax:
Select column name,
function_name() OVER(
PARTITION BY column_to_group
ORDER BY column_to_sort
) as alias_name
from table_name;

1. Over Clause defines the 'window' or sunset of data the function
looks at

2. PARTITION BY : Splits the rows into groups(similar to group by, 
but keeps te individual row)

3. ORDER BY : Tells the sorting sequence within each partition group

*/

create database if not exists salesdb;
-- Create the practice table
CREATE TABLE sales_data (
    sale_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_name VARCHAR(50),
    department VARCHAR(50),
    sale_date DATE,
    amount DECIMAL(10, 2)
);

-- Insert dummy data representing different departments and dates
INSERT INTO sales_data (employee_name, department, sale_date, amount) VALUES
('Alice', 'Electronics', '2026-01-01', 1500.00),
('Bob',   'Electronics', '2026-01-02', 1000.00),
('Alice', 'Electronics', '2026-01-03', 2000.00),
('Charlie','Electronics','2026-01-04', 1200.00),
('Bob',   'Electronics', '2026-01-05', 3000.00),
('David', 'Clothing',    '2026-01-01', 500.00),
('Emma',  'Clothing',    '2026-01-02', 1500.00),
('David', 'Clothing',    '2026-01-03', 800.00),
('Emma',  'Clothing',    '2026-01-04', 1500.00),
('Fiona', 'Clothing',    '2026-01-05', 1200.00);


select * from sales_data;

-- Rank sales inside each department highest to lowest
select 
department, employee_name, amount,
ROW_NUMBER() over(partition by department 
order by amount desc) as row_num
from sales_data; 


select 
department, employee_name, amount,
RANK() over(partition by department 
order by amount desc) as Rank_skip
from sales_data; 


select 
department, employee_name, amount,
DENSE_RANK() over(partition by department 
order by amount desc) as Dense_rank_no_skip
from sales_data; 

select 
department, employee_name, amount,
ROW_NUMBER() over(partition by department 
order by amount desc) as row_num,
RANK() over(partition by department 
order by amount desc) as Rank_skip,
DENSE_RANK() over(partition by department 
order by amount desc) as Dense_rank_no_skip
from sales_data; 



-- For each sale , look at the value of the immediately preceding sale 
-- and the immediately following sale


Select 
sale_id, sale_date, employee_name, amount,
LAG(amount, 1) over (order by sale_date) as prev_sale,
LEAD( amount, 1) over (order by sale_date) as next_sale
from sales_data;

-- If you want to see daily sales list alng side a
-- cumulative running total = Cummulative sum

select sale_date, amount,
SUM(amount) over (order by sale_date) running_total
from sales_data;


-- running averge
select sale_date, amount,
avg(amount) over (partition by department
 order by sale_date) as running_avg
from sales_data;











