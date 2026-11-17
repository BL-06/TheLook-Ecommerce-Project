# Cleaning Notes

Notes on the reasoning behind each cleaning step. Queries `01`-`10` in [sql](sql/) profile the raw tables, and each rule below comes from something found there. Queries `11` and `13` create the cleaned tables, and `12`, `14` and `15` check them.

All figures are from a snapshot taken on 16 November 2026. The source dataset is constantly updated, so rerunning the profiling queries later will give slightly different counts.

## Cleaning decisions

| Issue | Finding | Decision |
|---|---|---|
| **Rows dated in the future** | 1,819 of 181,396 order items (about 1%) are dated on or after the cutoff date, with statuses such as Complete and Returned that obviously cannot be true for a future order. `users` has none. | Excluded, using a **fixed cutoff date** (`created_at < 2026-11-16`, complete days only) so that rerunning the query should always gives the same table. |
| **Duplicate IDs** | None in `order_items`. | No action needed. |
| **Missing or invalid values** | No null or non-positive `sale_price`, no null `user_id`, and no item delivered before it shipped. | No action needed. |
| **`shipped_at` earlier than `created_at`** | 35,711 items (about 20% of all items, about 30% of items that have a shipping date) in every shipped status. The gap ranges from under an hour to 95 hours, averaging 37 hours. The even spread is indicative of a systematic fault. | Kept the rows, but **left out `shipped_at` and `delivered_at`** (`delivered_at` is checked against `shipped_at`, which makes it also unreliable). They are not needed for customer value. |
| **Order status** | Five statuses: Shipped, Complete, Processing, Cancelled, Returned. | Kept every row, and added an **`is_revenue` flag** (true for Complete and Shipped, false otherwise) so cancellations and returns can still be analysed. |
| **Young customers** | Ages range from 12 to 70. | Kept them: a parent may have supplied the details, and if they didn't, nothing suggests a 12 year old can't make the purchase themselves. |
| **Personal and granular fields** | Names, emails, street addresses, coordinates, city, state and postcode. | Left out. Not needed for analysis, and too personal to include. |
| **Missing brands** | 153 products (about 0.09% of items) have no brand, found in pandas. | Filled with `'Missing'`. |

## Cleaned tables

Both are stored in a `thelook_clean` BigQuery dataset, but samples can be found in **[sql](sql/)**. Dictionary for what each row means can be found in **[data dictionary](data%20dictionary%20for%20sample.md)**.

- `users_clean`: 100,000 rows, 6 columns (`id`, `age`, `gender`, `country`, `traffic_source`, `created_at`)
- `order_items_clean`: 179,577 rows, 13 columns, including `margin` (sale price minus product cost) and `is_revenue`

## Checks

- 181,396 raw order items minus 1,819 future-dated items equals 179,577 rows in `order_items_clean`.
- For every status, the count in the cleaned table equals the raw count minus the future-dated count.
- Each `is_revenue` value maps to the correct statuses.
- `users_clean` has 100,000 rows and 100,000 distinct ids, matching the raw table (no users fall after the cutoff).
