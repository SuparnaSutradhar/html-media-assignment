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



 