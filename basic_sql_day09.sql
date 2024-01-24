-- Pertemuan 9

-- use sakila
use sakila

-- query union untuk menggabungkan table
select first_name, last_name from actor 
union
select first_name, last_name from customer;

-- ditambahkan alias
select act.actor_id, act.first_name, act.last_name from actor act
union
select cust.customer_id, cust.first_name, cust.last_name from customer cust;

-- ditambahkan limit dan alias
(select act.actor_id, act.first_name, act.last_name 
	from actor act
	limit 10)
union
(select cust.customer_id, cust.first_name, cust.last_name 
	from customer cust
	limit 10);
	
-- query union all untuk menggabungkan semua table
select act.actor_id, act.first_name, act.last_name, act.last_update 
from actor act
union all
select cust.customer_id, cust.first_name, cust.last_name, cust.last_update
from customer cust;

-- ditambahkan limit dan alias
(select act.actor_id, act.first_name, act.last_name, act.last_update 
	from actor act
	limit 10)
union all
(select cust.customer_id, cust.first_name, cust.last_name, cust.last_name 
	from customer cust
	limit 10);
	
-- query interesct dengan bantuan inner join
select distinct(addr.district)
from address addr
inner join staff st on st.address_id = addr.address_id;

-- gunakan db_toko
use db_toko;

-- query untuk membuat indexpada table
create table seller(
	id int not null auto_increment,
	name varchar (100),
	email varchar (100),
	primary key (id),
	unique key email_unique (email),
	index name_index (name)
);

-- query alter untuk add index
alter table seller 
add index email_index (email);

-- query alter untuk drop endex
alter table seller 
drop index email_index;

