# Sql-Data-Warehouse-Projects-Postgres-SQL-
Repositori ini berisi implementasi Data Warehouse dari awal (from scratch) berbasis PostgreSQL menggunakan GUI PGAdmin. Proyek ini mencakup:
  1. ETL Process → ekstraksi, transformasi, dan loading data dari berbagai sumber.
  2. Data Modeling → Model Logis seperti
                          Entitas, relasi, atribut, tipe data, star schema.
                     Model Fisik seperti
                           Indexing , Partising 
  3. Data Security → manajemen role, akses user, dan pembuatan data mart berbasis views.

# 🏗️ Data Warehouse Design Architecture – PostgreSQL
Arsitektur data dalam proyek ini terinspirasi dari konsep Medallion Architecture (Bronze, Silver, Gold) dengan tambahan Platinum Layer yang disesuaikan dengan kebutuhan keamanan dan akses pengguna.
Pendekatan ini membuat alur data menjadi lebih terstruktur, mudah dikelola, dan siap digunakan untuk analisis bisnis maupun machine learning.Diagram di bawah menggambarkan arsitektur Data Warehouse berbasis PostgreSQL yang memisahkan tahapan Extract, Transform, Modeling, dan Consume secara jelas.
<img width="1763" height="817" alt="image" src="https://github.com/user-attachments/assets/17fec0f0-4980-4153-86b1-bf30de8823f7" />


 
# 📁 1. Source

**Sumber data** berasal dari beberapa sistem operasional utama:

- **CRM** (Customer Relationship Management)
- **ERP** (Enterprise Resource Planning)
- **Flat Files** (CSV) — disimpan sementara di local storage sebelum dimuat ke sistem data warehouse.

**🎯 Tujuan:**
Mengumpulkan data mentah dari berbagai sumber sebelum proses transformasi.

---

# 🥉 2. Extract Layer (Bronze Layer)

- **Nama Layer:** Raw Data  
- **Object Type:** Tables

## 🔹 Proses Load
- **Batch Processing** — pemrosesan data dalam batch terjadwal.
- **Full Load** — pemuatan seluruh dataset.
- **Truncate & Insert** — menghapus data lama dan menggantinya dengan data baru.

**🎯 Tujuan:**
Menyimpan data mentah (raw) tanpa transformasi untuk keperluan audit, historis, dan validasi sumber.

---

# 🥈 3. Transform Layer (Silver Layer)

- **Nama Layer:** Transform Data  
- **Object Type:** Tables

## 🔹 Proses Load
- Batch Processing  
- Full Load  
- Truncate & Insert

## 🔹 Proses Transformasi
- **Data Cleansing:** menghapus duplikasi dan memperbaiki data invalid.
- **Data Standardization:** menyeragamkan format data (contoh: tanggal, kode negara, dll).
- **Data Normalization:** membentuk struktur relasional antar tabel.
- **Derived Columns:** menambah kolom hasil perhitungan.
- **Data Enrichment:** memperkaya data dengan informasi tambahan dari sumber lain.

**🎯 Tujuan:**
Menghasilkan data yang sudah bersih, konsisten, dan siap untuk dimodelkan ke tahap berikutnya.

---

# 🥇 4. Data Modeling Layer (Gold Layer)

- **Nama Layer:** Business Ready Data  
- **Object Type:** Tables / Materialized Views

## 🔹 Proses Load
Menggunakan **Materialized View** untuk meningkatkan performa query dan mengurangi beban komputasi berulang.

## 🔹 Transformasi & Model
- **Data Integration:** menggabungkan data dari berbagai sumber (CRM, ERP, CSV).
- **Aggregation:** menghitung metrik dan indikator bisnis (mis. total penjualan, jumlah pelanggan).
- **Business Logic:** menerapkan aturan bisnis sesuai kebutuhan organisasi.
- **Performance Management:** mengoptimalkan indeks dan agregasi.
- **Data Mart Creation:** membuat data mart tematik (penjualan, pelanggan, produk).
- **Function for End User:** menyediakan fungsi SQL siap pakai untuk pengguna.

## 🧩 Model Data
- Star Schema  
- Flat Table  
- Aggregate Table

**🎯 Tujuan:**
Menyediakan data yang telah terintegrasi dan siap digunakan untuk analisis bisnis atau pelaporan strategis.

---

# 💎 5. Data Mart & Security Layer (Platinum Layer)

- **Nama Layer:** Data Mart & Function  
- **Object Type:** Views

## 🔹 Proses Load
Tidak memerlukan proses load langsung karena berbasis view.

## 🔹 Transformasi & Fungsi
- **Role-Based Access:** manajemen hak akses pengguna terhadap data.
- **Security Layer:** memastikan kontrol keamanan antar pengguna dan modul.
- **Analytic Views:** menyediakan view atau materialized view khusus untuk analisis.

**🎯 Tujuan:**
Memberikan data siap analisis dengan keamanan tinggi dan kontrol akses yang fleksibel untuk setiap user.

---

# 📊 6. Consume Layer

Lapisan akhir tempat pengguna berinteraksi dengan data hasil olahan.

## 🔹 Metode Konsumsi
- **Visualization:** integrasi dengan BI tools (Power BI, Tableau, Metabase, dsb).
- **Ad-hoc SQL Queries:** eksplorasi data langsung oleh data analyst / scientist.
- **Machine Learning:** dataset siap pakai untuk model AI/ML.

**🎯 Tujuan:**
Mendukung proses pengambilan keputusan berbasis data dan pengembangan analitik lanjut.
