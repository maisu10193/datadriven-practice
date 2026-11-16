-- The Extremes | DataDriven daily | 2026-11-16 | SQLite
-- Asked in: City and County of San Francisco
-- Q: Find the 3 most and 3 least expensive services by total cost.
--    Only count positive amounts (leave out negative credits). Cheapest first.

-- Step 1: Only select amount > 0
-- Step 2: Sum all amount GROUP BY svc_name
WITH t1 AS (SELECT svc_name, SUM(amount) AS total_amount
            FROM cloud_costs
            WHERE amount > 0
            GROUP BY svc_name),
-- Step 3: Add 2 columns of ROW_NUMBER (1 is ASC and 1 is DESC)
     t2 AS (SELECT *,
                   ROW_NUMBER() OVER (ORDER BY total_amount DESC) AS rnk_high,
                   ROW_NUMBER() OVER (ORDER BY total_amount ASC) AS rnk_low
            FROM t1)
-- Step 4: Order for cheapest services first by ASC the total amount
SELECT svc_name, total_amount
FROM t2
WHERE rnk_high <= 3 OR rnk_low <= 3
ORDER BY total_amount ASC;

-- Learned:
-- 1. WHERE filters rows BEFORE GROUP BY. HAVING filters groups AFTER,
--    with SUM/COUNT/AVG. No SUM/COUNT/AVG -> use WHERE.
-- 2. "Exactly 3" -> ROW_NUMBER (RANK/DENSE_RANK can give more if ties).
-- 3. Top 3 + bottom 3 together: rank DESC and ASC in one CTE,
--    then WHERE rnk_high <= 3 OR rnk_low <= 3. No JOIN needed.
-- 4. Only one WITH; separate CTEs with a comma.
