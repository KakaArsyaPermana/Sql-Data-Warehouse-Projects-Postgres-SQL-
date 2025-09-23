/* ===============================================================
   LoadScript : Bronze Table 
   ================================================================ 
    Tujuan Skrip :
        adalah untuk membuat stored procedure untuk memasukan data 
    kedalam 'bronze' schema dari external csv files 
    
    penjelasan alur dan aksi yang di lakukan di store procedure
    1.    Memvalidasi isi table yang sudah di buat apakah tabel tersebut 
      sudah diisi atau belum  ,jika sudah maka cek isinya , jika belum di 
      load datanya 
    2.    Catat waktu load data
    3.    Memasukan hasil load data ke dalam log dengan isi
        nama tabel , source , total_baris , proces extract , 
        date proses

    Parameter :
    1.Nama_Table
    2.Source

    Cara mengeksekusi :
    call bronze.cek_data('Nama_table','Source'); 

    Noted:
        Semua ini dilakukan dengan GUI Postgres sql pg_admin 
    dan datanya di simpan diluar folder c 
    =============================================================== 
-- ===============================================================
--  Noted:
--    - Jika file CSV ada di C:\Users\..., gunakan \copy di psql
--    - Jika file CSV ada di D:\ atau folder lain, gunakan COPY di Query Tool pgAdmin
-- =========================================================


-- =========================================================
-- 1. Import CSV dengan \copy (SQL Shell psql)
-- =========================================================
-- Contoh:
-- \copy bronze.crm_cust_info 
-- FROM 'C:/Users/User/Documents/Projects/0.Data Warehouse Postgres Sql/DataSet/source_crm/cust_info.csv' 
-- WITH (
--     FORMAT csv, 
--     HEADER true, 
--     DELIMITER ','
-- );


-- =========================================================
-- 2. Import CSV dengan COPY (Query Tool pgAdmin)
-- =========================================================
-- Contoh:
-- COPY bronze.crm_cust_info 
-- FROM 'D:/Project/0.Data Warehouse Postgres Sql/DataSet/source_crm/cust_info.csv' 
-- WITH (
--     FORMAT csv, 
--     HEADER true, 
--     DELIMITER ','
-- );


-- =========================================================
-- 3. Stored Procedure untuk Load Data Bronze
-- =========================================================
CREATE OR REPLACE PROCEDURE bronze.cek_data(
    nt VARCHAR,   -- nama tabel
    sp VARCHAR    -- path file CSV
)
LANGUAGE plpgsql
AS $$
DECLARE
    count_row   INT;
    count_tb    INT;
    start_time  TIMESTAMP;
    end_time    TIMESTAMP;
    time_proces INTERVAL;
BEGIN
    -- Catat waktu mulai
    start_time := clock_timestamp();

    -- BEGIN untuk error handling table
    BEGIN
        -- Cek apakah tabel sudah ada isinya
        EXECUTE format('SELECT count(*) FROM bronze.%I', nt) INTO count_row;
    EXCEPTION
        WHEN undefined_table THEN
            RAISE NOTICE 'Tabel bronze.% tidak ditemukan', nt;
            RETURN;
    END;

    IF count_row > 0 THEN
        RAISE NOTICE 'Tabel % sudah terisi', nt;
    ELSE
        -- Error handling proses insert
        BEGIN
            -- Load data dengan COPY
            EXECUTE format(
                'COPY bronze.%I 
                 FROM %L
                 WITH (FORMAT csv, HEADER true, DELIMITER '','')',
                nt, sp
            );

            -- Cek jumlah data setelah insert
            EXECUTE format('SELECT count(*) FROM bronze.%I', nt) INTO count_tb;
            RAISE NOTICE 'Tabel % berhasil diinsert dengan total baris %', nt, count_tb;
        EXCEPTION
            WHEN OTHERS THEN
                RAISE NOTICE 'Terjadi error saat proses: %', SQLERRM;
        END;

        -- Catat waktu selesai
        end_time := clock_timestamp();

        -- Hitung durasi
        time_proces := age(end_time, start_time);
        RAISE NOTICE 'Durasi proses: %', time_proces;

        -- Masukkan log ke dalam tabel bronze.etl_log
        BEGIN
            INSERT INTO bronze.etl_log (table_name, source, total_row, time_proces)
            VALUES (nt, sp, count_tb, time_proces);

            RAISE NOTICE 'Log ETL untuk tabel % telah dicatat di bronze.etl_log', nt;
        EXCEPTION
            WHEN undefined_table THEN 
                RAISE NOTICE 'Tabel etl_log tidak ada';
        END;
    END IF;
END;
$$;

-- =========================================================
-- 4. Execute Store Procedure Procedure
-- =========================================================

-- Data CRM
call bronze.cek_data('crm_cust_info',     'D:/Project/0.Data Warehouse Postgres Sql/DataSet/source_crm/cust_info.csv');
call bronze.cek_data('crm_prd_info',      'D:/Project/0.Data Warehouse Postgres Sql/DataSet/source_crm/prd_info.csv');
call bronze.cek_data('crm_sales_details', 'D:/Project/0.Data Warehouse Postgres Sql/DataSet/source_crm/sales_details.csv');

-- Data ERP
call bronze.cek_data('erp_cust_az12',     'D:/Project/0.Data Warehouse Postgres Sql/DataSet/source_erp/CUST_AZ12.csv');
call bronze.cek_data('erp_loc_a101',      'D:/Project/0.Data Warehouse Postgres Sql/DataSet/source_erp/LOC_A101.csv');
call bronze.cek_data('erp_px_cat_g1v2',   'D:/Project/0.Data Warehouse Postgres Sql/DataSet/source_erp/PX_CAT_G1V2.csv');
