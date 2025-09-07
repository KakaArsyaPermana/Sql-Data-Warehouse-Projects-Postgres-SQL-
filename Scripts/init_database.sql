/* create database dan schema 
 

*/


Mengecek apakah nama database yang ingin dibuat sudah ada atau belum
SELECT datname
FROM pg_database
WHERE datname = 'datawarehouse';

-- membuat Database 'DataWarehouse'
create database DataWarehouse; 

-- membuat schema dari semua layer -- 
-- extract layer -- 
create schema extract;
-- extract transform -- 
create schema transform;

-- extract Modeling -- 
create schema Modeling;

-- extract security -- 
create schema security;
