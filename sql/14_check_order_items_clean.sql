-- 14_check_order_items_clean
-- Checking that there are no duplicate ids for items that have been purchased.
-- Expecting 181396 - 1819 = 179577 (181396 from query 01 and 1819 from query 04).
-- 179577 rows and 179577 distinct items, so everything checks out.
SELECT
  COUNT(*) AS total_rows,
  COUNT(DISTINCT purchased_item_id) AS distinct_items
FROM `project-4ac0cd29-6a3c-4bf7-a1e.thelook_clean.order_items_clean`