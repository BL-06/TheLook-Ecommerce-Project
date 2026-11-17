-- 03 profile future dated rows
-- Found the amount of rows where the order date is after the cutoff (2026-11-16).
-- 1819 rows after cutoff out of 181396 total rows.
SELECT
 COUNT(*) AS total_rows,
 COUNTIF(created_at >= TIMESTAMP('2026-11-16')) AS future_rows
FROM 
 `bigquery-public-data.thelook_ecommerce.order_items`
