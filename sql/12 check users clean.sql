-- 12 check users clean
-- Run a check to ensure the amount of rows in the "users_clean" table match query 10.
-- 100,000 rows and 100,000 distinct ids, so matches query 10.
SELECT
  COUNT(*) AS total_rows,
  COUNT(DISTINCT id) AS distinct_ids
FROM 
 `project-4ac0cd29-6a3c-4bf7-a1e.thelook_clean.users_clean`;
