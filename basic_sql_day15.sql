-- Pertemuan 15
use sakila

-- query untuk melihat user yang ada
select user,host from mysql.user

-- query untuk membuat / menambahkan user baru
create user 'root2'@'localhost'; #nama_user hostnya

-- query lain untuk membuat / menambahkan user baru
create user 'root3'@'localhost' identified by 'passuser'; #nama_user, hostnya, passwordnya

-- query untuk membuat / mengganti password user
set password for 'root2'@'localhost' = 'password2'; #nama_user, hostnya, passwordnya

-- query untuk drop / menghilangkan user
drop user 'root2'@'localhost';

-- buat user baru
create user 'root4'@'localhost' identified by 'password4';

-- query untuk melihat privileges pada user
show grants for 'root4'@'localhost';

-- query untuk menambahkan privileges pada user tertentu
-- grant select pada user baru
grant select on db_toko.* to 'root4'@'localhost';

-- grant beberapa privileges pada user baru
grant select, insert, update, delete, alter on db_toko.* to 'root4'@'localhost';

-- grant beberapa privileges untuk satu table pada satu database
grant select, insert, alter on sakila.actor to 'root4'@'localhost';
grant select, insert, alter on sakila.city to 'root4'@'localhost';

-- query untuk apply privileges 
flush privileges;

-- query untuk revoke privileges pada satu table pada satu database
revoke select, insert, alter on sakila.city from 'root4'@'localhost';