-- sales Product -- 
CREATE VIEW platinum.mart_sales_product AS
select 
fs.product_key,
dp.product_name,
dp.category,
dp.sub_category,
dp.product_line,
fs.price,
fs.quantity,
fs.sales_amount,
(fs.sales_amount - dp.cost) as revenue
from gold.fact_sales fs
left join gold.dim_products dp on fs.product_key = dp.product_key



-- customer sales product -- 
CREATE VIEW platinum.mart_sales_customer AS
select 
fs.product_key,
(dc.first_name || ' ' || dc.last_name) as name,
dc.gender,
(extract(year from now()) - extract(year from dc.birth_date)) as age,
dc.country,
dc.marital_status
from gold.fact_sales fs
left join gold.dim_customer dc on fs.customer_key = dc.customer_key

-- shipping --
CREATE VIEW platinum.mart_shipping AS
select 
fs.order_number,
fs.product_key,
fs.order_date,
fs.shipping_date,
fs.due_dt,
dc.country
from gold.fact_sales fs
left join gold.dim_customer dc on fs.customer_key = dc.customer_key
