-- Pertemuan 1
create database db_toko;

-- gunakan database db_toko
use db_toko;

-- buat table baru di db_toko
-- formatnya adalah create table nama_table nama_kolom (spasi) tipe_data
create table barang
(
	kode int,
	nama varchar(100),
	harga int,
	jumlah int
);

-- perintah drop table untuk menghilangkan table
drop table barang;

-- query utuk alter table - add
alter table barang 
add column deskripsi text;

-- query untuk alter - hapus
alter table barang
drop column deskripsi

-- query untuk rename alter - rename
alter table barang 
rename column nama to nama_barang

-- query untuk alter - modify
alter table barang 
modify deskripsi varchar(100) first;

alter table barang
modify deskripsi text after nama_barang;








