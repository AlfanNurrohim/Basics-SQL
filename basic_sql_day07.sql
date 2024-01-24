-- pertemuan 7

-- use db_toko
use db_toko;

-- buat table baru
create table product(
	id varchar (100) not null,
	nama varchar (100) not null,
	description text,
	price int not null,
	quantity int not null,
	created_at timestamp not null default current_timestamp,
	primary key (id)
);

-- alter table primary key 
alter table product 
add primary key(id);

-- query untuk membuat table baru dengan foreign key
create table wishlist (
	id int not null auto_increment,
	id_product varchar(100) not null,
	descrition text,
	primary key (id),
	constraint fk_wishlist_product
		foreign key (id_product) references product (id)
);

-- query alter untuk menghapus atau menambahkan constraint foreign key
-- menghapus foreign key
alter table wishlist 
drop constraint fk_wishlist_product;

-- menambah constraint
alter table wishlist 
add constraint fk_wishlist_product
	foreign key (id_product) references product (id);
	

-- query untuk membuat unique key/ unique constraint
create table customers(
	id int not null auto_increment,
	email varchar(100),
	first_name varchar(100),
	last_name varchar(100),
	primary key (id),
	unique key email_unique (email)
);

-- query alter untuk menghapus dan menambah unique key
-- menghapus constraint
alter table customers 
drop constraint email_unique;

-- menambah constraint
alter table customers 
add constraint email_unique unique (email);

-- query untuk membuat composite /copound key
create table product2 (
	id int not null,
	nama varchar(100),
	manufacturer varchar(100),
	primary key (nama, manufacturer)
);

-- insert values pada composite key
insert into product2(id, nama, manufacturer)
values  (1, 'Soap', 'hamam'),
		(2, 'shampoo', 'teresme'),
		(3, 'oil', 'almond');
	
-- semua kolom yang masuk ke composite key akan dianggap unique
insert into product2(id, nama, manufacturer)
values (4, 'Soap2', 'hamam');

-- jika sama maka akan ditolak
insert into product2(id, nama, manufacturer)
values (4, 'Soap', 'hamam');

-- query untuk menambahkan constraint
create table product3(
	id varchar(100) not null,
	nama varchar(100),
	description text,
	price int,
	primary key (id),
	constraint price_check check (price > 10000)
);

-- misal insert data yang sesuai dengan constraint
insert into product3(id, nama, price)
values (1, 'indomie', 11000);

-- misal insert data yang tidak sesuai dengan constraint
insert into product3(id, nama, price)
values (2, 'sarimi', 3000)

-- query alter untuk menghapus dan menambah unique key
-- menghapus constraint
alter table product3  
drop constraint price_check;

-- menambah constraint
alter table product3 
add constraint price_check check (price > 1000);



