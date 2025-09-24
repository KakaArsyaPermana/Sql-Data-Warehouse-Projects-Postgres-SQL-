/* ===============================================================
   DDL Script : Silver Table 
   =============================================================== 
   Tujuan Script :
      Skrip ini bertujuan untuk Membuat schema & tabel di 'Silver'
   layer dengan memvalidasi jika schema/tabel belum ada maka dibuat,
   jika sudah ada maka digunakan kembali dan Membuat tabel 
   sesuai dengan data (crm,erp dan lain lain) 
   =============================================================== */

-- Buat schema silver jika belum ada
CREATE SCHEMA IF NOT EXISTS silver;

--------------------------------------------------------------
-- CRM: Customer Information
--------------------------------------------------------------
CREATE TABLE IF NOT EXISTS silver.crm_cust_info (
    cst_id              INT,           -- ID Customer
    cst_key             VARCHAR(50),   -- Kode unik customer
    cst_firstname       VARCHAR(50),   -- Nama depan
    cst_lastname        VARCHAR(50),   -- Nama belakang
    cst_marital_status  VARCHAR(50),   -- Status perkawinan
    cst_gndr            VARCHAR(50),   -- Gender
    cst_create_date     DATE           -- Tanggal dibuat
);

--------------------------------------------------------------
-- CRM: Product Information
--------------------------------------------------------------
CREATE TABLE IF NOT EXISTS silver.crm_prd_info (
    prd_id       INT,           -- ID produk
    prd_key      VARCHAR(50),   -- Kode produk
    prd_nm       VARCHAR(50),   -- Nama produk
    prd_cost     INT,           -- Harga pokok
    prd_line     VARCHAR(50),   -- Lini produk
    prd_start_dt TIMESTAMP,     -- Tanggal mulai
    prd_end_dt   TIMESTAMP      -- Tanggal akhir
);

--------------------------------------------------------------
-- CRM: Sales Details
--------------------------------------------------------------
CREATE TABLE IF NOT EXISTS silver.crm_sales_details (
    sls_ord_num  VARCHAR(50),   -- Nomor order
    sls_prd_key  VARCHAR(50),   -- Produk terkait
    sls_cust_id  INT,           -- ID customer
    sls_order_dt INT,           -- Tanggal order
    sls_ship_dt  INT,           -- Tanggal kirim
    sls_due_dt   INT,           -- Tanggal jatuh tempo
    sls_sales    INT,           -- Nilai penjualan
    sls_quantity INT,           -- Jumlah produk
    sls_price    INT            -- Harga jual
);

--------------------------------------------------------------
-- ERP: Lokasi A101
--------------------------------------------------------------
CREATE TABLE IF NOT EXISTS silver.erp_loc_a101 (
    cid    VARCHAR(50),   -- Kode lokasi
    cntry  VARCHAR(50)    -- Negara
);

--------------------------------------------------------------
-- ERP: Customer AZ12
--------------------------------------------------------------
CREATE TABLE IF NOT EXISTS silver.erp_cust_az12 (
    cid    VARCHAR(50),   -- Customer ID
    bdate  DATE,          -- Tanggal lahir
    gen    VARCHAR(50)    -- Gender
);

--------------------------------------------------------------
-- ERP: Product Category G1V2
--------------------------------------------------------------
CREATE TABLE IF NOT EXISTS silver.erp_px_cat_g1v2 (
    id           VARCHAR(50),   -- ID kategori
    cat          VARCHAR(50),   -- Kategori
    subcat       VARCHAR(50),   -- Sub-kategori
    maintenance  VARCHAR(50)    -- Status maintenance
);

--------------------------------------------------------------
-- ETL Log Table
--------------------------------------------------------------
CREATE TABLE IF NOT EXISTS silver.etl_log (
    table_name    VARCHAR,          -- Nama tabel target
    source        VARCHAR,          -- Sumber file/path
    total_row     INT,              -- Jumlah baris data
    time_proces   INTERVAL,         -- Durasi proses ETL
    etl_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
                                   -- Timestamp eksekusi ETL
);

