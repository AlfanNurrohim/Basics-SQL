-- pertemuan 10

-- use sakila
use sakila

-- query untuk membuat subquery
-- pertama buat query untuk table u tama
select first_name, last_name
from actor 
where 	actor_id < 10
		and first_name like ('p%');
	
-- masukan table utama kedalam subquery
select sub_tab.*
from (
	select actor_id, first_name, last_name
	from actor 
	where actor_id < 10
)sub_tab
where sub_tab.first_name like ('p%');
	
-- subquery from dengan join
select stf.first_name, sum(pay.amount) as total_income
from store sto
join staff stf on stf.store_id = sto.store_id 
join payment pay on pay.staff_id = stf.staff_id 
group by 1;

-- subquery table utama
select sub_tab.*
from (
	select stf.first_name, sum(pay.amount) as total_income
	from store sto
	join staff stf on stf.store_id = sto.store_id
	join payment pay on pay.staff_id = stf.staff_id
	group by 1
) sub_tab;	

-- vaiasi join pada table di database
select sub_tab.first_name, sum(pay.amount) as total_income
from (
	select stf.staff_id, stf.first_name
	from store sto
	join staff stf on stf.store_id = sto.store_id
) sub_tab
join payment pay on pay.staff_id = sub_tab.staff_id
group by 1;

-- variasi join subquery lain
select sub_store.first_name, sum(sub_pay.amount) as total_income
from (
	select stf.staff_id, stf.first_name
	from store sto
	join staff stf on stf.store_id = sto.store_id 
) sub_store
join (
	select pay.staff_id, pay.amount
	from payment pay
) sub_pay on sub_pay.staff_id = sub_store.staff_id
group by 1;

-- query untuk membuat asubquery (where)
-- pertama buat query untuk kondisi tertentu
select film_id
from film f where rating in ('PG', 'G');

-- masukan kondisi tadi ke subquery where
select film_id, title, release_year, rating
from film f where film_id not in (
	select film_id 
	from film f2 where rating in ('PG', 'G')
);

-- query untuk membuat subquery where
select sum(amount) as total_amount
from payment 
group by customer_id;

select avg(sub_tab.total_amount) as avg_total_amount
from ( 
	select sum(amount) as total_amount
	from payment
	group by customer_id
) sub_tab;

-- subquery dengan having
select cust.customer_id, cust.first_name, cust.last_name, sum(pay.amount) as total_payment
from payment pay
left join customer cust on cust.customer_id = pay.customer_id
group by 1,2,3
having total_payment > (
	select avg(sub_tab.total_amount) as avg_total_amount
	from ( 
	select sum(amount) as total_amount
		from payment 
		group by customer_id 
	) sub_tab
);

