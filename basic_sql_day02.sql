-- Pertemuan 2

-- query insert untuk memasukan data kedalam table
insert into barang(kode, nama_barang, deskripsi, harga, jumlah)
values(1, 'Indomie', 'Indomie soto kari', 3000, 1);

-- query insert untuk memasukan data kedalam table > 1 entry
insert into barang(kode, nama_barang, deskripsi, harga, jumlah)
values	(2, 'Indomie', 'Indomie soto kari', 3000, 1),
		(3, 'Sarimi', 'Sarimi soto koya', 3000, 2),
		(4, 'Mie sedaap', 'Mie sedaap goreng', 3000, 1);
	
-- query untuk menambahkan auto-increment dalam table creation
create table admin
(
	id int auto_increment,
	first_name text,
	last_name text,
	primary key (id)
);

-- insert ke table dengan auto-increment
insert into admin (first_name, last_name)
values ('Joko', 'Widodo');

-- insert ke table dengan auto-increment > 1 entry
insert into admin (first_name, last_name)
values  ('Prabowo', 'Subianto'),
		('Ganjar', 'Pranowo'),
		('Anies', 'Baswedan');
	
-- menambahkan auto-increment pada table yang sudah di create
-- buat primary key nya
alter table barang 
add primary key (kode);

-- buat auto increment dengan modify
alter table barang
modify column kode int auto_increment;

-- query insert untuk memasukan data kedalam table (tanpa id)
insert into barang(nama_barang, deskripsi, harga, jumlah)
values('Sarimi 2', 'Sarimi soto kari', 3000, 2);









	

		
		
		


