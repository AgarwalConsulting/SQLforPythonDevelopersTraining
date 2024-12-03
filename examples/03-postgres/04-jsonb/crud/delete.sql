--- Delete Rows Based on JSON Key Value

-- Delete users with "light" theme
DELETE FROM users
WHERE preferences->>'theme' = 'light';

--- Remove a Specific Key from JSON (Without Deleting Row)

-- Remove "theme" from preferences
UPDATE users
SET preferences = preferences - 'theme'
WHERE name = 'Alice';
