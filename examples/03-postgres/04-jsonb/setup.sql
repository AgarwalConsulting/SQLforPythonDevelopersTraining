CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    preferences JSONB
);

-- Insert a new row with JSON data
INSERT INTO users (name, preferences)
VALUES
('Alice', '{"theme": "dark", "notifications": {"email": true, "sms": false}}'),
('Bob', '{"theme": "light", "notifications": {"email": false, "sms": true}}');
