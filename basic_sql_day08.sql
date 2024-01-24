-- Pertemuan 8

-- use sakila
use sakila

-- query untuk join table
select *
from film 
join film_actor 

-- query untuk join table dengan alias
select 	pay.customer_id, pay.customer_id, pay.amount,
		cust.first_name, cust.last_name, cust.email 
from payment pay
join customer cust on cust.customer_id = pay.customer_id;

-- query untuk join lebih dari 2 table
select 	pay.customer_id, pay.customer_id, pay.amount,
		cust.first_name, cust.last_name, cust.email, 
		addr.address, addr.district 
from payment pay
join customer cust on cust.customer_id = pay.customer_id
join address addr on addr.address_id = cust.address_id;

-- query untuk inner join (sama dengan default join)
select sto.store_id, cust.first_name, addr.address 
from customer cust
inner join store sto on sto.store_id = cust.store_id
inner join address addr on addr.address_id = cust.address_id; 

-- query untuk left join
select sto.store_id, cust.first_name, addr.address 
from customer cust
left join store sto on sto.store_id = cust.store_id
left join address addr on addr.address_id = cust.address_id; 

-- query untuk right join
select sto.store_id, cust.first_name, addr.address 
from customer cust
right join store sto on sto.store_id = cust.store_id
right join address addr on addr.address_id = cust.address_id; 

-- query untuk cross join
select cust.first_name, addr.address
from customer cust
cross join address addr;

-- dengan define on clause
select cust.first_name, addr.address_id
from customer cust
cross join address addr on addr.address_id = cust.address_id;