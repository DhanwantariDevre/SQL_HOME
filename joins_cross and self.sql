Use learndb;

-- movie rental store 
select * from movies;

select * from members;

-- find all the movies which are rented. 
-- inner join 
select id, title, first_name from movies 
inner join members
on movies.id = members.movieid;

-- find out the movies which are not rented 
-- left join 
select * from movies 
left join members
on movies.id = members.movieid
where memid is null;

-- right join 
select * from members
right join movies
on movies.id = members.movieid
where movieid is null;


-- full outer join

SELECT 
    *
FROM
    movies
        LEFT JOIN
    members ON movies.id = members.memid 
UNION SELECT 
    *
FROM
    movies
        RIGHT JOIN
    members ON movies.id = members.memid;


-- cross join

use learndb;
show tables;

SELECT 
    *
FROM
    drinks;
SELECT 
    *
FROM
    meals;

SELECT 
    mealname,
    drinkname,
    meals.rate,
    drinks.rate,
    meals.rate + drinks.rate AS total_bill
FROM
    meals
        CROSS JOIN
    drinks;

-- self join
/* Joining the table with the table itself is called self join
Internally it performs always an inner join*/

select * from myemp;

select e.first_name,e.last_name,m.first_name,m.last_name
from myemp m
inner join myemp e
on m.emp_id = e.mgr_id
;








