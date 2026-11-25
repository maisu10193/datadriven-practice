-- The Lion's Share | DataDriven daily | 2026-11-25 | SQLite
-- Asked in: Allstate
-- Q: Total revenue and number of purchases per category, biggest first.

-- Step 1: Join to get category column
WITH t1 AS (SELECT t.product_id, p.category, t.transaction_id, t.total_amount
            FROM transactions t
            INNER JOIN products p
            ON p.product_id = t.product_id)
-- Step 2: SUM total_amount and COUNT transactions
SELECT category, SUM(total_amount) AS total_revenue, COUNT(*) AS transaction_count
FROM t1
GROUP BY category
ORDER BY SUM(total_amount) DESC;

-- Learned:
-- - LEFT JOIN keeps all rows from the FIRST table.
--   products LEFT JOIN transactions = every product, not every purchase.
--   Every purchase -> transactions first (or INNER if all have a product).
-- - Don't add filters the question doesn't ask for (quantity > 0 dropped a £0 row).
-- - Column names must match the target exactly (transaction_count).
