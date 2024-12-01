import asyncio
import psycopg

async def main():
    # Connect to the database
    async with await psycopg.AsyncConnection.connect("postgresql://localhost:5432/mydatabase") as conn:
        async with conn.cursor() as cur:
            # Execute a query
            await cur.execute("SELECT * FROM person")
            # rows = await cur.fetchall()
            async for row in cur:
                print(row)

# Run the async function
asyncio.run(main())
