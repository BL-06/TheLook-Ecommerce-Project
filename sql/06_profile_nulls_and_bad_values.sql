-- 06_profile_nulls_and_bad_values
-- Nulls needed to be cleaned have been found, where there are no empty (or wrong values) for sale price, user id and delivery dates. 
-- However, there are 35711 wrong shipping/creation dates, which accounts for about 20% of the database which is significant.
SELECT
 COUNTIF(sale_price IS NULL OR sale_price <= 0) AS nsp,
 COUNTIF(user_id IS NULL) AS nuid,
 COUNTIF(delivered_at < shipped_at) AS nd,
 COUNTIF(shipped_at < created_at) AS ns,
FROM
 `bigquery-public-data.thelook_ecommerce.order_items`