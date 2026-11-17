-- 07 profile shipped before created gap
-- The maximum gap between these error arows are 95 hours, the minimum gap is 0 hours and the average gap is about 37 hours. 
-- These are quite huge gaps, so there is something wrong in these rows.
SELECT
 MAX(TIMESTAMP_DIFF(created_at, shipped_at, HOUR)) AS max_gap,
 MIN(TIMESTAMP_DIFF(created_at, shipped_at, HOUR)) AS min_gap,
 AVG(TIMESTAMP_DIFF(created_at, shipped_at, HOUR)) AS avg_gap,
FROM
 `bigquery-public-data.thelook_ecommerce.order_items`
WHERE
 created_at > shipped_at
