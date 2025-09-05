# Sql-Data-Warehouse-Projects-Postgres-SQL-
Repositori ini berisi implementasi Data Warehouse dari awal (from scratch) berbasis PostgreSQL menggunakan GUI PGAdmin. Proyek ini mencakup:
  1. ETL Process → ekstraksi, transformasi, dan loading data dari berbagai sumber.
  2. Data Modeling → Model Logis seperti
                          Entitas, relasi, atribut, tipe data, schema.
                     Model Fisik seperti
                           Indexing , Partising 
  3. Data Security → manajemen role, akses user, dan pembuatan data mart berbasis views.

# Data Architecture
Arsitektur data dalam proyek ini terinspirasi dari Medallion Architecture (Bronze, Silver, Gold layers) dengan beberapa tambahan layer yang disesuaikan dengan kebutuhan, sehingga alurnya menjadi lebih terstruktur:
<img width="1374" height="500" alt="image" src="https://github.com/user-attachments/assets/62caf40f-e964-481d-b439-fa5202e1bea1" />
 
  1. Extract Layer   (Bronze):
       - Menyimpan data mentah dari sistem sumber.
       - Data diserap dari berkas CSV ke dalam basis data Postgres SQL.
  2. Transfrom Layer (Silver):
       - Lapisan ini mencakup proses pembersihan, standarisasi, dan normalisasi data untuk menyiapkan data untuk analisis
       - Menyiapkan data agar lebih konsisten dan siap digunakan untuk analisis.
  3.Data Modeling Layer (Gold):
      - Lapisan ini mencakup proses  data model logis dan data model fisik
      - Menerapkan schema untuk mendukung kebutuhan analitik.
  4. Data Mart & Security Layer (Additional Layer)
       - Role Access Management untuk membatasi hak akses sesuai kebutuhan pengguna.
       - Membuat functions untuk mempermudah end-user dalam mengakses data.
       - Membangun Data Mart berbasis views sehingga data siap digunakan untuk kebutuhan bisnis.
    
      
