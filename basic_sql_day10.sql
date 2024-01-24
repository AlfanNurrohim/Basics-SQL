-- Pertemuan 10
use sakila

-- uncuk membuat view, buat query biasa (yang ingin dijadikan view) terlebih dahulu
select rating,
	count(distinct_film_id) as film_count,
	sum(rental_rate) as total_rental_rate
from film
group by rating
order by rating asc;

-- query untuk create view
create view film_rental_cost as (
	select 	rating,
			count(distinct film_id) as film_count,
			sum(rental_rate) as total_rental_rate 
	from film
	group by rating
	order by rating asc
);

-- query untuk melihat seluruh tables, termasuk view
show full tables;

-- query untuk select view 
select * from film_rental_cost;

-- replace view yang sudah ada, dengan membuat yang ingin dijadikan view terlebih dahulu
select 	f.rating,
		count(distinct a.first_name) as actor_count,
		count(distinct f.flim_id) as film_count,
		sum(f.rental_rate) as total_rental_rate
from film f
left join film_actor on fa.film_id = f.film_id
left join actor a on a.actor_id = fa.actor_id
group by f.rating 
order by f.rating  asc;

-- query uncuk membuat view dengan create or replace
create or replace view film_rental_cost as (
	select 	f.rating,
			count(distinct a.first_name) as actor_count,
			count(distinct f.film_id) as film_count,
			sum(f.rental_rate) as total_trental_rate
	from film f
	left join film_actor fa on fa.film_id = f.film-id
	left join actor a on a.actor_id = fa.actor_id
	group by f.rating
	order by f.rating asc
);

-- query untuk alter view 
alter view film_rental_cost as (
	select 	f.rating,
			count(distinct a.first_name) as actor_count,
			count(distinct f.film_id) as film_count,
			sum(f.rental_rate) as total_trental_rate
	from film f
	left join film_actor fa on fa.film_id = f.film-id
	left join actor a on a.actor_id = fa.actor_id
	group by f.rating
	order by f.rating desc
);

-- quey untuk drop view
drop view if exists film_rental_cost;