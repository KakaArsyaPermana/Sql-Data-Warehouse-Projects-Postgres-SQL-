/* create database dan schema 
 

*/

-- noted dilakukan pada query pada database bawaan postgressql yaitu postgres  (jika belum ada database sama sekali) --
-- Memeriksa apakah nama database yang ingin dibuat sudah ada atau belum --
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT FROM pg_database WHERE datname = 'datawarehouse'
  ) THEN
    RAISE NOTICE 'Database belum ada';
  ELSE 
    RAISE NOTICE 'Database sudah ada';
  END IF;
END$$ 
LANGUAGE plpgsql;

-- Membuat role owner untuk database --
create role de_owner with 
	login 
	password  'de_owner'
-- Membuat role owner menjadi superuser supaya bisa access banyak hal
ALTER ROLE de_owner WITH SUPERUSER;
-- Membuat database dengan owner de_owner -- 
create database datawarehouse with
owner ='de_owner'

-- Noted dilakukan query pada database datawarehouse dengan login menggunakan role de_owner --
-- schema extract -- 
create schema bronze 

-- schema transfrom -- 
create schema silver  

-- schema modeling -- 
create schema gold 

-- schema mart & security --
create schema platinum
