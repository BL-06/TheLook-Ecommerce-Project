-- 09 profile users
-- This table tells us that the youngest person is 12, the oldest person is 70, there are no null emails and there are 16 distinct countries in the "users" table.
-- Youngest age won't be removed as they could have been assisted by parents and there is nothing to imply that 12 year olds are not allowed to make purchases.
-- This tells us there is no need to fix anything from the query generated table yet.
SELECT
 MIN(age) AS min_age,
 MAX(age) AS max_age,
 COUNTIF(email IS NULL) AS null_emails,
 COUNT(DISTINCT country) AS distinct_countries,
FROM
 `bigquery-public-data.thelook_ecommerce.users`
