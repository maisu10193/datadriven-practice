-- Top Product Categories | DataDriven daily | 2026-11-23 | SQLite
-- Asked in: Spark
-- Q: Top 3 categories by transaction count (products rated 3.0+), incl. ties.

-- Step 1: Join 2 tables and keep only rating >= 3
WITH t1 AS (SELECT t.transaction_id, p.category
            FROM transactions t
            INNER JOIN products p
            ON p.product_id = t.product_id
            WHERE p.rating >= 3),
-- Step 2: Count transactions per category
     t2 AS (SELECT category, COUNT(*) AS txn_count
            FROM t1 GROUP BY category),
-- Step 3: Rank
     t3 AS (SELECT *, DENSE_RANK() OVER (ORDER BY txn_count DESC) AS rnk
            FROM t2)
-- Step 4: Keep top 3 ranks
SELECT * FROM t3 WHERE rnk <= 3;

-- Learned:
-- - Window functions can't go in WHERE: rank in a CTE, filter outside.
-- - Ties: ROW_NUMBER 1,2,3 / RANK 1,1,3 / DENSE_RANK 1,1,2. Check the target.
-- - Join: can a row be in the answer with no match? No -> INNER. Yes -> LEFT.
-- - LEFT JOIN + WHERE on right table = INNER JOIN anyway.
