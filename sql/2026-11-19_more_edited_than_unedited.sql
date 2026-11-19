-- Days with More Edited Than Unedited Messages | DataDriven daily | 2026-11-19 | SQLite
-- Asked in: Google
-- Q: Return all messages posted on days with more edited than unedited messages.

-- Step 1: Convert sent_at to date
-- Step 2: Count edited and non-edited per date (NULL = non-edited)
WITH t1 AS (SELECT DATE(sent_at) AS sent_date,
                   SUM(CASE WHEN edited = true THEN 1 ELSE 0 END) AS edit_num,
                   SUM(CASE WHEN edited = true THEN 0 ELSE 1 END) AS nonedit_num
            FROM chat_msgs
            GROUP BY DATE(sent_at)
            HAVING SUM(CASE WHEN edited = true THEN 1 ELSE 0 END)
                 > SUM(CASE WHEN edited = true THEN 0 ELSE 1 END))
-- Step 3: Select every message on those days
SELECT *
FROM chat_msgs
WHERE DATE(sent_at) IN (SELECT sent_date FROM t1);

-- Learned:
-- - Timestamp vs date: DATE(col), or range >= day AND < next day.
-- - "Every message" -> no extra filter. Test by removing it: same rows = not needed.
-- - NULL: use IS NULL, never = NULL. Check for NULLs first.
-- - Flip trick: CASE WHEN x = true THEN 0 ELSE 1 END counts false + NULL.
-- - Use AND, not &.
