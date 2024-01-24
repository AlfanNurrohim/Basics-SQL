-- Pertemuan 4
use sakila

-- query is NULL untuk mencari NULL values
select address_id, address, address2
from address 
where address is null;

-- query order by untuk mengurutkan data berdasarkan kolom tertentu
-- ascending (value kecil ke besar), by default akan ascending jika tidak diberi keterangan
select film_id, title, release_year, rantal_rate
from film
order by rental_rate;

select film_id, title, release_year, rental_rate
from film
order by rental_rate asc;

-- ordering bisa dengan urutan kolom yang kita ambil
select film_id, title, release_year, rental_rate
from film
order by 4;

-- descending (value besar ke kecil)
select film_id, title, release_year, rental_rate
from film
order by rental_rate desc;

-- ordering data dengan urutan kolom yang kita ambil
select film_id, title, release_year, rental_rate
from film
order by 4 desc;

-- ordering multiple times
select film_id, title, release_year, rental_rate
from film
order by film_id desc, release_year asc;

select film_id, title, release_year, rental_rate
from film
order by 1 desc, 3 asc;

-- query limit untuk membatasi data yang diambil
select actor_id, first_name, last_name
from actor
where actor_id > 10
limit 10;

select actor_id, first_name, last_name
from actor
where actor_id > 10
order by first_name desc 
limit 20;

-- query like untuk mencari string dengan kriteia tertentu
-- awalan huruf tertentu
select actor_id, first_name
from actor 
where first_name like ('P%')

-- akhiran huruf tertentu
select actor_id, first_name
from actor 
where first_name like ('%A')

-- kata atau huruf tertentu
select actor_id, first_name
from actor 
where first_name like ('%DAN%')

-- bukan kata atau huruf tertentu
select actor_id, first_name
from actor 
where first_name not like ('%DAN%')


