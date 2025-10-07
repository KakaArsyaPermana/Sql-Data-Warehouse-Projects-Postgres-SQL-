-- =============================================================
-- MEMBUAT SEMUA VIEW UNTUK DATA ANALISIS di schema platinum
-- =============================================================

-- View Produk di schema platinum
CREATE VIEW platinum.dim_products_analytics AS
SELECT 
    product_key, 
    product_name, 
    category, 
    sub_category
FROM gold.dim_products;

-- View Customer di schema platinum
CREATE VIEW platinum.dim_customer_analytics AS
SELECT 
    customer_key, 
    first_name, 
    last_name, 
    gender, 
    country, 
    birth_date
FROM gold.dim_customer;

-- View Penjualan
CREATE VIEW platinum.fact_sales_analytics AS
SELECT 
    *
FROM gold.fact_sales;

-- =============================================================
-- MEMBUAT ROLE UNTUK DATA ANALIS
-- =============================================================
CREATE ROLE analytics
WITH INHERIT;
-- =============================================================
-- MEMBERIKAN HAK AKSES KE SCHEMA DAN VIEW
-- =============================================================

-- Hak akses schema gold
GRANT USAGE ON SCHEMA platinum TO analytics;

-- Hak akses view produk
GRANT SELECT ON platinum.dim_products_analytics TO analytics;

-- Hak akses view customer
GRANT SELECT ON platinum.dim_customer_analytics TO analytics;

-- Hak akses view penjualan
GRANT SELECT ON platinum.fact_sales_analytics TO analytics;


-- =============================================================
-- MEMBUAT USER UNTUK DATA ANALIS
-- =============================================================
CREATE ROLE john_analytics 
WITH 
    LOGIN
    PASSWORD 'john_analytics'
    CONNECTION LIMIT 1;

-- Memberikan role analytics ke user john_analytics
GRANT analytics TO john_analytics;


===========================================

===========================================
