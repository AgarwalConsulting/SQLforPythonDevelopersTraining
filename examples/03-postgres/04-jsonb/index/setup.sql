CREATE INDEX preferences_gin_idx ON users USING gin (preferences);
