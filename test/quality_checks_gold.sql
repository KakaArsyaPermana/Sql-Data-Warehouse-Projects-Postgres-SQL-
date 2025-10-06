/*
===============================================================================
Pemeriksaan Kualitas Data
===============================================================================
Tujuan Skrip:
    Skrip ini melakukan pemeriksaan kualitas untuk memvalidasi integritas, 
    konsistensi, dan akurasi pada Layer Gold. Pemeriksaan ini memastikan:
    - Keunikan surrogate key pada tabel dimensi.
    - Integritas referensial antara tabel fakta dan tabel dimensi.
    - Validasi hubungan antar entitas dalam model data untuk keperluan analitik.

Catatan Penggunaan:
    - Lakukan investigasi dan perbaikan jika ditemukan ketidaksesuaian data.
===============================================================================
*/

-- ====================================================================
-- Pemeriksaan 'gold.dim_customers'
-- ====================================================================
-- Memeriksa keunikan Customer Key pada gold.dim_customers
-- Harapan: Tidak ada hasil (tidak ada duplikasi)
SELECT 
    customer_key,
    COUNT(*) AS jumlah_duplikat
FROM gold.dim_customers
GROUP BY customer_key
HAVING COUNT(*) > 1;

-- ====================================================================
-- Pemeriksaan 'gold.dim_products'
-- ====================================================================
-- Memeriksa keunikan Product Key pada gold.dim_products
-- Harapan: Tidak ada hasil (tidak ada duplikasi)
SELECT 
    product_key,
    COUNT(*) AS jumlah_duplikat
FROM gold.dim_products
GROUP BY product_key
HAVING COUNT(*) > 1;

-- ====================================================================
-- Pemeriksaan 'gold.fact_sales'
-- ====================================================================
-- Memeriksa konektivitas model data antara tabel fakta dan tabel dimensi
SELECT * 
FROM gold.fact_sales f
LEFT JOIN gold.dim_customers c
ON c.customer_key = f.customer_key
LEFT JOIN gold.dim_products p
ON p.product_key = f.product_key
WHERE p.product_key IS NULL OR c.customer_key IS NULL;

