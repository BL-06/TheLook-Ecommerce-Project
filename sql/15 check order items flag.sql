-- 15 check order items flag
-- Checking that the flags work for the correct status.
-- Complete and shipped are flagged as true, whilst the rest are flagged as false.
-- Numbers add to 179577, so everything seems fine.
SELECT
  status,
  is_revenue,
  COUNT(*) AS n_items
FROM `project-4ac0cd29-6a3c-4bf7-a1e.thelook_clean.order_items_clean`
GROUP BY status, is_revenue
ORDER BY status
