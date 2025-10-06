-- dim_customer ---
DROP MATERIALIZED VIEW IF EXISTS gold.dim_customer;

CREATE MATERIALIZED VIEW gold.dim_customer AS (
SELECT 
  ROW_NUMBER() OVER (ORDER BY ci.cst_id)::INT AS customer_key,  -- surrogate key
  ci.cst_id AS customer_id,   -- id untuk fact_crm_details --
  ci.cst_key AS customer_number,  -- id c--
  ci.cst_firstname AS first_name,
  ci.cst_lastname AS last_name,
  CASE -- data integration --
    WHEN ci.cst_gndr = 'n/a' THEN ec.gen 
    WHEN ci.cst_gndr != ec.gen THEN ci.cst_gndr 
    ELSE ci.cst_gndr
  END AS gender,
  el.cntry AS country,
  ec.bdate AS birth_date, -- bisnis logic -- 
  ci.cst_marital_status AS marital_status,
  ci.cst_create_date AS create_date
FROM silver."crm_cust_info" ci
LEFT JOIN silver."erp_cust_az12" ec ON ci.cst_key = ec.cid
LEFT JOIN silver."erp_loc_a101" el ON ci.cst_key = el.cid
);

-- dim_product --
DROP MATERIALIZED VIEW IF EXISTS gold.dim_products;

CREATE MATERIALIZED VIEW gold.dim_products AS (
SELECT 
  ROW_NUMBER() OVER (ORDER BY pd.sls_prd_key)::INT AS product_key, -- surrogate key --
  pd.sls_prd_key AS product_id,
  pd.prd_id AS product_number,
  pd.prd_nm AS product_name,
  pd.prd_cat_key AS category_id,
  epc.cat AS category,
  epc.subcat AS sub_category,
  epc.maintenance,
  pd.prd_cost AS cost,
  pd.prd_line AS product_line,
  pd.prd_start_dt AS start_date
FROM silver."crm_prd_info" pd
LEFT JOIN silver."erp_px_cat_g1v2" epc ON pd.prd_cat_key = epc.id
WHERE pd.prd_end_dt IS NULL
);

-- fact_sales --
DROP MATERIALIZED VIEW IF EXISTS gold.fact_sales;

CREATE MATERIALIZED VIEW gold.fact_sales AS (
SELECT 
  csd.sls_ord_num AS order_number,
  dp.product_key,
  dc.customer_key,
  csd.sls_order_dt AS order_date,
  csd.sls_ship_dt AS shipping_date, 
  csd.sls_due_dt AS due_dt, 
  csd.sls_sales AS sales_amount, 
  csd.sls_quantity AS quantity, 
  csd.sls_price AS price
FROM silver."crm_sales_details" csd
LEFT JOIN gold.dim_customer dc ON dc.customer_id::VARCHAR = csd.sls_cust_id 
LEFT JOIN gold.dim_products dp ON dp.product_id = csd.sls_prd_key
);
