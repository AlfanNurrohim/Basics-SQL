-- pertemuan 14
use sakila

-- query untuk membuat procedure (stored procedure)
create procedure get_actor()
	begin 
		select actor_id, first_name, last_name
		from actor 
		order by 1 desc 
		limit 10;
	end
	
-- query untuk call stored procedure
call get_actor;

-- query untuk drop stored procedure
drop procedure if exists get_actor;

-- query parameter in dalam stored procedure
-- query stored procedure in
create procedure get_actor_id(in param int) #procedur name, parameter
	begin 
		select act.actor_id, act.first_name, act.last_name, fil.title, fil.rating
		from actor act
		left join film_actor fa on fa.actor_id = act.actor_id 
		left join film fil on fil.film_id = fa.film_id
		where act.actor_id = param;
	end
	
-- query stored procedure dengan beberapa prameter in
create procedure get_actor_id_name(in param int, in nama_film varchar(100)) #procedur name, parameter
	begin 
		select act.actor_id, act.first_name, act.last_name, fil.title, fil.rating
		from actor act
		left join film_actor fa on fa.actor_id = act.actor_id 
		left join film fil on fil.film_id = fa.film_id
		where act.actor_id = param and act.first_name like (nama);
	end	 
	
-- query untuk call stored procedure in
call get_actor_id(50)

-- query untuk call stored procedure in dengan beberapa parameter
call get_actor_id_name(50, '%C')