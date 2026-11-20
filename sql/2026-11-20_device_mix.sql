-- Device Mix | DataDriven daily | 2026-11-20 | SQLite
-- Q: Devices with a browser: count per device type + OS, keep pairs with 3+.

-- Step 1: Only keep browser IS NOT NULL
-- Step 2: GROUP BY device_type and os_name where count >= 3
SELECT device_type, os_name, COUNT(*) AS device_count
FROM devices
WHERE browser IS NOT NULL
GROUP BY device_type, os_name
HAVING COUNT(*) >= 3;

-- Learned:
-- - Check browser values: SELECT browser, COUNT(*) FROM devices GROUP BY browser;
-- - Check device_id duplicates: SELECT COUNT(*), COUNT(DISTINCT device_id) FROM devices;
