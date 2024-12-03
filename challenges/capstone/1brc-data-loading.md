# 1 Billion Row Challenge

## 1. Database Preparation

### Schema Design

Prepare a simple table to accommodate the data:

```sql
CREATE TABLE billion_rows (
    id BIGSERIAL PRIMARY KEY,
    value TEXT NOT NULL,
    created_at TIMESTAMP NOT NULL
);
```

### PostgreSQL Configuration

Optimize PostgreSQL for bulk operations (temporarily):

- Increase `maintenance_work_mem` for index creation.

- Temporarily disable WAL writing (`fsync=off`, `synchronous_commit=off`).

- Set `work_mem` and `max_wal_size` to higher values.

Update `postgresql.conf`:

```conf
fsync = off
synchronous_commit = off
full_page_writes = off
checkpoint_timeout = 30min
```

Restart PostgreSQL after updating the configuration.

---

## 2. Data Generation

Use PostgreSQL's own SQL capabilities with **`generate_series`** to create a massive dataset efficiently.

### SQL Data Generation

```sql
INSERT INTO billion_rows (value, created_at)
SELECT
    md5(random()::text), -- Generate random strings
    NOW() - (random() * INTERVAL '365 days') -- Random timestamps
FROM generate_series(1, 1000000000);
```

This approach:

- Uses `generate_series` to create a virtual table with 1 billion rows.

- Generates random text using `md5` and random timestamps within the past year.

---

## 3. Data Loading Optimization

### Parallelization

PostgreSQL supports parallel query execution, but loading 1 billion rows might still take time. Split the data generation into smaller chunks to speed up the process.

Example:

```bash
psql -c "
INSERT INTO billion_rows (value, created_at)
SELECT md5(random()::text), NOW() - (random() * INTERVAL '365 days')
FROM generate_series(1, 100000000);
" &
# Repeat the command multiple times with adjusted row counts
```

Alternatively, you can use **parallel processing tools** like `pgbench` or Python multiprocessing.

---

## 4. Post-Load Tasks

After completing the load:

1. **Re-enable constraints and indexes**:

   ```sql
   ALTER TABLE billion_rows ADD CONSTRAINT pk_id PRIMARY KEY (id);
   CREATE INDEX idx_value ON billion_rows (value);
   ```

2. **Analyze the table** to update statistics:

   ```sql
   VACUUM ANALYZE billion_rows;
   ```

---

## 5. Monitoring and Validation

Use `pg_stat_activity` to monitor active queries and `pg_stat_progress_copy` for `COPY` commands:

```sql
SELECT * FROM pg_stat_activity;
```

To verify the row count:

```sql
SELECT COUNT(*) FROM billion_rows;
```
