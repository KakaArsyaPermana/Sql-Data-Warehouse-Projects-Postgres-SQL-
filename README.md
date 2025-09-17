# Sql-Data-Warehouse-Projects-Postgres-SQL-
Repositori ini berisi implementasi Data Warehouse dari awal (from scratch) berbasis PostgreSQL menggunakan GUI PGAdmin. Proyek ini mencakup:
  1. ETL Process → ekstraksi, transformasi, dan loading data dari berbagai sumber.
  2. Data Modeling → Model Logis seperti
                          Entitas, relasi, atribut, tipe data, star schema.
                     Model Fisik seperti
                           Indexing , Partising 
  3. Data Security → manajemen role, akses user, dan pembuatan data mart berbasis views.

# Data Architecture
Arsitektur data dalam proyek ini terinspirasi dari Medallion Architecture (Bronze, Silver, Gold) Layers dengan tambahan PLatinum layer yang disesuaikan dengan kebutuhan, sehingga alurnya menjadi lebih terstruktur:
<img width="1618" height="751" alt="image" src="https://github.com/user-attachments/assets/cbe34719-925a-483a-bf21-3ba5354eb504" />

 
  1. Extract Layer   (Bronze):
       - Menyimpan data mentah dari sistem sumber.
       - Data diserap dari berkas CSV ke dalam basis data Postgres SQL.
  
  2. Transfrom Layer (Silver):
       - Lapisan ini mencakup proses pembersihan, standarisasi, dan normalisasi data untuk menyiapkan data untuk analisis
       - Menyiapkan data agar lebih konsisten dan siap digunakan untuk analisis.
    
  3. Data Modeling Layer (Gold):
       - Membuat logical data model dan physical data model.
       - Menerapkan star schema untuk mendukung kebutuhan analitik.
      
  4. Data Mart & Security Layer (Additional Layer)
       - Role Access Management untuk membatasi hak akses sesuai kebutuhan pengguna.
       - Membuat functions untuk mempermudah end-user dalam mengakses data.
       - Membangun Data Mart berbasis views sehingga data siap digunakan untuk kebutuhan bisnis

    
  
