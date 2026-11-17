-- 08 profile shipped before created by status
-- Processing and Cancelled items would not appear here as this is only looking at items that have been shipped at one point.
-- 16459 shipped, 14005 complete, and 5247 returned.
-- When you compare this table to the table in query 02, you can see that each row in this table accounts for about 30% of the respective rows in the 02 table.
-- This implies a systematic error, hence there is no fear for dropping this data to cause any bias.
-- The course of action I have decided on is to not carry over shipped_at into my cleaned data table.
-- This is because these rows still have use for the data we actually need (like user id, creation date etc), hence dropping this data would be a waste.
-- Not carrying over the shipped_at column ensures we don't accidentally use it in any later calculations.
SELECT
 status,
 COUNT(*) AS n_items
FROM 
 `bigquery-public-data.thelook_ecommerce.order_items`
WHERE 
 created_at > shipped_at
GROUP BY 
 status
ORDER BY 
 n_items DESC
