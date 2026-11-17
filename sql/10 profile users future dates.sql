-- 10 profile users future dates
-- No dates set after the cutoff have been found in the users table.
-- No need to put a date filter.
SELECT
 COUNT(*) AS total_rows,
 COUNTIF(created_at >= TIMESTAMP('2026-11-16')) AS future_rows
FROM 
 `bigquery-public-data.thelook_ecommerce.users`
