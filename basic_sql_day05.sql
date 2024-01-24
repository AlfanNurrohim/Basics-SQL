-- Pertemuan 5

use sakila;

-- query between untuk mencari nilai antara kondisi 1 dan kondisi 2
select film_id, title, rental_rate, replacement_cost
from film 
where 	replacement_cost between 10 and 20
		and rental_rate between 2 and 5;

-- query in untuk mencari nilai multiple string tertentu
select film_id, title, rental_rate, replacement_cost, rating
from film 
where rating in ('PG', 'G');

-- query distinct untuk mencari nilai unique pada suatu data / drop duplicate
select distinct (rental_rate)
from film 
where rating in ('PG', 'G');

-- alias untuk memberi nama sementara
-- alias untuk kolom
select  film_id as id,
		title as film_name,
		description as film_desc,
		rating as film_rating
from film;

-- alias untuk table
select f.film_id, f.title
from film as f;

-- tanpa as
select f.film_id, f.title
from film f;

-- query untuk numeric function
-- arithmatic operator
select 10+10 as hasil

-- arithmatic operator pada table
select 	f.film_id, f.title as film_name,
		f.replacement_cost,
		f.replacement_cost*2 as double_replacement_cost,
		f.replacement_cost/2 as half_replacement_cost
from film f;

-- mathemetical function
select sum(f.replacement_cost) as total_replacement_cost
from film f;

select 	f.film_id, f.title as film_name,
		abs(f.replacement_cost-1000) as absolute_values,
		pow(f.replacement_cost,2) as power2_values
from film f;
	
-- query untuk aggregate funcion
-- average (rata-rata), min (mengambil nilai terkecil), max (mengambil nilai terbesar), sum (menjumlahkan)
select 	avg(f.replacement_cost) as average_replacement_cost,
		min(f.replacement_cost) as minimun_replacement_cost,
		max(f.replacement_cost) as maximum_replacement_cost,
		sum(f.replacement_cost) as total_replacement_cost
from film f;
