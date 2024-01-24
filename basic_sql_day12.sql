-- Pertemuan 11
use sakila

-- query control flow case
select 	film_id, title, rating,
		(case
			when rating in ('PG', 'G') then 'Kids'
			when rating in ('NC-17', 'R') then 'Adults'
			else 'Teens'
		end) as rating_category
from film;

-- contoh 2 flow case
select 	film_id, title, rental_rate,
		(case 
			when rental_rate < 2 then 'budget'
			when rental_rate between 2 and 3 then 'Normal'
			else 'Expensive'
		end) as rental_price_category
from film;

-- query control flow if
select 	film_id, title, rental_rate,
		if(rental_rate < 2, 'Budget',
		if(rental_rate between 2 and 3, 'Normal', 'Expensive')
		) as rental_price_category
from film;


-- query dengan >1 control flow case
select 	film_id, title, rental_rate,
		(case 
			when rating in ('PG', 'G') then 'Kids' 
			when rating in ('NC-17', 'R') then 'Adults'
			else 'Teens'
		end) as rating_category,
		(case 
			when rental_rate < 2 then 'Budget'
			when rental_rate between 2 and 3 then 'Normal'
			else 'Expensive'
		end) as rental_price_category
from film;

-- query gabungan conrol flow case dan if
select 	film_id, title, rental_rate,
		(case
			when rating in ('PG', 'G') then 'Kids'
			when rating in ('NC-17', 'R') then 'Adults'
			else 'Teens'
		end) as rating_category,
		if(rental_rate < 2, 'Budget',
		if(rental_rate between 2 and 3, 'Normal', 'Expensive')
		) as rental_price_category
from film;

-- control flow case harus berurutan jika tidak maka hasilnya bis atidak sesuai
-- contoh salah
select 	film_id, title, `length` as film_duration,
		(case 
			when `length` between 60 and 120 then 'Medium'
			when `length` > 120 then 'Long'
			when `length` > 150 then 'Extra Long'
			when `length` < 60 then 'Short'
		end) as film_duration_category
from film;

-- contoh benar
select 	film_id, title, `length` as film_duration,
		(case 
			when `length` < 60 then 'Short'
			when `length` between 60 and 120 then 'Medium'
			when `length` > 150 then 'Extra Long'
			when `length` > 120 then 'Long'
		end) as film_duration_category
from film;	

-- contoh query case yang benar, diurutkan dari kondisi kecil ke besar (bawah ke atas)
select 	film_id, title, `length` as film_duration,
		(case 
			when `length` < 60 then 'Short'
			when `length` between 60 and 120 then 'Medium'
			when `length` between 120 and 150 then 'Long'
			when `length` > 150 then 'Extra Long'
		end) as film_duration_category
from film;
	
-- query case dengan subquery
select film_id, title, `length` as film_duration,
	(case 
		when `length` < (select 0.2 * avg(`length`) from film) then 'Short Film'		
		when `length` between (select 0.2 * avg(`length`) from film) and (select 0.7 * avg(`length`) from film) then 'Medium Film' 
		when `length` > (select avg(`length`) from film) then 'Long Film'
		else 'Uncategorization'
	end) as film_categorization
from film;

-- query case dengan subquery dan join
select 	film_id, title,
		(case 
			when (  select count(*)
					from rental
					where inventory_id in (	select inventory_id
											from inventory
											where film_id = film.film_id)
			) < ( 
				select avg(rental_count)
				from ( 	select film_id, count(*) as rental_count
						from rental
						join inventory on rental.inventory_id = inventory.inventory_id
						group by film_id) as sub_tab
			) 	then 'Cat A'
				else 'Cat B'
		end) as rental_category
from film;
		
		