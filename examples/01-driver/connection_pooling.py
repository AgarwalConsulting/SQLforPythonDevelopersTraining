from psycopg.pool import ConnectionPool

with psycopg.ConnectionPool("postgresql://localhost:5432/mydatabase", max_size=10) as pool:
    with pool.connection() as conn:
        cur = conn.execute("SELECT * FROM person")

        rows = cur.fetchall()
        for row in rows:
            print(row)
