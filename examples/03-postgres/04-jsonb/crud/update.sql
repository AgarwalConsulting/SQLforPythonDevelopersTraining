--- Update an Entire JSON Object


-- Replace the preferences for a user
UPDATE users
SET preferences = '{"theme": "blue", "notifications": {"email": true, "sms": true}}'
WHERE name = 'Alice';

--- Update a Specific JSON Key


-- Change the "theme" to "green" for a specific user
UPDATE users
SET preferences = jsonb_set(preferences, '{theme}', '"green"')
WHERE name = 'Bob';

--- Add a New Key to JSON


-- Add "language" preference to JSON
UPDATE users
SET preferences = jsonb_set(preferences, '{language}', '"en"')
WHERE name = 'Alice';

--- Remove a Key from JSON


-- Remove "sms" notifications key
UPDATE users
SET preferences = preferences - '{notifications,sms}'
WHERE name = 'Alice';
