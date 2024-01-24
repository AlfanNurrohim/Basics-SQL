-- Pertemuan 6

-- Use sakila
use sakila

-- query grup by untuk melakukan grouping
select f.rating, count(*) as row_count, avg(f.rental_rate) as avg_rate
from film f
group by f.rating;

select f.rating, count(*) as roe_count
from film f
group by 1;

select 	f.rating,
		f.special_features,
		count(*) as row_count,
		avg(f.rental_rate) as avg_rate
from film f
group by f.rating, f.special_features;
		
-- query having untuk melakukan filter data
select f.rating, count(*) as row_count
from film f
group by f.rating 
having row_count > 100;

-- having vs where
select f.rating, count(*) as row_count
from film f
where f.replacement_cost > 20
group by f.rating having row_count > 100;

select f.rating, count(*) as row_count
from film f
group by f.rating 
having f.rating in ('PG', 'G');

-- query rating funcion
-- concat, menggabungkan 2 sting atau lebih
select 	a.first_name, a.last_name,
		lower(a.first_name) as lower_firstname,
		reverse(a.first_name) as reversed_name,
		concat(a.first_name, ' ', a.last_name) as fullname
	from actor a;

-- query datetime funcion
select 	extract(year from p.payment_date) as payment_year,
		extract(month from p.payment_date) as payment_month,
		count(*) as avg_count,
		avg(p.amount) as avg_amount
from payment p
group by payment_year, payment_month
order by payment_year, payment_month 

-- query untuk melakukan flow control
-- query case
select 	f.rental_rate,
		(case  
			when f.rental_rate < 1 then 'A'
			when f.rental_rate between 1 and 3 then 'B'
			else 'C'
		end) as kategori_harga
from film f;

-- query if
select 	f.rental_rate,
		if(
			f.rental_rate < 1, 'A',
			if(
			  	f.rental_rate between 1 and 3, 'B', 'C'
			    )
			) as kategori_harga
from film f;

-- query ifnull
select address2, ifnull(a.address2, 'ini null')
from address a;



