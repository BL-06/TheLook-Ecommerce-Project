-- 05_profile_duplicate_ids
-- Running to find any duplicate ids in the dataset, where there are no duplicate ids. 
-- HAVING is used instead of WHERE as WHERE runs before GROUP BY does, so wouldnt be able to give any ids with a count above 1. 
-- If there were duplicates, I'd investigate these duplicated rows and look at them next to each other. 
-- If the entire row repeats, I'd use SELECT DISTINCT to pull only one of the rows. 
-- If only the id repeats, I'd look at which row makes more sense to keep.
SELECT
 id,
 COUNT(*) as n_rows
FROM
 `bigquery-public-data.thelook_ecommerce.order_items`
GROUP BY
 id
HAVING COUNT(*) > 1