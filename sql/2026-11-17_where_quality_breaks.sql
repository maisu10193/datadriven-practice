-- Where Quality Breaks | DataDriven daily | 2026-11-17 | SQLite
-- Asked in: Deloitte
-- Q: For flagged quality checks only, show tables with avg fail % above 30,
--    worst first, with number of flagged checks and distinct rules.

-- Step 1: Keep only flagged checks (passed = FALSE)
-- Step 2: GROUP BY tbl_name: count checks, count distinct rules, avg fail %
-- Step 3: Keep groups with avg fail % > 30
-- Step 4: Order worst first
SELECT tbl_name,
       COUNT(*) AS failed_checks,
       COUNT(DISTINCT rule) AS distinct_rules,
       ROUND(AVG(fail_pct), 3) AS avg_fail_pct
FROM dq_checks
WHERE passed = FALSE
GROUP BY tbl_name
HAVING AVG(fail_pct) > 30
ORDER BY AVG(fail_pct) DESC;

-- Learned:
-- - Used WHERE (rows) and HAVING (groups) correctly in one query.
-- - COUNT(DISTINCT col) needs brackets around DISTINCT + column.
-- - Wrote GROUP BY in my plan but forgot it in code: check plan vs code.
-- - ROUND(x, 3) to match the decimals in the target.
-- - No CTE needed when there's only one filter step.
