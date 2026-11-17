-- 13_clean_order_items
-- Creates a table where items are joined to product, the shipped_at and delivered_at columns are removed and the timestamp cutoff (2026-11-16) is applied.
-- Shipped_at and delivered_at were removed because about 20% of all items (about 30% of items that have a shipping date) have shipping dates set before creation dates, and delivered_at was only checked against shipped_at so is unreliable.
-- These two columns are also not useful columns for customer value analysis.
-- The margin column gives us the sale price minus cost (to two decimal places).
-- The is_revenue column gives us a flag that tells us whether the row contributes to our revenue (complete and shipped orders) or if it doesn't (any other order status).
-- Order statuses that aren't complete or shipped are still kept for future analysis.
CREATE OR REPLACE TABLE `project-4ac0cd29-6a3c-4bf7-a1e.thelook_clean.order_items_clean` AS 
SELECT
  items.id AS purchased_item_id,
  items.order_id,
  items.user_id,
  items.product_id,
  items.status,
  items.sale_price,
  items.created_at,
  products.category,
  products.brand,
  products.department,
  products.cost,
  ROUND(items.sale_price - products.cost, 2) AS margin,
  CASE
    WHEN items.status IN ('Complete', 'Shipped') THEN TRUE
    ELSE FALSE
  END AS is_revenue
FROM `bigquery-public-data.thelook_ecommerce.order_items` AS items
JOIN `bigquery-public-data.thelook_ecommerce.products` AS products
  ON items.product_id = products.id
WHERE items.created_at < TIMESTAMP('2026-11-16')