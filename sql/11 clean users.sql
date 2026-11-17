-- 11 clean users
-- Only selected id, age, gender, country, traffic source and created at because these are sufficient enough to link the order to the customer without exposing personal information.
-- Created at also lets us build cohorts by join date.
-- Only orders before 2026-11-16 are kept.
CREATE OR REPLACE TABLE `project-4ac0cd29-6a3c-4bf7-a1e.thelook_clean.users_clean` AS
SELECT
  id,
  age,
  gender,
  country,
  traffic_source,
  created_at,
FROM 
 `bigquery-public-data.thelook_ecommerce.users`
WHERE created_at < TIMESTAMP('2026-11-16')
