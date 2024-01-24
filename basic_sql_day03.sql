-- pertemuan 3

-- query update untuk menambahkan data pada suatu kolom
update barang 
set deskripsi = 'Indomie goreng'
where kode = 2;

update barang 
set harga = 2500
where kode = 2

-- query untuk menambahkan data pada beberapa kolom
update barang 
set deskripsi = 'Mie sedaap goreng special',
	harga = 3500
where kode = 4

-- query delete untuk menghapus data
delete 
from barang 
where nama_barang = 'Sarimi 2'

-- query select untuk mengambil data dari table
-- gunakan * untuk mengambil seluruh table
select *
from barang 

select *
from admin 

-- ambil beberapa kolom dari table
select nama_barang, deskripsi, harga
from barang; 

select first_name
from admin;

-- query select dan where untuk mengambil data dengan kondisi tertentu
-- operator = dan !=
select first_name, last_name
from admin 
where first_name = 'Jokowi'

select first_name, last_name
from admin 
where first_name != 'Jokowi'

-- operator <, >, <=, >=
select nama_barang, harga, jumlah
from barang
where harga > 1500;

select nama_barang, harga, jumlah
from barang 
where kode < 4;

select nama_barang, harga, jumlah
from barang 
where harga >= 3000;

select nama_barang, harga, jumlah
from barang 
where harga <= 3000;

-- query and untuk menambahan kondisi pada where
select 	nama_barang, harga
from barang
where 	nama_barang = 'Indomie'
		and harga > 2000;
	
-- query or untuk menambahkan kondisi pada where 
select 	nama_barang, harga
from barang
where 	nama_barang = 'Indomie'
		or harga > 1500;









