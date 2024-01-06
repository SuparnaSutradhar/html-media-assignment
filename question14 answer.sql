use mavenmovies;

-- retrieve the film title, desc, release year for film that has the longest duration
select * from film;
select title, release_year, length 
from film 
where length = (select max(length) from film)
order by length desc;

-- show the title, rental_rate and difference from average rental rate for each film
select title, rental_rate 
from film
where rental_rate - (select avg(rental_rate) from film);

-- Write a query to create a single row containing the number of films based on ratings(g, pg , NC17)
select * from film;
select 
SUM(CASE WHEN rating = 'G' THEN 1 ELSE 0 END) AS G_count,
SUM(CASE WHEN rating = 'PG' THEN 1 ELSE 0 END) AS PG_count,
SUM(CASE WHEN rating = 'NC17' THEN 1 ELSE 0 END) AS NC17_count
from film;

-- Write a query to count the number of film rentals for each customer and the containing query then retrives 
-- those customers who have rented exactly 30 films

select * from customer;
select * from rental;
select first_name, last_name from customer as c where (select count(*) from rental as r where c.customer_id = r.customer_id) = 30;

-- Wrute a query to find all customers whose total payments fro all five rentals are between 100 and 150 dollar
-- customer, payment
 select * from customer;
 select * from payment;
 
 select first_name, last_name from customer
 where (select sum(amount) from payment where payment.customer_id = customer.customer_id ) between 100 and 150 
 group by customer_id;
 
 -- retrieve the film title along with their description and lengths that have rental rate  
 -- greater then average rental rate for films released in the same year
 
 select * from film;
 select title, description, length from film as f where rental_rate > (select avg(rental_rate) from film as fa where f.release_year = fa.release_year);  
 
select * from actor;
select * from film_actor;
select * from actor full join actor_award;

use mavenmovies;
select * from customer;
select * from payment;
select * from rental;
select * from customer as c inner join payment as p on c.customer_id = p.customer_id  inner join rental as r on r.customer_id = p.customer_id;

select first_name, last_name from customer where active = 1;

-- list all rentalIDs for customer with ID 1
select * from customer;
select * from rental;
select rental_id from rental as r where (select customer_id from customer as c where r.customer_id = c.customer_id) = 1;

-- Display all the films whose rental duration is greater than 5
select * from film;
select title from film where rental_duration > 5;

-- List the total number of films whose replacement cost is greater than $15 and less than $20
select * from film;
select title from film where replacement_cost between 15 and 20;

-- Display the count of unique first name of actors
select * from actor;
select count(distinct first_name) from actor;

-- Display the first 10 records from the customer table
select * from customer limit 10;

-- Display the first 3 records from the customer table whose first name start with b
select first_name from customer where first_name like 'b%' limit 3;

-- Display the name of first 5 movies which are rated as 'G'
select title from film where rating = 'G' limit 5;

-- Find all the customer whose first name starts with a
select first_name from customer where first_name like 'a%';

-- Find all customers whose first name ends with a
select first_name from customer where first_name like '%a';



 