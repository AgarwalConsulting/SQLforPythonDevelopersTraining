-- Read
-- ----
SELECT * FROM users;

-- -- Select Specific Key from JSON

-- Get the "theme" preference for all users
SELECT name, preferences->>'theme' AS theme
FROM users;

-- -- Filter Rows Based on JSON Key Value

-- Find users with "dark" theme
SELECT *
FROM users
WHERE preferences->>'theme' = 'dark';

-- -- Check if a JSON Key Exists

-- Find users with "email" notifications defined
SELECT *
FROM users
WHERE preferences->'notifications' ? 'email';

-------------------------------------------
--- Advanced
-------------------------------------------

-- Find users with email notifications enabled
SELECT *
FROM users
WHERE (preferences->'notifications'->>'email')::BOOLEAN = true;

-- Count users by theme
SELECT preferences->>'theme' AS theme, COUNT(*)
FROM users
GROUP BY preferences->>'theme';
