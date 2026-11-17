# Sample Data Notes

Notes on how to read the cleaned data samples in **[sql](sql/)**.

- Each sample is 20 random rows from the matching cleaned table. This is obviously too small to reproduce the analysis of the full tables (counts, means, modes), so do not take those as fact.
- The `order_items_clean` sample was filled with `'Missing'` in pandas, so said rows may appear as null in the BigQuery table.
- The source data is the constantly updating `bigquery-public-data.thelook_ecommerce` dataset, and all figures in this project come from a snapshot taken on 16 November 2026.
- See the [cleaning notes](../../cleaning_notes.md) for the reasoning behind the cleaning steps.

## users_clean_sample.csv

Full table: 100,000 rows, one per customer.

| Column | Type | Meaning |
|---|---|---|
| `id` | integer | Customer id. Matches `user_id` in `order_items_clean`. |
| `age` | integer | Customer age, ranging from 12 to 70. |
| `gender` | string | Gender. |
| `country` | string | Customer country (16 different countries). |
| `traffic_source` | string | How the customer found the site. |
| `created_at` | timestamp (UTC) | When the customer account was created, only including accounts before 2026-11-16. |

## order_items_clean_sample.csv

Full table: 179,577 rows, one per purchased item.

| Column | Type | Meaning |
|---|---|---|
| `purchased_item_id` | integer | Unique id of the purchased item. |
| `order_id` | integer | The order the item belongs to, where one order can contain several items. |
| `user_id` | integer | The customer who bought the item. Matches `id` in `users_clean`. |
| `product_id` | integer | The product that was bought, where many items can share a product. |
| `status` | string | Shipped, Complete, Processing, Cancelled or Returned. |
| `sale_price` | float | Price the item was sold for. |
| `created_at` | timestamp (UTC) | When the item was ordered, where only items created before 2026-11-16 are included. |
| `category` | string | Product category. |
| `brand` | string | Product brand, where `Unknown` was filled in where the brand was missing. |
| `department` | string | Product department. |
| `cost` | float | What the product cost the business. |
| `margin` | float | `sale_price` minus `cost`, rounded to 2 decimal places. |
| `is_revenue` | boolean | True for Complete and Shipped items, false for Processing, Cancelled and Returned. |

## Columns left out

- `shipped_at` and `delivered_at`: unreliable (about 20% of items were shipped before they were created) and not needed for customer value.
- Names, emails, street addresses, coordinates, city, state and postcode: too personal and not needed to group on.
