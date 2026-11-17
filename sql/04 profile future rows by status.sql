-- 04_profile_future_rows_by_status
-- Counted the number of orders set after the 2026-11-16 cutoff by status, where 556 were shipped, 455 complete, 369 processing, 264 cancelled, and 175 returned orders were found.
-- Date filter will be applied when cleaning.
SELECT
 status,
 COUNT(*) AS n_items
FROM 
 `bigquery-public-data.thelook_ecommerce.order_items`
WHERE created_at >= TIMESTAMP('2026-11-16')
GROUP BY 
 status
ORDER BY 
 n_items DESC
