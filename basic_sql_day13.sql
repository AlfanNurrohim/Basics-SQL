-- Pertemuan 13
use sakila

-- query dengan CTE
with cte1 as (
	select actor_id, first_name, last_name
	from actor
)
select * from cte1;

-- menulis table CTE adalah dengan mamberi nama yang representatif
with cte_actor as (
	select actor_id, first_name, last_name
	from actor 
)
select * from cte_actor;

-- subquery vc CTE

-- subquery 
-- cara penulisan subquery, mulai durlu dari query yang ingin kita jadikan sub
select stf.first_name, sum(pay.amount) as total_income
from store sto
join staff stf on stf.store_id = sto.store_id 
join payment pay on pay.staff_id = stf.staff_id
group by 1;

-- lalu masukan query utama, dan beri nama table/alias
select *
from(
	select stf.first_name, sum(pay.amount) as total_income
	from store sto
	join staff stf on stf.store_id = sto.store_id 
	join payment pay on pay.staff_id = stf.staff_id
	group by 1
) sub_tab;

-- CTE
-- cara penulisan CTE, sama dengan subquery yaitu tentukan query yang ingin kita jadikan CTE
select stf.first_name, sum(pay.amount) as total_income
from store sto
join staff stf on stf.store_id = sto.store_id 
join payment pay on pay.staff_id = stf.staff_id
group by 1;

-- lalu masuan kedalam CTE
with cte_store as (
	select stf.first_name, sum(pay.amount) as total_income
	from store sto
	join staff stf on stf.store_id = sto.store_id 
	join payment pay on pay.staff_id = stf.staff_id
	group by 1
) 
select * from cte_store;

-- query dengan > 1 CTE
-- query yang ingin kita jadikan CTE
select film_id, title, rental_rate
from film;

select actor_id, film_id
from film_actor;

select actor_id, first_name, last_name
from actor;

-- ubah ke CTE
with cte_film as (
	select film_id, title, rating, rental_rate
	from film
), cte_film_actor as (
	select actor_id, film_id 
	from film_actor 
), cte_actor as (
	select actor_id, first_name, last_name
	from actor
)
select 	fil.film_id, fil.title, fil.rating,
		act.first_name, act.last_name
from cte_film fil
left join cte_film_actor fa on fa.film_id = fil.film_id
left join cte_actor act on act.actor_id = fa.actor_id;
	
-- query CTE dari CTE
with cte_film as (
	select 	f.film_id, f.title, f.rating,
			f.rental_rate, fa.actor_id
	from film f
	left join film_actor fa on fa.film_id = f.film_id
), cte_actor as(
	select 	act.first_name, act.last_name,
			cf.title, cf.rating, cf.rental_rate
	from actor act
	left join cte_film cf on cf.actor_id = act.actor_id
)
select * from cte_actor;

