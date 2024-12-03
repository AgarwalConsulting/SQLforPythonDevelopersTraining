-- Perform a full-text search:

SELECT *
FROM articles
WHERE to_tsvector('english', content) @@ to_tsquery('JSONB & GIN');

-- Search for articles containing any word:

SELECT *
FROM articles
WHERE to_tsvector('english', content) @@ to_tsquery('PostgreSQL | indexing');
