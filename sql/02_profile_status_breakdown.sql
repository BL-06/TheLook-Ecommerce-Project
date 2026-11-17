-- 02_profile_status_breakdown
-- Grouped orders by order status, and counted them.
-- 54335 shipped, 45799 complete, 36223 processing, 27175 cancelled, and 17864 returned.
SELECT
 status,
 COUNT(*) AS n_items
FROM 
 `bigquery-public-data.thelook_ecommerce.order_items`
GROUP BY 
 status
ORDER BY 
 n_items DESC