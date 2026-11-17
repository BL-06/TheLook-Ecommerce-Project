-- 01 profile row count date range
-- Found 181396 rows, where the first order is on 2019-01-13 and the last order is 2026-11-20 (in the future, current date is 2026-11-16).
-- Use ISO dating format for simplicity.
SELECT
 COUNT(*) AS row_count,
 MIN(created_at) AS first_order,
 MAX(created_at) AS last_order
FROM 
 `bigquery-public-data.thelook_ecommerce.order_items`
