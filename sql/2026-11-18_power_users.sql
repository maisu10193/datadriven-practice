-- Power Users | DataDriven daily | 2026-11-18 | SQLite
-- Q: Users with 3+ sessions, username + session count, most first.

-- Step 1: Count sessions per user, keep 3+
WITH t1 AS (SELECT user_id, COUNT(*) AS session_count
            FROM user_sessions
            GROUP BY user_id
            HAVING COUNT(*) >= 3)
-- Step 2: Join users for username, order by count
SELECT u.username, t.session_count
FROM t1 t
INNER JOIN users u
ON t.user_id = u.user_id
ORDER BY session_count DESC;

-- Learned:
-- - Ask "who must be in the answer?" Both sides -> INNER. All of one side -> LEFT.
