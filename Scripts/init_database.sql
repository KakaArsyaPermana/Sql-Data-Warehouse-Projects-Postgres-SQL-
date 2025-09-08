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

-- Membuat database dengan owner de_owner -- 
create database datawarehouse with
owner ='de_owner'

-- Noted dilakukan query pada database datawarehouse dengan login menggunakan role de_owner --

-- Membuat shcema untuk proses etl di stagging area dengan format (stg_namalayer)  dan warehouse dengan format (wh_namalayer)--
-- schema extract -- 
create schema stg_extract 

-- schema transfrom -- 
create schema stg_transfrom  

-- schema modeling -- 
create schema wh_modeling 

-- schema security -- 
create schema wh_security 

